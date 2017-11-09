import numpy as np
from numba import jit

# Pauli matrices
sx = np.array([[0, 1], [1, 0]], dtype=np.complex128)
sy = np.array([[0, -1j], [1j, 0]], dtype=np.complex128)
sz = np.array([[1, 0], [0, -1]], dtype=np.complex128)
si = np.array([[1, 0], [0, 1]], dtype=np.complex128)
S = np.stack((sx, sy, sz), axis=0)
Sid = np.stack((si, sx, sy, sz), axis=0)


def multiply_idpauli_matrices(A, B):
    """
    I think I reinvented quaternion multiplication... oh well, I guess it'll work
    :param A:
    :param B:
    :return:
    """
    orig_shape = A.shape
    A = A.reshape(-1, 4)
    B = B.reshape(-1, 4)
    N = A.shape[0]

    B_indices = np.array([
        [0, 1, 2, 3],
        [1, 0, 3, 2],
        [2, 3, 0, 1],
        [3, 2, 1, 0]
    ], dtype=np.int)

    B_prefactors = np.array([
        [1,   1,    1,   1],
        [1,   1,   1j, -1j],
        [1, -1j,    1,  1j],
        [1,  1j,  -1j,   1],
    ], dtype=np.complex128)

    C = np.zeros((N, 4), dtype=np.complex128)

    for i in range(4):
        indices = B_indices[i,:]
        prefactors = B_prefactors[i,:]
        C[:,i] = np.einsum('ij,ij->i', A, B[:, indices] * prefactors[np.newaxis, :])

    return C.reshape(orig_shape)


def calc_rotation_matrices_idpauli(angles, ax_R):
    N = len(angles)
    result = np.zeros((N, 4), dtype=np.complex128)

    result[:,0] = np.cos(angles)
    result[:,1:4] = 1j * np.sin(angles).reshape(-1, 1) * ax_R.reshape(-1, 3)

    return result


def transform_rotating_frame(H_pauli, t, w_R, ax_R):
    N = len(t)
    H_idpauli = np.zeros((N, 4))
    H_idpauli[:,1:4] = H_pauli

    a_R = w_R * t * 0.5

    R1 = calc_rotation_matrices_idpauli(a_R, ax_R)
    R2 = calc_rotation_matrices_idpauli(-a_R, ax_R)

    H_rot_idpauli = multiply_idpauli_matrices(multiply_idpauli_matrices(R1, H_idpauli), R2)
    return H_rot_idpauli[:,1:4] - 0.5 * w_R * ax_R.reshape(-1,3)


def assemble_H_paulis(t, x, y, z):
    """
    Assemble Hamiltonians H(t) in Pauli-decomposed form from functions x(t), y(t) and z(t)
    :param t: array(n) times t at which to evaluate the Hamiltonian
    :param x: function(t) Pauli x-component of H(t)
    :param y: function(t) Pauli y-component of H(t)
    :param z: function(t) Pauli z-component of H(t)
    :return: array(n x 3) list of Hamiltonians H in Pauli-decomposed form, i.e.
    H[i] = H_pauli[i,0] * sx + H_pauli[i,1] * sy + H_pauli[i,2] * sz
    """
    H_pauli = np.zeros((len(t), 3))
    H_pauli[:, 0] = x(t)
    H_pauli[:, 1] = y(t)
    H_pauli[:, 2] = z(t)

    return H_pauli


