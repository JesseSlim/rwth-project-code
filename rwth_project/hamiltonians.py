import numpy as np
import sympy as sp
import sympy.parsing
import sympy.parsing.mathematica

sx, sy, sz = sp.symbols("sx sy sz")
H1D_symbols = sp.symbols("H1 H1D H1DD H1DDD H1DDDD")
ww, a0, phi = sp.symbols("ww a0 phi")

max_H1_coeff_order = len(H1D_symbols) - 1

Heff_mathematica = [
    "(H1*sx)/4",

    "(H1*(H1*sz + 8*sx*ww) + (4*H1D*sy - 2*H1^2*sz)*Cos[2*a0] + 4*H1D*sx*Sin[2*a0])/(32*ww)",

    "(8*H1*(-(H1^2*sx)/4 + H1*sz*ww + 8*sx*ww^2) + 2*(H1^3*sx + 8*H1DD*sx + 16*H1D*sy*ww - 8*H1^2*sz*ww)*Cos[2*a0] - "
    "H1^3*sx*Cos[4*a0] + 2*(H1^3*sy - 8*H1DD*sy + 12*H1*H1D*sz + 16*H1D*sx*ww)*Sin[2*a0] + H1^3*sy*Sin[4*a0])/(256*ww^2)",

    "(-16*H1^2*H1D*sy + H1^4*sz + 16*H1D^2*sz - 32*H1*H1DD*sz + (72*H1^2*H1D*sy - 64*H1DDD*sy - 2*H1^4*sz + 96*H1D^2*sz "
    "+ 128*H1*H1DD*sz)*Cos[2*a0] - 3*H1^2*(-6*H1D*sy + H1^2*sz)*Cos[4*a0] - 24*H1^2*H1D*sx*Sin[2*a0] - "
    "64*H1DDD*sx*Sin[2*a0] + 18*H1^2*H1D*sx*Sin[4*a0])/(2048*ww^3)",

    "(-9*H1^5*sx + 160*H1^2*H1DD*sx + (5*H1^5 - 160*H1*H1D^2 - 160*H1^2*H1DD - 256*H1DDDD)*sx*Cos[2*a0] - H1*(H1^4 - "
    "120*H1D^2 - 100*H1*H1DD)*sx*Cos[4*a0] - H1^5*sx*Cos[6*a0] + (5*H1^5*sy - 480*H1^2*H1DD*sy + 180*H1^3*H1D*sz + "
    "256*(H1DDDD*sy - 5*H1D*H1DD*sz) - 160*H1*(5*H1D^2*sy + 4*H1DDD*sz))*Sin[2*a0] + 2*H1*(2*H1^4*sy - 60*H1D^2*sy - "
    "50*H1*H1DD*sy + 45*H1^2*H1D*sz)*Sin[4*a0] + H1^5*sy*Sin[6*a0])/(16384*ww^4)"
]

max_expansion_order = len(Heff_mathematica) - 1

def generate_Heff_expressions(order):
    Heff_string = Heff_mathematica[order]
    funcs = []
    # we have to do some manual string manipulation to convert the Mathematica strings to SymPy expressions
    # apparently the mathematica.parse function doesn't understand complicated function arguments (i.e. Cos[x] works
    # but Cos[2*x] doesn't get converted properly)
    expr = sp.parsing.mathematica.parse(Heff_string)
    replacements = [
        ('[', '('),
        (']', ')'),
        ('Cos', 'cos'),
        ('Sin', 'sin')
    ]
    for repl in replacements:
        expr = expr.replace(*repl)
    expr = sp.sympify(expr)
    for i in range(3):
        slist = [sx, sy, sz]
        sel_s = slist.pop(i)
        sel_coeff = expr.subs([(sel_s, 1)] + zip(slist, [0, 0]))

        if sel_coeff == 0:
            coeff_f = lambda ww, a0, phi, *args: np.zeros_like(args[0])
        else:
            coeff_f = sp.lambdify((ww, a0, phi) + H1D_symbols, sel_coeff, "numpy")

        funcs.append(coeff_f)

    return funcs

def generate_Heff_functions(exprs_in, ww, a0, phi, H1D_funcs):
    def get_pauli_component(pauli_component, t, exprs_in=exprs_in, ww=ww, a0=a0, phi=phi, H1D_funcs=H1D_funcs):
        # evaluate the local taylor coefficients of H1 at t's
        H1_coeff_values = []
        for H1_coeff_func in H1D_funcs:
            H1_coeff_values.append(H1_coeff_func(t))
        H1_coeff_values += [0.0] * (max_H1_coeff_order + 1 - len(H1D_funcs))

        return exprs_in[pauli_component](ww, a0, phi, *H1_coeff_values)

    return map(lambda pc: lambda t, pc=pc: get_pauli_component(pc, t), [0, 1, 2])