import numpy as np
from numba import jit

# Pauli matrices
sx = np.array([[0, 1], [1, 0]], dtype=np.complex128)
sy = np.array([[0, -1j], [1j, 0]], dtype=np.complex128)
sz = np.array([[1, 0], [0, -1]], dtype=np.complex128)
si = np.array([[1, 0], [0, 1]], dtype=np.complex128)
S = np.stack((sx, sy, sz), axis=0)


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
    angles = H_norms * dt

    H_pauli_normed = H_pauli / H_norms
    # is h_norm is 0, we get infinities
    # but in that case the rotation angle h_norm * dt is also zero
    # so we don't really care about the rotation axis and we can set
    # the infinities to zero
    H_pauli_normed[np.isinf(H_pauli_normed)] = 0.0
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


def integrate_evolution(H, calc_dt, plot_dt, plot_length, psi_0):
    plot_steps = int(plot_length/plot_dt)
    plot_interval = int(plot_dt/calc_dt)

    calc_t = np.arange(plot_interval*plot_steps, dtype=np.float64)*calc_dt
    H_pauli = assemble_H_paulis(calc_t, *H)

    all_ev_ops = calc_ev_ops(H_pauli, calc_dt)

    plot_ev_ops = np.zeros((plot_steps, 2, 2), dtype=np.complex128)
    for i in range(plot_steps):
        plot_ev_ops[i, :, :] = accumulate_ev_ops(
            all_ev_ops[(i*plot_interval):((i+1)*plot_interval),:,:]
        )

    return accumulate_ev_ops_over_state(plot_ev_ops, psi_0)