def calc_ev_ops(H_pauli, dt):
    """
    Calculate evolution operators U[i] = exp[-i H[i] dt] from Hamiltonians H and time intervals dt.
    :param H_pauli: array(n x 3) list of Hamiltonians H in Pauli-decomposed form, i.e.
    H[i] = H_pauli[i,0] * sx + H_pauli[i,1] * sy + H_pauli[i,2] * sz
    :param dt: scalar or array(n) time intervals for which to calculate the evolution operators
    :return: array(n x 2 x 2) list of evolution operators U[i] in matrix form
    """
    N = H_pauli.shape[0]

    H_norms = np.linalg.norm(H_pauli, axis=1).reshape(-1, 1)
    nonzero_norms = H_norms[:,0] > 0
    angles = H_norms * dt

    H_pauli_normed = np.zeros_like(H_pauli)
    # we only care about H (which sets the rotation axis) if the rotation angle \propto norm(H) > 0,
    # otherwise we just leave it zero to avoid division by zero errors
    H_pauli_normed[nonzero_norms,:] = H_pauli[nonzero_norms,:] / H_norms[nonzero_norms,:]
    R_matrix = np.tensordot(H_pauli_normed, S, axes=([1], [0]))

    eyes = np.repeat(np.eye(2)[np.newaxis, :, :], N, axis=0)

    ev_ops = np.cos(angles).reshape(-1, 1, 1) * eyes - 1j * np.sin(angles).reshape(-1, 1, 1) * R_matrix

    return ev_ops


@jit(nopython=True)
def accumulate_ev_ops(ev_ops):
    """
    Calculate the accumulated matrix product U' = U[0] . U[1] . ... . U[n]
    :param ev_ops: array(n x 2 x 2) list of evolution operators U[i] in matrix form
    :return: array(2 x 2) accumulated evolution operator U'
    """
    N = ev_ops.shape[0]

    # complicated way of getting the dtype right for np.eye,
    # apparently, numba doesn't support the dtype parameter for np.eye
    acc_op = np.zeros((2, 2), dtype=np.complex128)
    acc_op[:, :] += np.eye(2)

    for i in range(N):
        acc_op = np.dot(acc_op, ev_ops[i, :, :])

    return acc_op


@jit(nopython=True)
def accumulate_ev_ops_over_state(ev_ops, state):
    """
    Integrate the evolution of a specified state psi[0] by iteratively applying evolution operators U[i], i.e.
    psi[i] = U[i] . psi[i-1]
    :param ev_ops: array(n x 2 x 2) list of evolution operators U[i] in matrix form
    :param state: array(2) initial state vector psi[0]
    :return: array(n x 2) list of values of the state vector psi[i] under evolution
    """
    N = ev_ops.shape[0]
    result = np.zeros((N + 1, 2), dtype=np.complex128)

    result[0, :] = state
    for i in range(N):
        result[i + 1, :] = np.dot(ev_ops[i, :, :], result[i, :])

    return result


def integrate_evolution(H, calc_dt, plot_dt, plot_length, psi_0, rotating_frame=False, w_R=0.0, ax_R=[0.0, 0.0, 1.0]):
    plot_steps = int(plot_length/plot_dt)
    plot_interval = int(plot_dt/calc_dt)

    calc_t = np.arange(plot_interval*plot_steps, dtype=np.float64)*calc_dt
    # we get one plot point for free because the plot_steps parameter actually specifies the number of Hamiltonians
    # to be generated. Including the starting state in the trace means we have one more state in the calculated trace
    plot_t = np.arange(plot_steps+1, dtype=np.float64)*plot_interval*calc_dt
    H_pauli = assemble_H_paulis(calc_t, *H)

    if rotating_frame:
        ax_R = np.array(ax_R)
        H_pauli = transform_rotating_frame(H_pauli, calc_t, w_R, ax_R)

    all_ev_ops = calc_ev_ops(H_pauli, calc_dt)

    plot_ev_ops = np.zeros((plot_steps, 2, 2), dtype=np.complex128)
    # there is no need jitting this loop as the number of times it's executed is fairly low
    # the inner function is jitted anyway so we'd only jit away the loop overhead
    for i in range(plot_steps):
        plot_ev_ops[i, :, :] = accumulate_ev_ops(
            all_ev_ops[(i*plot_interval):((i+1)*plot_interval),:,:]
        )

    return accumulate_ev_ops_over_state(plot_ev_ops, psi_0), plot_t