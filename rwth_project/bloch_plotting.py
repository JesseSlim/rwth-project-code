import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation


angle_range = np.linspace(0,2*np.pi,1000)
line_range = np.linspace(-1.0, 1.0, 1000)
circle_x = np.cos(angle_range)
circle_y = np.sin(angle_range)
circle_z = np.zeros_like(angle_range)


def init_bloch_sphere():
    fig = plt.figure(figsize=(6, 6))  # (figsize=(7.5,6))
    ax = fig.add_subplot(111, projection='3d')
    ax.set_aspect('equal')
    ax.set_axis_off()
    plt.plot(circle_x, circle_y, circle_z, color='gray')
    plt.plot(circle_z, circle_x, circle_y, color='gray')
    plt.plot(circle_y, circle_z, circle_x, color='gray')
    plt.plot(line_range, circle_z, circle_z, color='gray')
    plt.plot(circle_z, line_range, circle_z, color='gray')
    plt.plot(circle_z, circle_z, line_range, color='gray')

    return fig, ax


# def spher_to_cart(theta, phi, r=1.0):
#     x = r * np.sin(theta) * np.cos(phi)
#     y = r * np.sin(theta) * np.sin(phi)
#     z = r * np.cos(theta)
#     return np.array([x, y, z])


def spher_to_cart(spher, r=1.0):
    result_shape = list(spher.shape)
    result_shape[-1] = 3

    if spher.ndim == 1:
        spher = spher.reshape(1, -1)

    if spher.shape[-1] == 3:
        r = spher[:,-1]

    N = spher.shape[0]
    result = np.zeros((N, 3))

    result[:, 0] = r * np.sin(spher[:, 0]) * np.cos(spher[:, 1])
    result[:, 1] = r * np.sin(spher[:, 0]) * np.sin(spher[:, 1])
    result[:, 2] = r * np.cos(spher[:, 0])

    return result.reshape(result_shape)


def plot_vector(x, y, z, **kw):
    line = plt.plot([0.0, x], [0.0, y], [0.0, z], **kw)
    dot = plt.plot([x], [y], [z], marker='o', zorder=1000, **kw)
    return line, dot


def plot_vector_sph(theta, phi, **kw):
    r = kw.pop('r', 1.0)
    plot_vector(*spher_to_cart(np.array([theta, phi, r])), **kw)


def state_vector_to_bloch_angles(v):
    orig_shape = v.shape
    v = v.reshape(-1, 2)
    results = np.zeros_like(v, dtype=np.float64)

    results[:, 0] = 2 * np.arccos(np.abs(v[:, 0]))
    results[:, 1] = np.angle(v[:, 1]) - np.angle(v[:, 0])

    return results.reshape(orig_shape)


def update_vector(line, c):
    line.set_data([0.0, c[0]], [0.0, c[1]])
    line.set_3d_properties([0.0, c[2]])
    line.set_zorder(-c[1] + 100)


def update_point(point, c):
    point.set_data(c[0:2])
    point.set_3d_properties(c[2:3])


def update_line(line, c):
    line.set_data(c[:,0], c[:,1])
    line.set_3d_properties(c[:,2])


def animate_state_list(psi_t, **kwarg):
    # plot parameters
    axis_width = 5  # line width of the plotted precession axes
    qubit_width = 2  # line width of the qubit state vector
    qubit_marker = 5  # marker size of the qubit state vector endpoint
    trace_width = 1

    trace_endpoint = kwarg.pop('trace_endpoint', False)

    fig, ax = init_bloch_sphere()

    (qb_line,) = plt.plot([], [], [], color='g', animated=True, linewidth=qubit_width)
    (qb_dot,) = plt.plot([], [], [], color='g', animated=True, marker='o', markersize=qubit_marker, linestyle='')

    (trace_line,) = plt.plot([], [], [], color='g', alpha=0.5, animated=True, linewidth=trace_width)

    psi_bloch_s = state_vector_to_bloch_angles(psi_t)
    psi_bloch_c = spher_to_cart(psi_bloch_s)

    def update(i):
        update_vector(qb_line, psi_bloch_c[i, :])
        update_point(qb_dot, psi_bloch_c[i, :])
        if trace_endpoint:
            update_line(trace_line, psi_bloch_c[0:(i+1), :])

    ani = animation.FuncAnimation(fig, update, frames=np.arange(len(psi_t)), **kwarg)

    return ani