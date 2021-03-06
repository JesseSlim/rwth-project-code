import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation


angle_range = np.linspace(0,2*np.pi,1000)
line_range = np.linspace(-1.0, 1.0, 1000)
circle_x = np.cos(angle_range)
circle_y = np.sin(angle_range)
circle_z = np.zeros_like(angle_range)


def init_bloch_sphere(central_ball=True, crop_figure=True, fig=None, ax=None):
    if ax == None:
        fig = plt.figure(figsize=(6, 6))  # (figsize=(7.5,6))
        ax = fig.add_subplot(111, projection='3d')
    ax.dist = 6
    ax.set_aspect('equal')
    ax.set_axis_off()
    ax.plot(circle_x, circle_y, circle_z, color='gray', zorder=1001)
    ax.plot(circle_z, circle_x, circle_y, color='gray', zorder=1002)
    ax.plot(circle_y, circle_z, circle_x, color='gray')
    ax.plot(line_range, circle_z, circle_z, color='gray')
    ax.plot(circle_z, line_range, circle_z, color='gray')
    ax.plot(circle_z, circle_z, line_range, color='gray')

    if central_ball:
        ax.plot([0.0], [0.0], [0.0], color='gray', marker='o', markersize=8, zorder=1000)

    return fig, ax

def init_figure(with_H1_plot=True):
    if with_H1_plot:
        fig = plt.figure(figsize=(8, 4), dpi=100)
        ax = fig.add_subplot(121, projection='3d')
        H1ax = fig.add_subplot(122)
        H1ax.set_xlabel("$t$")
        H1ax.set_ylabel("$H_1(t)$")
    else:
        fig = plt.figure(figsize=(4, 4), dpi=100)
        ax = fig.add_subplot(111, projection='3d')
        H1ax = None

    return fig, ax, H1ax


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


def plot_vector(ax, x, y, z, **kw):
    line = ax.plot([0.0, x], [0.0, y], [0.0, z], **kw)
    dot = ax.plot([x], [y], [z], marker='o', zorder=1000, **kw)
    return line, dot


def plot_vector_sph(ax, theta, phi, **kw):
    r = kw.pop('r', 1.0)
    plot_vector(ax, *spher_to_cart(np.array([theta, phi, r])), **kw)


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
    point.set_zorder(-c[1] + 1500)


def update_3d_line(line, c):
    line.set_data(c[:,0], c[:,1])
    line.set_3d_properties(c[:,2])


def animate_state_list(psi_t, H_t=[], scale_H=1.0, H_1=[], plot_t=None, **kwarg):
    # plot parameters
    axis_width = kwarg.pop('axis_width', 5)  # line width of the plotted precession axes
    axis_style = kwarg.pop('axis_style', '--')
    qubit_width = kwarg.pop('qubit_width', 2)  # line width of the qubit state vector
    qubit_marker = kwarg.pop('qubit_marker', 5)  # marker size of the qubit state vector endpoint
    trace_width = kwarg.pop('trace_width', 1)

    if not isinstance(psi_t, list):
        psi_t = [psi_t]

    n_states = len(psi_t)
    n_axes = len(H_t)
    n_pulses = len(H_1)
    n_frames = len(psi_t[0])

    if plot_t is None:
        plot_t = np.arange(n_frames, dtype=np.float64)

    trace_qbstate = kwarg.pop('trace_qbstate', False)
    trace_rotation = kwarg.pop('trace_rotation', False)

    vector_qbstate = kwarg.pop('vector_qbstate', True)
    vector_rotation = kwarg.pop('vector_rotation', True)

    if not isinstance(trace_qbstate, list):
        trace_qbstate = [trace_qbstate] * n_states
    if not isinstance(trace_rotation, list):
        trace_rotation = [trace_rotation] * n_axes
    if not isinstance(vector_qbstate, list):
        vector_qbstate = [vector_qbstate] * n_states
    if not isinstance(vector_rotation, list):
        vector_rotation = [vector_rotation] * n_states

    colors = kwarg.pop('colors', ['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7'])
    axis_colors = kwarg.pop('axis_colors', colors)
    pulse_colors = kwarg.pop('pulse_colors', colors)

    fig, ax, H1ax = init_figure(with_H1_plot=(n_pulses > 0))
    init_bloch_sphere(fig=fig, ax=ax)

    qb_lines = []
    qb_dots = []
    trace_lines = []
    psi_bloch_s = []
    psi_bloch_c = []
    for i in range(n_states):
        (qb_line,) = ax.plot([], [], [], color=colors[i], animated=True, linewidth=qubit_width)
        (qb_dot,) = ax.plot([], [], [], color=colors[i], animated=True, marker='o', markersize=qubit_marker,
                           linestyle='')
        (trace_line,) = ax.plot([], [], [], color=colors[i], alpha=0.5, animated=True, linewidth=trace_width)

        qb_lines.append(qb_line)
        qb_dots.append(qb_dot)
        trace_lines.append(trace_line)
        psi_bloch_s.append(state_vector_to_bloch_angles(psi_t[i]))
        psi_bloch_c.append(spher_to_cart(psi_bloch_s[i]))

    axis_lines = []
    axis_trace_lines = []
    for i in range(n_axes):
        (axis_line,) = ax.plot([], [], [], color=axis_colors[i], animated=True, linewidth=axis_width)
        (axis_trace_line,) = ax.plot([], [], [], color=axis_colors[i], alpha=0.5, animated=True,
                                      linewidth=trace_width)

        axis_lines.append(axis_line)
        axis_trace_lines.append(axis_trace_line)

    pulse_lines = []
    pulse_prelines = []
    pulse_min = 0.0
    pulse_max = 0.0
    for i in range(n_pulses):
        pulse_line = (H1ax.plot([], [], color=pulse_colors[i], animated=True))[0]
        pulse_preline = (H1ax.plot(plot_t, H_1[i], color=pulse_colors[i], animated=True, alpha=0.3))[0]

        pulse_lines.append(pulse_line)
        pulse_prelines.append(pulse_preline)
        pulse_min = min(pulse_min, np.min(H_1[i]))
        pulse_max = max(pulse_max, np.max(H_1[i]))

    if n_pulses > 0:
        H1ax.set_xlim(np.min(plot_t), np.max(plot_t))
        H1ax.set_ylim(pulse_min*1.05, pulse_max*1.05)

    def init_func():
        return qb_lines + qb_dots + trace_lines + axis_lines + axis_trace_lines + pulse_lines

    def update(t):
        redraw = []
        for i in range(n_states):

            if vector_qbstate[i]:
                update_vector(qb_lines[i], psi_bloch_c[i][t, :])
                update_point(qb_dots[i], psi_bloch_c[i][t, :])
                redraw.append(qb_lines[i])
                redraw.append(qb_dots[i])
            if trace_qbstate[i]:
                update_3d_line(trace_lines[i], psi_bloch_c[i][0:(t + 1), :])
                redraw.append(trace_lines[i])

        for i in range(n_axes):
            if vector_rotation[i]:
                update_vector(axis_lines[i], scale_H*H_t[i][t,:])
                redraw.append(axis_lines[i])
            if trace_rotation[i]:
                update_3d_line(axis_trace_lines[i], scale_H * H_t[i][0:(t + 1), :])
                redraw.append(axis_trace_lines[i])

        for i in range(n_pulses):
            pulse_lines[i].set_data(plot_t[0:(t + 1)], H_1[i][0:(t + 1)])

        return redraw

    blit = kwarg.pop('blit', True)

    ani = animation.FuncAnimation(fig, update, frames=np.arange(n_frames), init_func=init_func, blit=blit, **kwarg)

    return ani