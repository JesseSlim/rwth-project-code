HoldPattern[CommutativeQ[WWreal]] ^= False
 
CommutativeQ[Blank] = False
 
CommutativeQ[BlankNullSequence] = False
 
CommutativeQ[BlankSequence] = False
 
CommutativeQ[Pattern] = False
 
CommutativeQ[Slot] = False
 
CommutativeQ[SlotSequence] = False
 
CommutativeQ[NonCommutativeMultiply`Private`a_List] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[NonCommutativeMultiply`Private`a_SparseArray] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[Subscript[NonCommutativeMultiply`Private`x_, ___]] := 
    CommutativeQ[NonCommutativeMultiply`Private`x]
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)?CommutativeQ[
      NonCommutativeMultiply`Private`x___]] := 
    And @@ CommutativeQ /@ {NonCommutativeMultiply`Private`x}
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)[
      NonCommutativeMultiply`Private`x___]] := False
 
CommutativeQ[_] = True
 
CommutativeQ /: CommutativeQ::Commutative = 
     "Tried to set the `1` \"`2`\" to be commutative."
 
CommutativeQ /: CommutativeQ::CommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be commutative. Please set the symbol \
\"`1`\" to be commutative instead."
 
CommutativeQ /: CommutativeQ::NonCommutative = 
     "Tried to set the `1` \"`2`\" to be noncommutative."
 
CommutativeQ /: CommutativeQ::NonCommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be noncommutative. Please set the \
symbol \"`1`\" to be noncommutative instead."
 
CommutativeQ /: CommutativeQ::usage = "CommutativeQ[expr] is True if \
expression expr is commutative (the default), and False if expr is \
noncommutative.\n\nSee also: SetCommutative, SetNonCommutative."
 
Attributes[Subscript] = {NHoldRest}
 
Subscript[WWreal, 1][t_, t0_] = (-I/8)*(Hd1*t^2*(sx*Cos[phi] + sy*Sin[phi]) - 
      Hd1*t0^2*(sx*Cos[phi] + sy*Sin[phi]) + 
      2*t*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
      2*t0*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
      (Hd1*t*(sy*Cos[phi + 2*t*ww] + sx*Sin[phi + 2*t*ww]))/ww - 
      (Hd1*t0*(sy*Cos[phi + 2*t0*ww] + sx*Sin[phi + 2*t0*ww]))/ww - 
      (Hd1*Sin[(t - t0)*ww]*(sy*Cos[phi + (t + t0)*ww] + 
         sx*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (2*Hd0*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 2][t_, t0_] = 
    (-I/768)*((12*Hd1^2*sz*t*t0^2*Cos[2*(phi + t*ww)])/ww - 
      (4*Hd1^2*sz*t^3*(-2 + 3*Cos[2*(phi + t*ww)]))/ww + 
      (6*Hd1^2*sz*t*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t*ww)]))/ww^3 - 
      (12*Hd1^2*sz*t^2*t0*Cos[2*(phi + t0*ww)])/ww + 
      (4*Hd1^2*sz*t0^3*(-2 + 3*Cos[2*(phi + t0*ww)]))/ww - 
      (6*Hd1^2*sz*t0*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t0*ww)]))/ww^3 - 
      16*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      48*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) - 
      48*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) + 
      16*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      (12*Hd1^2*sz*t*t0*Sin[2*(t - t0)*ww])/ww^2 - 
      (12*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (3*Hd1^2*sz*(Sin[2*(t - t0)*ww] + 6*Sin[2*(phi + t*ww)] - 
         6*Sin[2*(phi + t0*ww)]))/ww^4 + 
      (6*Hd1^2*sz*t^2*(5*Sin[2*(phi + t*ww)] + Sin[2*(phi + t0*ww)]))/ww^2 - 
      (6*Hd1^2*sz*t0^2*(Sin[2*(phi + t*ww)] + 5*Sin[2*(phi + t0*ww)]))/ww^2 - 
      (12*Hd0*(4*Delta*sy*Cos[phi + 2*t*ww] - 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(t - t0)*ww] - 2*Hd0*sz*Sin[2*(phi + t*ww)] + 
         4*Delta*sx*Sin[phi + 2*t*ww] + 2*Hd0*sz*Sin[2*(phi + t0*ww)] - 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (12*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] + Hd0*sz*Sin[2*(t - t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (12*Hd1*t0*(2*Delta*sy*Cos[phi + 2*t*ww] + 6*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(t - t0)*ww] - 
         Hd0*sz*Sin[2*(phi + t*ww)] + 2*Delta*sx*Sin[phi + 2*t*ww] - 
         5*Hd0*sz*Sin[2*(phi + t0*ww)] + 6*Delta*sx*Sin[phi + 2*t0*ww]))/
       ww^2 - (24*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww + 
      (24*Hd1*Sin[(t - t0)*ww]*(4*Delta*sy*Cos[phi + (t + t0)*ww] + 
         4*Delta*sx*Sin[phi + (t + t0)*ww] - 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 + 
      (48*Hd1*t*t0*Sin[(t - t0)*ww]*(2*Delta*sy*Cos[phi + (t + t0)*ww] + 
         2*Delta*sx*Sin[phi + (t + t0)*ww] - 
         Hd0*sz*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] + 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] + 
         4*Delta*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         2*Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 3][t_, t0_] = 
    ((-I/12288)*(16*Hd1*t^2*t0*ww^3*(-3*Hd0^2*sy*Cos[phi] + 
         (16*Delta^2 + 3*Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         3*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 8*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] - 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         3*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 8*Delta^2*sx*Sin[phi + 2*t0*ww]) - 
       16*Hd1*t*t0^2*ww^3*(-3*Hd0^2*sy*Cos[phi] + 8*Delta^2*sy*
          Cos[phi + 2*t*ww] + 16*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sy*Cos[phi + 2*t0*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 16*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] - 3*Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       16*Hd1*t^3*ww^3*(Hd0^2*sy*Cos[phi] - 2*(4*Delta^2 + Hd0^2)*sy*
          Cos[phi + 2*t*ww] - 2*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sy*Cos[phi + 2*t0*ww] + Hd0^2*sy*Cos[3*phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] - 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 2*Hd0^2*sx*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[3*phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       4*Hd0*ww*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         12*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
          Cos[phi + 2*t0*ww] - 3*Hd0^2*sy*Cos[phi + 2*t0*ww] - 
         12*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Cos[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sy*Cos[3*phi + 4*t0*ww] + 
         Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(t - t0)*ww] - 48*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         12*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 3*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] + 12*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww]) - 
       Hd1*t0*ww*(56*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 10*Hd0^2*sy*
          Cos[3*phi + 4*t*ww] + 6*Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
         864*Delta^2*sy*Cos[phi + 2*t0*ww] - 62*Hd0^2*sy*Cos[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Cos[phi]^2*(Cos[phi + 2*t*ww] + 5*Cos[phi + 2*t0*ww]) + 
         64*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 91*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + 98*Hd0^2*sx*Sin[phi] - 
         288*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] - 464*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[phi] + 19*Hd0^2*sx*Cos[2*phi + 4*t0*ww]*
          Sin[phi] - 20*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t*ww] + 192*Delta^2*sx*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 288*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 
         16*Hd0^2*sy*Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 + 48*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]^2 + 
         32*Hd0^2*sx*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         16*Delta*Hd0*sz*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(t - t0)*ww] - 4*Hd0^2*sy*Sin[phi]*Sin[2*(t - t0)*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t0*ww] - 128*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] - 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + t*ww)] + 288*Delta^2*sx*Sin[phi + 2*t*ww] + 
         32*Hd0^2*sx*Sin[phi + 2*t*ww] - 32*Delta*Hd0*sz*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t*ww] + 8*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[2*phi]*Sin[phi + 2*t*ww] - 56*Hd0^2*sx*
          Sin[3*phi + 2*t*ww] - 2*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*phi + 4*t*ww] + 2*Hd0^2*sy*Sin[phi]*Sin[2*phi + 4*t*ww] + 
         10*Hd0^2*sx*Sin[3*phi + 4*t*ww] - 160*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 240*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)] + 864*Delta^2*sx*
          Sin[phi + 2*t0*ww] - 56*Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]^2*Sin[phi + 2*t0*ww] + 
         40*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - 20*Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 12*Hd0^2*sy*Sin[2*(t - t0)*ww]*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t*ww]*
          Sin[phi + 2*t0*ww] - 2*Hd0^2*sy*Sin[2*phi + 4*t*ww]*
          Sin[phi + 2*t0*ww] + 24*Hd0^2*sy*Sin[2*(phi + t0*ww)]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sy*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t0*ww]^2 - 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t0*ww]^2 + 
         4*Cos[phi + 2*t*ww]*(72*Delta^2*sy + 8*Hd0^2*sy - 
           Hd0^2*sx*Sin[2*phi] + 3*Hd0^2*sx*Sin[2*(t - t0)*ww] + 
           8*Delta*Hd0*sz*Sin[phi + 2*t0*ww] + 4*Hd0*Sin[phi]*
            (-(Delta*sz) + Hd0*sy*Sin[phi + 2*t0*ww])) - 
         64*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 25*Hd0^2*sy*Sin[phi]*
          Sin[2*phi + 4*t0*ww] + 81*Hd0^2*sx*Sin[3*phi + 4*t0*ww] - 
         192*Delta^2*sy*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         96*Delta*Hd0*sz*Sin[phi]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         240*Hd0^2*sx*Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)]*
          Sin[phi + (t + t0)*ww] - 288*Delta*Hd0*sz*Sin[(t - t0)*ww]*
          Sin[phi + 2*t0*ww]*Sin[phi + (t + t0)*ww] + 16*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 + 
         16*Hd0^2*sx*Sin[(t - t0)*ww]^2*Sin[phi + 2*t0*ww]*
          Sin[phi + (t + t0)*ww]^2 + 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - 4*Hd0^2*sy*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + 4*Hd0^2*sy*Sin[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - Hd0*Cos[phi]*(144*Hd0*sy - 
           36*Hd0*sy*Cos[2*(t - t0)*ww] - 24*Hd0*sy*Cos[2*(phi + t*ww)] + 
           2*Hd0*sy*Cos[2*phi + 4*t*ww] - 264*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           25*Hd0*sy*Cos[2*phi + 4*t0*ww] + 4*Hd0*sy*
            Cos[2*(phi + (t + t0)*ww)] + 12*Hd0*sx*Sin[2*(t - t0)*ww] + 
           64*Delta*sz*Sin[phi + 2*t*ww] + 2*Hd0*sx*Sin[2*phi + 4*t*ww] + 
           416*Delta*sz*Sin[phi + 2*t0*ww] - 25*Hd0*sx*Sin[2*phi + 4*t0*ww] + 
           4*Hd0*sx*Sin[2*(phi + (t + t0)*ww)]) + 48*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       8*Hd1*t0^3*ww^3*(2*Hd0^2*sy*Cos[phi]^2*Cos[phi + 2*t0*ww] + 
         4*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*Sin[phi] + 
         6*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] + Cos[phi + 2*t0*ww]*
          (4*(4*Delta^2 + Hd0^2)*sy + 8*Delta*Hd0*sz*Sin[phi] - 
           Hd0^2*sx*Sin[2*phi]) + 16*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 8*Delta*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t0*ww] + 4*Hd0^2*sx*Sin[phi + 2*t0*ww] + 
         2*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         8*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww] - 
         2*Hd0*Cos[phi]*(3*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           4*Delta*sz*Sin[phi + 2*t0*ww] + Hd0*sy*(1 - 4*Sin[(t - t0)*ww]*
              Sin[2*phi + (t + t0)*ww]))) - 2*Hd1*Sin[(t - t0)*ww]*
        (-24*Hd0^2*sy*Cos[phi + t*ww - t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 3*t*ww - t0*ww] - 24*Hd0^2*sy*Cos[phi - t*ww + t0*ww] + 
         27*Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sy*
          Cos[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sy*
          Cos[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 76*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         144*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + 24*Hd0^2*sx*
          Sin[phi + t*ww - t0*ww] - 2*Hd0^2*sx*Sin[phi + 3*t*ww - t0*ww] + 
         24*Hd0^2*sx*Sin[phi - t*ww + t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sx*
          Sin[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 76*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         384*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 144*Hd0^2*sx*
          Sin[3*phi + (t + t0)*ww]) - 32*Hd1*t*t0*ww^2*Sin[(t - t0)*ww]*
        (Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] + 
         Hd0^2*sy*Cos[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 4*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         7*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] + Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 4*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         16*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 
         7*Hd0^2*sx*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 64*Hd0*t*t0*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t0^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 4*Hd1*t*ww*
        (-18*Hd0^2*sy*Cos[phi] + (192*Delta^2 + 23*Hd0^2)*sy*
          Cos[phi + 2*t*ww] + 54*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         11*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 12*Hd0^2*sy*
          Cos[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 4*t*ww - 2*t0*ww] + 96*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         14*Hd0^2*sy*Cos[phi + 2*t0*ww] + 18*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sy*Cos[3*phi + 2*(t + t0)*ww] + 18*Hd0^2*sx*Sin[phi] + 
         48*Delta*Hd0*sz*Sin[2*(t - t0)*ww] - 144*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] + 192*Delta^2*sx*Sin[phi + 2*t*ww] + 
         23*Hd0^2*sx*Sin[phi + 2*t*ww] - 54*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 
         11*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 12*Hd0^2*sx*
          Sin[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sx*
          Sin[phi + 4*t*ww - 2*t0*ww] - 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 96*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         14*Hd0^2*sx*Sin[phi + 2*t0*ww] - 18*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sx*Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t^2*ww^2*
        (64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 80*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         112*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         32*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 5*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 16*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 16*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] - 4*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 12*Hd0^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 24*Hd0^2*sy*Sin[phi] - 
         112*Delta^2*sy*Sin[phi + 2*t*ww] - 8*Hd0^2*sy*Sin[phi + 2*t*ww] - 
         32*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 5*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sy*Sin[phi + 2*t*ww - 2*t0*ww] + 16*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sy*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       8*Hd0*t*ww^2*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
         16*Delta*Hd0*sz*Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t*ww)] + 48*Delta^2*sx*Cos[phi + 2*t*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         2*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 4*Hd0*t0*ww^2*
        (72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] + 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(t - t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] + 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 24*Hd0^2*sx*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t0^2*ww^2*
        (-64*Delta*Hd0*sz - 24*Hd0^2*sx*Cos[phi] - 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] + 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         16*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] - Hd0^2*sx*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] + 80*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 112*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] + 32*Hd0^2*sx*Cos[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] - 5*Hd0^2*sx*
          Cos[3*phi + 4*t0*ww] - 12*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] - 
         24*Hd0^2*sy*Sin[phi] - 16*Delta^2*sy*Sin[phi + 2*t*ww] - 
         8*Hd0^2*sy*Sin[phi + 2*t*ww] + 4*Hd0^2*sy*Sin[3*phi + 2*t*ww] + 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] - 6*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] + 112*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Sin[phi + 2*t0*ww] + 32*Hd0^2*sy*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] + 5*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww])))/
     ww^4
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
Hlinbar[tb_, ta_] = (1536*(-(Hd1*ta^2*(sx*Cos[phi] + sy*Sin[phi])) + 
        Hd1*tb^2*(sx*Cos[phi] + sy*Sin[phi]) - 
        2*ta*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
        2*tb*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
        (Hd1*ta*(sy*Cos[phi + 2*ta*ww] + sx*Sin[phi + 2*ta*ww]))/ww + 
        (Hd1*tb*(sy*Cos[phi + 2*tb*ww] + sx*Sin[phi + 2*tb*ww]))/ww - 
        (Hd1*Sin[(-ta + tb)*ww]*(sy*Cos[phi + (ta + tb)*ww] + 
           sx*Sin[phi + (ta + tb)*ww]))/ww^2 + 
        (2*Hd0*Sin[(-ta + tb)*ww]*(sx*Cos[phi + (ta + tb)*ww] - 
           sy*Sin[phi + (ta + tb)*ww]))/ww) + 
      16*((-12*Hd1^2*sz*ta*tb^2*Cos[2*(phi + ta*ww)])/ww + 
        (4*Hd1^2*sz*ta^3*(-2 + 3*Cos[2*(phi + ta*ww)]))/ww - 
        (6*Hd1^2*sz*ta*(Cos[2*(-ta + tb)*ww] + 6*Cos[2*(phi + ta*ww)]))/
         ww^3 + (12*Hd1^2*sz*ta^2*tb*Cos[2*(phi + tb*ww)])/ww - 
        (4*Hd1^2*sz*tb^3*(-2 + 3*Cos[2*(phi + tb*ww)]))/ww + 
        (6*Hd1^2*sz*tb*(Cos[2*(-ta + tb)*ww] + 6*Cos[2*(phi + tb*ww)]))/
         ww^3 + 16*Delta*Hd1*ta^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        48*Delta*Hd1*ta^2*tb*(sy*Cos[phi] - sx*Sin[phi]) + 
        48*Delta*Hd1*ta*tb^2*(sy*Cos[phi] - sx*Sin[phi]) - 
        16*Delta*Hd1*tb^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        (12*Hd1^2*sz*ta*tb*Sin[2*(-ta + tb)*ww])/ww^2 - 
        (6*Hd1^2*sz*ta^2*(5*Sin[2*(phi + ta*ww)] + Sin[2*(phi + tb*ww)]))/
         ww^2 + (6*Hd1^2*sz*tb^2*(Sin[2*(phi + ta*ww)] + 
           5*Sin[2*(phi + tb*ww)]))/ww^2 - 
        (3*Hd1^2*sz*(Sin[2*(-ta + tb)*ww] - 6*Sin[2*(phi + ta*ww)] + 
           6*Sin[2*(phi + tb*ww)]))/ww^4 + 
        (12*Hd1*ta*(6*Delta*sy*Cos[phi + 2*ta*ww] + 2*Delta*sy*
            Cos[phi + 2*tb*ww] - Hd0*sz*Sin[2*(-ta + tb)*ww] - 
           5*Hd0*sz*Sin[2*(phi + ta*ww)] + 6*Delta*sx*Sin[phi + 2*ta*ww] - 
           Hd0*sz*Sin[2*(phi + tb*ww)] + 2*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (12*Hd0*(-4*Delta*sy*Cos[phi + 2*ta*ww] + 
           4*Delta*sy*Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(-ta + tb)*ww] + 
           2*Hd0*sz*Sin[2*(phi + ta*ww)] - 4*Delta*sx*Sin[phi + 2*ta*ww] - 
           2*Hd0*sz*Sin[2*(phi + tb*ww)] + 4*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (12*Hd1*tb*(2*Delta*sy*Cos[phi + 2*ta*ww] + 
           6*Delta*sy*Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(-ta + tb)*ww] - 
           Hd0*sz*Sin[2*(phi + ta*ww)] + 2*Delta*sx*Sin[phi + 2*ta*ww] - 
           5*Hd0*sz*Sin[2*(phi + tb*ww)] + 6*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (24*Hd0*tb*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + Hd0*sz*Cos[2*(phi + tb*ww)] - 
           2*Delta*sx*Cos[phi + 2*tb*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] + 
           2*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (12*Hd1*tb^2*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww + 
        (24*Hd1*Sin[(-ta + tb)*ww]*(4*Delta*sy*Cos[phi + (ta + tb)*ww] + 
           4*Delta*sx*Sin[phi + (ta + tb)*ww] - 3*Hd0*sz*
            Sin[2*phi + (ta + tb)*ww]))/ww^3 + 
        (48*Hd1*ta*tb*Sin[(-ta + tb)*ww]*
          (2*Delta*sy*Cos[phi + (ta + tb)*ww] + 2*Delta*sx*
            Sin[phi + (ta + tb)*ww] - Hd0*sz*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (24*Hd0*ta*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           4*Delta*sx*Cos[phi + 2*ta*ww] + 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(-ta + tb)*ww] + 4*Delta*sy*Sin[phi + 2*ta*ww] + 
           4*Delta*sx*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] - 
           2*Hd0*sz*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (24*Hd1*ta^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] - 
           Hd0*sz*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww) + 
      (-16*Hd1*ta^2*tb*ww^3*(-3*Hd0^2*sy*Cos[phi] + (16*Delta^2 + 3*Hd0^2)*sy*
           Cos[phi + 2*ta*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 
          8*Delta^2*sy*Cos[phi + 2*tb*ww] + 3*Hd0^2*sx*Sin[phi] - 
          4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 16*Delta^2*sx*
           Sin[phi + 2*ta*ww] + 3*Hd0^2*sx*Sin[phi + 2*ta*ww] - 
          3*Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 4*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 8*Delta^2*sx*Sin[phi + 2*tb*ww]) + 
        16*Hd1*ta*tb^2*ww^3*(-3*Hd0^2*sy*Cos[phi] + 8*Delta^2*sy*
           Cos[phi + 2*ta*ww] + (16*Delta^2 + 3*Hd0^2)*sy*
           Cos[phi + 2*tb*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          8*Delta^2*sx*Sin[phi + 2*ta*ww] - 4*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 16*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 3*Hd0^2*sx*Sin[3*phi + 2*tb*ww]) + 
        16*Hd1*tb^3*ww^3*(Hd0^2*sy*Cos[phi] + Hd0^2*sy*Cos[phi + 2*ta*ww] + 
          Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 2*(4*Delta^2 + Hd0^2)*sy*
           Cos[phi + 2*tb*ww] - 2*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
          Hd0^2*sx*Sin[phi] - 4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          Hd0^2*sx*Sin[phi + 2*ta*ww] - Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 
          4*Delta*Hd0*sz*Sin[2*(phi + tb*ww)] - 8*Delta^2*sx*
           Sin[phi + 2*tb*ww] - 2*Hd0^2*sx*Sin[phi + 2*tb*ww] + 
          2*Hd0^2*sx*Sin[3*phi + 2*tb*ww]) + 
        4*Hd0*ww*(-3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*ta*ww] - 
          12*Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 3*Hd0^2*sy*
           Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*Cos[phi + 2*ta*ww - 2*tb*ww] + 
          Hd0^2*sy*Cos[phi + 4*ta*ww - 2*tb*ww] + 96*Delta^2*sy*
           Cos[phi + 2*tb*ww] + 3*Hd0^2*sy*Cos[phi + 2*tb*ww] + 
          12*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 6*Hd0^2*sy*
           Cos[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sy*Cos[3*phi + 4*tb*ww] - 
          Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 48*Delta*Hd0*sz*
           Sin[2*(-ta + tb)*ww] + 48*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] - 
          96*Delta^2*sx*Sin[phi + 2*ta*ww] - 3*Hd0^2*sx*Sin[phi + 2*ta*ww] + 
          12*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 3*Hd0^2*sx*
           Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Sin[phi + 2*ta*ww - 2*tb*ww] + 
          Hd0^2*sx*Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 12*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww]) - 
        Hd1*ta*ww*(64*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 91*Hd0^2*sy*
           Cos[3*phi + 4*ta*ww] + 288*Delta^2*sy*Cos[phi + 2*tb*ww] + 
          32*Hd0^2*sy*Cos[phi + 2*tb*ww] + 8*Hd0^2*sy*Cos[phi]^2*
           (5*Cos[phi + 2*ta*ww] + Cos[phi + 2*tb*ww]) + 
          56*Hd0^2*sy*Cos[3*phi + 2*tb*ww] + 10*Hd0^2*sy*
           Cos[3*phi + 4*tb*ww] + 6*Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
          98*Hd0^2*sx*Sin[phi] - 288*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[phi] + 
          19*Hd0^2*sx*Cos[2*phi + 4*ta*ww]*Sin[phi] - 16*Delta*Hd0*sz*
           Cos[phi + 2*tb*ww]*Sin[phi] - 4*Hd0^2*sx*Cos[phi + 2*tb*ww]*
           Sin[2*phi] + 192*Delta^2*sx*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] + 48*Hd0^2*sx*Sin[phi]*Sin[(-ta + tb)*ww]^2 + 
          32*Hd0^2*sx*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
            2 - 16*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] + 
          12*Hd0^2*sx*Cos[phi + 2*tb*ww]*Sin[2*(-ta + tb)*ww] - 
          4*Hd0^2*sy*Sin[phi]*Sin[2*(-ta + tb)*ww] - 160*Delta*Hd0*sz*
           Sin[2*(phi + ta*ww)] - 240*Hd0^2*sy*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww]*Sin[2*(phi + ta*ww)] + 864*Delta^2*sx*
           Sin[phi + 2*ta*ww] - 56*Hd0^2*sx*Sin[phi + 2*ta*ww] - 
          4*Hd0^2*sx*Cos[phi + 2*ta*ww]^2*Sin[phi + 2*ta*ww] + 
          32*Delta*Hd0*sz*Cos[phi + 2*tb*ww]*Sin[phi + 2*ta*ww] + 
          16*Hd0^2*sy*Cos[phi + 2*tb*ww]*Sin[phi]*Sin[phi + 2*ta*ww] + 
          40*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*ta*ww] - 20*Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*ta*ww] - 12*Hd0^2*sy*Sin[2*(-ta + tb)*ww]*
           Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*Sin[2*(phi + ta*ww)]*
           Sin[phi + 2*ta*ww] - 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*ta*ww]^2 - 
          64*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 25*Hd0^2*sy*Sin[phi]*
           Sin[2*phi + 4*ta*ww] + 81*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 
          128*Delta*Hd0*sz*Sin[2*(phi + tb*ww)] + 288*Delta^2*sx*
           Sin[phi + 2*tb*ww] + 32*Hd0^2*sx*Sin[phi + 2*tb*ww] + 
          8*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*tb*ww] + 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*ta*ww]*
           Sin[phi + 2*tb*ww] - 56*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          2*Hd0^2*sy*Sin[phi]*Sin[2*phi + 4*tb*ww] - 2*Hd0^2*sy*
           Sin[phi + 2*ta*ww]*Sin[2*phi + 4*tb*ww] + 10*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - 192*Delta^2*sy*Sin[(-ta + tb)*ww]*
           Sin[phi + (ta + tb)*ww] + 96*Delta*Hd0*sz*Sin[phi]*
           Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] - 
          240*Hd0^2*sx*Sin[(-ta + tb)*ww]*Sin[2*(phi + ta*ww)]*
           Sin[phi + (ta + tb)*ww] - 288*Delta*Hd0*sz*Sin[(-ta + tb)*ww]*
           Sin[phi + 2*ta*ww]*Sin[phi + (ta + tb)*ww] + 16*Hd0^2*sx*Sin[phi]*
           Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
          16*Hd0^2*sx*Sin[(-ta + tb)*ww]^2*Sin[phi + 2*ta*ww]*
           Sin[phi + (ta + tb)*ww]^2 - 4*Hd0^2*sy*Sin[phi]*
           Sin[2*(phi + (ta + tb)*ww)] + 4*Hd0^2*sy*Sin[phi + 2*ta*ww]*
           Sin[2*(phi + (ta + tb)*ww)] + Hd0*Cos[phi]*(-144*Hd0*sy + 
            36*Hd0*sy*Cos[2*(-ta + tb)*ww] + 264*Hd0*sy*
             Cos[2*(phi + ta*ww)] + 25*Hd0*sy*Cos[2*phi + 4*ta*ww] + 
            24*Hd0*sy*Cos[2*(phi + tb*ww)] - 2*Hd0*sy*Cos[2*phi + 4*tb*ww] - 
            4*Hd0*sy*Cos[2*(phi + (ta + tb)*ww)] - 12*Hd0*sx*
             Sin[2*(-ta + tb)*ww] - 416*Delta*sz*Sin[phi + 2*ta*ww] + 
            25*Hd0*sx*Sin[2*phi + 4*ta*ww] - 64*Delta*sz*Sin[phi + 2*tb*ww] - 
            2*Hd0*sx*Sin[2*phi + 4*tb*ww] - 4*Hd0*sx*
             Sin[2*(phi + (ta + tb)*ww)]) + 2*Cos[phi + 2*ta*ww]*
           (432*Delta^2*sy - 31*Hd0^2*sy - 232*Delta*Hd0*sz*Sin[phi] - 
            10*Hd0^2*sx*Sin[2*phi] - 2*Hd0^2*sx*Sin[2*ta*ww] + 
            2*Hd0^2*sx*Sin[2*tb*ww] - 144*Delta*Hd0*sz*
             Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 
            8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 + 
            6*Hd0^2*sx*Sin[2*(-ta + tb)*ww] - 2*Hd0^2*sy*Sin[phi + 2*ta*ww]^
              2 - 2*Hd0^2*sx*Sin[2*(phi + tb*ww)] - 16*Delta*Hd0*sz*
             Sin[phi + 2*tb*ww] - Hd0^2*sx*Sin[2*phi + 4*tb*ww] + 
            2*Hd0^2*sx*Sin[2*(phi + (ta + tb)*ww)]) + 48*Hd0^2*sx*Sin[phi]*
           Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]) + 
        8*Hd1*ta^3*ww^3*(2*Hd0^2*sy*Cos[phi]^2*Cos[phi + 2*ta*ww] + 
          4*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 2*Hd0^2*sx*Sin[phi] + 
          6*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[phi] + Cos[phi + 2*ta*ww]*
           (4*(4*Delta^2 + Hd0^2)*sy + 8*Delta*Hd0*sz*Sin[phi] - 
            Hd0^2*sx*Sin[2*phi]) + 16*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] - 8*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          16*Delta^2*sx*Sin[phi + 2*ta*ww] + 4*Hd0^2*sx*Sin[phi + 2*ta*ww] + 
          2*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*ta*ww] - Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*ta*ww] - 4*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 
          8*Hd0^2*sx*Sin[phi]*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww] - 
          2*Hd0*Cos[phi]*(3*Hd0*sy*Cos[2*(phi + ta*ww)] - 
            4*Delta*sz*Sin[phi + 2*ta*ww] + Hd0*sy*(1 - 4*Sin[(-ta + tb)*ww]*
               Sin[2*phi + (ta + tb)*ww]))) - 2*Hd1*Sin[(-ta + tb)*ww]*
         (-24*Hd0^2*sy*Cos[phi + ta*ww - tb*ww] - 2*Hd0^2*sy*
           Cos[phi + 3*ta*ww - tb*ww] - 24*Hd0^2*sy*
           Cos[phi - ta*ww + tb*ww] + 27*Hd0^2*sy*Cos[3*phi + 3*ta*ww + 
             tb*ww] - 2*Hd0^2*sy*Cos[phi - ta*ww + 3*tb*ww] + 
          27*Hd0^2*sy*Cos[3*phi + ta*ww + 3*tb*ww] + 576*Delta^2*sy*
           Cos[phi + (ta + tb)*ww] + 76*Hd0^2*sy*Cos[phi + (ta + tb)*ww] + 
          144*Hd0^2*sy*Cos[3*phi + (ta + tb)*ww] + 24*Hd0^2*sx*
           Sin[phi + ta*ww - tb*ww] - 2*Hd0^2*sx*Sin[phi + 3*ta*ww - tb*ww] + 
          24*Hd0^2*sx*Sin[phi - ta*ww + tb*ww] + 27*Hd0^2*sx*
           Sin[3*phi + 3*ta*ww + tb*ww] - 2*Hd0^2*sx*
           Sin[phi - ta*ww + 3*tb*ww] + 27*Hd0^2*sx*
           Sin[3*phi + ta*ww + 3*tb*ww] + 576*Delta^2*sx*
           Sin[phi + (ta + tb)*ww] + 76*Hd0^2*sx*Sin[phi + (ta + tb)*ww] - 
          384*Delta*Hd0*sz*Sin[2*phi + (ta + tb)*ww] - 144*Hd0^2*sx*
           Sin[3*phi + (ta + tb)*ww]) - 32*Hd1*ta*tb*ww^2*Sin[(-ta + tb)*ww]*
         (Hd0^2*sy*Cos[3*phi + 3*ta*ww + tb*ww] + 
          Hd0^2*sy*Cos[3*phi + ta*ww + 3*tb*ww] + 32*Delta^2*sy*
           Cos[phi + (ta + tb)*ww] + 4*Hd0^2*sy*Cos[phi + (ta + tb)*ww] + 
          7*Hd0^2*sy*Cos[3*phi + (ta + tb)*ww] + Hd0^2*sx*
           Sin[3*phi + 3*ta*ww + tb*ww] + Hd0^2*sx*
           Sin[3*phi + ta*ww + 3*tb*ww] + 32*Delta^2*sx*
           Sin[phi + (ta + tb)*ww] + 4*Hd0^2*sx*Sin[phi + (ta + tb)*ww] - 
          16*Delta*Hd0*sz*Sin[2*phi + (ta + tb)*ww] - 
          7*Hd0^2*sx*Sin[3*phi + (ta + tb)*ww]) - 32*Hd0*ta^2*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 64*Hd0*ta*tb*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 32*Hd0*tb^2*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 4*Hd1*tb*ww*
         (-18*Hd0^2*sy*Cos[phi] + 2*(48*Delta^2 + 7*Hd0^2)*sy*
           Cos[phi + 2*ta*ww] + 18*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 
          2*Hd0^2*sy*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
           Cos[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sy*
           Cos[phi + 4*ta*ww - 2*tb*ww] + 192*Delta^2*sy*Cos[phi + 2*tb*ww] + 
          23*Hd0^2*sy*Cos[phi + 2*tb*ww] + 54*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
          12*Hd0^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 11*Hd0^2*sy*
           Cos[3*phi + 4*tb*ww] - 2*Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
          14*Hd0^2*sy*Cos[3*phi + 2*(ta + tb)*ww] + 18*Hd0^2*sx*Sin[phi] + 
          48*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] - 48*Delta*Hd0*sz*
           Sin[2*(phi + ta*ww)] + 96*Delta^2*sx*Sin[phi + 2*ta*ww] + 
          14*Hd0^2*sx*Sin[phi + 2*ta*ww] - 18*Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 
          2*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*
           Sin[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sx*
           Sin[phi + 4*ta*ww - 2*tb*ww] - 144*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 192*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          23*Hd0^2*sx*Sin[phi + 2*tb*ww] - 54*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          12*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 11*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - 2*Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww] + 
          14*Hd0^2*sx*Sin[3*phi + 2*(ta + tb)*ww]) - 4*Hd1*tb^2*ww^2*
         (64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 32*Delta*Hd0*sz*
           Cos[2*(-ta + tb)*ww] - 16*Delta*Hd0*sz*Cos[2*(phi + ta*ww)] - 
          16*Delta^2*sx*Cos[phi + 2*ta*ww] - 8*Hd0^2*sx*Cos[phi + 2*ta*ww] - 
          4*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 
          6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 80*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] + 112*Delta^2*sx*Cos[phi + 2*tb*ww] + 
          8*Hd0^2*sx*Cos[phi + 2*tb*ww] - 32*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Cos[phi - 2*ta*ww + 2*tb*ww] + 5*Hd0^2*sx*
           Cos[3*phi + 4*tb*ww] + 12*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 
          24*Hd0^2*sy*Sin[phi] + 16*Delta^2*sy*Sin[phi + 2*ta*ww] + 
          8*Hd0^2*sy*Sin[phi + 2*ta*ww] - 4*Hd0^2*sy*Sin[3*phi + 2*ta*ww] - 
          Hd0^2*sy*Sin[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
           Sin[phi + 2*ta*ww - 2*tb*ww] - 112*Delta^2*sy*Sin[phi + 2*tb*ww] - 
          8*Hd0^2*sy*Sin[phi + 2*tb*ww] - 32*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 
          6*Hd0^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 5*Hd0^2*sy*
           Sin[3*phi + 4*tb*ww] - 12*Hd0^2*sy*Sin[3*phi + 2*(ta + tb)*ww]) + 
        4*Hd1*ta^2*ww^2*(64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 
          32*Delta*Hd0*sz*Cos[2*(-ta + tb)*ww] - 80*Delta*Hd0*sz*
           Cos[2*(phi + ta*ww)] + 112*Delta^2*sx*Cos[phi + 2*ta*ww] + 
          8*Hd0^2*sx*Cos[phi + 2*ta*ww] - 32*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + 
          5*Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sx*
           Cos[phi + 2*ta*ww - 2*tb*ww] - 16*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] - 16*Delta^2*sx*Cos[phi + 2*tb*ww] - 
          8*Hd0^2*sx*Cos[phi + 2*tb*ww] - 4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Cos[phi - 2*ta*ww + 2*tb*ww] + 
          Hd0^2*sx*Cos[3*phi + 4*tb*ww] + 12*Hd0^2*sx*
           Cos[3*phi + 2*(ta + tb)*ww] + 24*Hd0^2*sy*Sin[phi] - 
          112*Delta^2*sy*Sin[phi + 2*ta*ww] - 8*Hd0^2*sy*Sin[phi + 2*ta*ww] - 
          32*Hd0^2*sy*Sin[3*phi + 2*ta*ww] - 5*Hd0^2*sy*
           Sin[3*phi + 4*ta*ww] + 6*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 
          16*Delta^2*sy*Sin[phi + 2*tb*ww] + 8*Hd0^2*sy*Sin[phi + 2*tb*ww] - 
          4*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 6*Hd0^2*sy*
           Sin[phi - 2*ta*ww + 2*tb*ww] - Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 
          12*Hd0^2*sy*Sin[3*phi + 2*(ta + tb)*ww]) - 
        8*Hd0*tb*ww^2*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
          16*Delta*Hd0*sz*Cos[2*(-ta + tb)*ww] - 24*Delta*Hd0*sz*
           Cos[2*(phi + ta*ww)] + 48*Delta^2*sx*Cos[phi + 2*ta*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 
          2*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 24*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] + 48*Delta^2*sx*Cos[phi + 2*tb*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 2*Hd0^2*sx*
           Cos[phi - 2*ta*ww + 2*tb*ww] + Hd0^2*sx*Cos[3*phi + 4*tb*ww] + 
          4*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 8*Hd0^2*sy*Sin[phi] - 
          48*Delta^2*sy*Sin[phi + 2*ta*ww] - 6*Hd0^2*sy*
           Sin[3*phi + 2*ta*ww] - Hd0^2*sy*Sin[3*phi + 4*ta*ww] + 
          2*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] - 48*Delta^2*sy*
           Sin[phi + 2*tb*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 
          2*Hd0^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 
          Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 4*Hd0^2*sy*
           Sin[3*phi + 2*(ta + tb)*ww]) + 4*Hd0*ta*ww^2*(72*Delta*Hd0*sz + 
          24*Delta*Hd0*sz*Cos[phi + 2*ta*ww]^2 + 12*Hd0^2*sx*
           Cos[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
          16*Delta*Hd0*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
           Cos[phi + 2*tb*ww] + 4*Hd0^2*sx*Cos[phi + 2*tb*ww] - 
          4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*tb*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 30*Hd0^2*sy*Sin[phi] - 
          3*Hd0^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 4*Hd0^2*sx*
           Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*Hd0^2*sy*Cos[phi + 2*tb*ww]*
           Sin[2*phi] + 24*Hd0^2*sy*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] - 48*Hd0^2*sy*Cos[2*(phi + ta*ww)]*
           Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 32*Delta*Hd0*sz*
           Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 - 
          8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
            2 - 6*Hd0^2*sx*Sin[phi]*Sin[2*(-ta + tb)*ww] + 
          24*Hd0^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 96*Delta^2*sy*
           Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*Sin[phi + 2*ta*ww] + 
          48*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*ta*ww] + 96*Delta*Hd0*sz*
           Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww]*Sin[phi + 2*ta*ww] + 
          24*Delta*Hd0*sz*Sin[phi + 2*ta*ww]^2 - 2*Hd0^2*sx*Sin[phi]*
           Sin[2*phi + 4*ta*ww] - 12*Hd0^2*sy*Sin[3*phi + 4*ta*ww] - 
          6*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 12*Hd0^2*sx*Sin[phi]*
           Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
          4*Hd0^2*sy*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Cos[phi]^2*
           Sin[phi + 2*tb*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*tb*ww] + 
          2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*
           Sin[3*phi + 2*tb*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*tb*ww] - 
          3*Hd0^2*sy*Sin[3*phi + 4*tb*ww] + 24*Hd0^2*sx*Sin[(-ta + tb)*ww]*
           Sin[phi + (ta + tb)*ww] - 48*Hd0^2*sx*Cos[2*(phi + ta*ww)]*
           Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] + 32*Delta*Hd0*sz*
           Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
          24*Cos[phi + 2*ta*ww]*(4*Delta^2*sx - Hd0^2*sx - 
            4*Delta*Hd0*sz*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]) - 
          2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (ta + tb)*ww)] + 
          Hd0*Cos[phi]*(30*Hd0*sx - 48*Delta*sz*Cos[phi + 2*ta*ww] + 
            3*Hd0*sx*Cos[2*phi + 4*ta*ww] - 32*Delta*sz*Cos[phi + 2*tb*ww] + 
            6*Hd0*sy*Sin[2*(-ta + tb)*ww] - 24*Hd0*sy*Sin[2*(phi + ta*ww)] - 
            2*Hd0*sy*Sin[2*phi + 4*ta*ww] - 12*Hd0*sy*Sin[2*(phi + tb*ww)] + 
            Hd0*sy*Sin[2*phi + 4*tb*ww] - 8*Hd0*sx*Sin[(-ta + tb)*ww]^2*
             Sin[phi + (ta + tb)*ww]^2 - 2*Hd0*sy*
             Sin[2*(phi + (ta + tb)*ww)]) + 6*Hd0^2*sy*
           Sin[3*phi + 2*(ta + tb)*ww]))/ww^4)/(12288*(-ta + tb))
 
HoldPattern[CommutativeQ[sx]] ^= False
 
CommutativeQ[Blank] = False
 
CommutativeQ[BlankNullSequence] = False
 
CommutativeQ[BlankSequence] = False
 
CommutativeQ[Pattern] = False
 
CommutativeQ[Slot] = False
 
CommutativeQ[SlotSequence] = False
 
CommutativeQ[NonCommutativeMultiply`Private`a_List] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[NonCommutativeMultiply`Private`a_SparseArray] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[Subscript[NonCommutativeMultiply`Private`x_, ___]] := 
    CommutativeQ[NonCommutativeMultiply`Private`x]
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)?CommutativeQ[
      NonCommutativeMultiply`Private`x___]] := 
    And @@ CommutativeQ /@ {NonCommutativeMultiply`Private`x}
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)[
      NonCommutativeMultiply`Private`x___]] := False
 
CommutativeQ[_] = True
 
CommutativeQ /: CommutativeQ::Commutative = 
     "Tried to set the `1` \"`2`\" to be commutative."
 
CommutativeQ /: CommutativeQ::CommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be commutative. Please set the symbol \
\"`1`\" to be commutative instead."
 
CommutativeQ /: CommutativeQ::NonCommutative = 
     "Tried to set the `1` \"`2`\" to be noncommutative."
 
CommutativeQ /: CommutativeQ::NonCommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be noncommutative. Please set the \
symbol \"`1`\" to be noncommutative instead."
 
CommutativeQ /: CommutativeQ::usage = "CommutativeQ[expr] is True if \
expression expr is commutative (the default), and False if expr is \
noncommutative.\n\nSee also: SetCommutative, SetNonCommutative."
 
Attributes[Subscript] = {NHoldRest}
 
Subscript[WWreal, 1][t_, t0_] = (-I/8)*(Hd1*t^2*(sx*Cos[phi] + sy*Sin[phi]) - 
      Hd1*t0^2*(sx*Cos[phi] + sy*Sin[phi]) + 
      2*t*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
      2*t0*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
      (Hd1*t*(sy*Cos[phi + 2*t*ww] + sx*Sin[phi + 2*t*ww]))/ww - 
      (Hd1*t0*(sy*Cos[phi + 2*t0*ww] + sx*Sin[phi + 2*t0*ww]))/ww - 
      (Hd1*Sin[(t - t0)*ww]*(sy*Cos[phi + (t + t0)*ww] + 
         sx*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (2*Hd0*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 2][t_, t0_] = 
    (-I/768)*((12*Hd1^2*sz*t*t0^2*Cos[2*(phi + t*ww)])/ww - 
      (4*Hd1^2*sz*t^3*(-2 + 3*Cos[2*(phi + t*ww)]))/ww + 
      (6*Hd1^2*sz*t*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t*ww)]))/ww^3 - 
      (12*Hd1^2*sz*t^2*t0*Cos[2*(phi + t0*ww)])/ww + 
      (4*Hd1^2*sz*t0^3*(-2 + 3*Cos[2*(phi + t0*ww)]))/ww - 
      (6*Hd1^2*sz*t0*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t0*ww)]))/ww^3 - 
      16*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      48*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) - 
      48*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) + 
      16*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      (12*Hd1^2*sz*t*t0*Sin[2*(t - t0)*ww])/ww^2 - 
      (12*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (3*Hd1^2*sz*(Sin[2*(t - t0)*ww] + 6*Sin[2*(phi + t*ww)] - 
         6*Sin[2*(phi + t0*ww)]))/ww^4 + 
      (6*Hd1^2*sz*t^2*(5*Sin[2*(phi + t*ww)] + Sin[2*(phi + t0*ww)]))/ww^2 - 
      (6*Hd1^2*sz*t0^2*(Sin[2*(phi + t*ww)] + 5*Sin[2*(phi + t0*ww)]))/ww^2 - 
      (12*Hd0*(4*Delta*sy*Cos[phi + 2*t*ww] - 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(t - t0)*ww] - 2*Hd0*sz*Sin[2*(phi + t*ww)] + 
         4*Delta*sx*Sin[phi + 2*t*ww] + 2*Hd0*sz*Sin[2*(phi + t0*ww)] - 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (12*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] + Hd0*sz*Sin[2*(t - t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (12*Hd1*t0*(2*Delta*sy*Cos[phi + 2*t*ww] + 6*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(t - t0)*ww] - 
         Hd0*sz*Sin[2*(phi + t*ww)] + 2*Delta*sx*Sin[phi + 2*t*ww] - 
         5*Hd0*sz*Sin[2*(phi + t0*ww)] + 6*Delta*sx*Sin[phi + 2*t0*ww]))/
       ww^2 - (24*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww + 
      (24*Hd1*Sin[(t - t0)*ww]*(4*Delta*sy*Cos[phi + (t + t0)*ww] + 
         4*Delta*sx*Sin[phi + (t + t0)*ww] - 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 + 
      (48*Hd1*t*t0*Sin[(t - t0)*ww]*(2*Delta*sy*Cos[phi + (t + t0)*ww] + 
         2*Delta*sx*Sin[phi + (t + t0)*ww] - 
         Hd0*sz*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] + 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] + 
         4*Delta*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         2*Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 3][t_, t0_] = 
    ((-I/12288)*(16*Hd1*t^2*t0*ww^3*(-3*Hd0^2*sy*Cos[phi] + 
         (16*Delta^2 + 3*Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         3*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 8*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] - 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         3*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 8*Delta^2*sx*Sin[phi + 2*t0*ww]) - 
       16*Hd1*t*t0^2*ww^3*(-3*Hd0^2*sy*Cos[phi] + 8*Delta^2*sy*
          Cos[phi + 2*t*ww] + 16*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sy*Cos[phi + 2*t0*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 16*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] - 3*Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       16*Hd1*t^3*ww^3*(Hd0^2*sy*Cos[phi] - 2*(4*Delta^2 + Hd0^2)*sy*
          Cos[phi + 2*t*ww] - 2*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sy*Cos[phi + 2*t0*ww] + Hd0^2*sy*Cos[3*phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] - 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 2*Hd0^2*sx*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[3*phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       4*Hd0*ww*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         12*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
          Cos[phi + 2*t0*ww] - 3*Hd0^2*sy*Cos[phi + 2*t0*ww] - 
         12*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Cos[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sy*Cos[3*phi + 4*t0*ww] + 
         Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(t - t0)*ww] - 48*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         12*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 3*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] + 12*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww]) - 
       Hd1*t0*ww*(56*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 10*Hd0^2*sy*
          Cos[3*phi + 4*t*ww] + 6*Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
         864*Delta^2*sy*Cos[phi + 2*t0*ww] - 62*Hd0^2*sy*Cos[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Cos[phi]^2*(Cos[phi + 2*t*ww] + 5*Cos[phi + 2*t0*ww]) + 
         64*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 91*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + 98*Hd0^2*sx*Sin[phi] - 
         288*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] - 464*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[phi] + 19*Hd0^2*sx*Cos[2*phi + 4*t0*ww]*
          Sin[phi] - 20*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t*ww] + 192*Delta^2*sx*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 288*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 
         16*Hd0^2*sy*Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 + 48*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]^2 + 
         32*Hd0^2*sx*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         16*Delta*Hd0*sz*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(t - t0)*ww] - 4*Hd0^2*sy*Sin[phi]*Sin[2*(t - t0)*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t0*ww] - 128*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] - 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + t*ww)] + 288*Delta^2*sx*Sin[phi + 2*t*ww] + 
         32*Hd0^2*sx*Sin[phi + 2*t*ww] - 32*Delta*Hd0*sz*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t*ww] + 8*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[2*phi]*Sin[phi + 2*t*ww] - 56*Hd0^2*sx*
          Sin[3*phi + 2*t*ww] - 2*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*phi + 4*t*ww] + 2*Hd0^2*sy*Sin[phi]*Sin[2*phi + 4*t*ww] + 
         10*Hd0^2*sx*Sin[3*phi + 4*t*ww] - 160*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 240*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)] + 864*Delta^2*sx*
          Sin[phi + 2*t0*ww] - 56*Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]^2*Sin[phi + 2*t0*ww] + 
         40*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - 20*Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 12*Hd0^2*sy*Sin[2*(t - t0)*ww]*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t*ww]*
          Sin[phi + 2*t0*ww] - 2*Hd0^2*sy*Sin[2*phi + 4*t*ww]*
          Sin[phi + 2*t0*ww] + 24*Hd0^2*sy*Sin[2*(phi + t0*ww)]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sy*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t0*ww]^2 - 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t0*ww]^2 + 
         4*Cos[phi + 2*t*ww]*(72*Delta^2*sy + 8*Hd0^2*sy - 
           Hd0^2*sx*Sin[2*phi] + 3*Hd0^2*sx*Sin[2*(t - t0)*ww] + 
           8*Delta*Hd0*sz*Sin[phi + 2*t0*ww] + 4*Hd0*Sin[phi]*
            (-(Delta*sz) + Hd0*sy*Sin[phi + 2*t0*ww])) - 
         64*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 25*Hd0^2*sy*Sin[phi]*
          Sin[2*phi + 4*t0*ww] + 81*Hd0^2*sx*Sin[3*phi + 4*t0*ww] - 
         192*Delta^2*sy*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         96*Delta*Hd0*sz*Sin[phi]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         240*Hd0^2*sx*Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)]*
          Sin[phi + (t + t0)*ww] - 288*Delta*Hd0*sz*Sin[(t - t0)*ww]*
          Sin[phi + 2*t0*ww]*Sin[phi + (t + t0)*ww] + 16*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 + 
         16*Hd0^2*sx*Sin[(t - t0)*ww]^2*Sin[phi + 2*t0*ww]*
          Sin[phi + (t + t0)*ww]^2 + 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - 4*Hd0^2*sy*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + 4*Hd0^2*sy*Sin[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - Hd0*Cos[phi]*(144*Hd0*sy - 
           36*Hd0*sy*Cos[2*(t - t0)*ww] - 24*Hd0*sy*Cos[2*(phi + t*ww)] + 
           2*Hd0*sy*Cos[2*phi + 4*t*ww] - 264*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           25*Hd0*sy*Cos[2*phi + 4*t0*ww] + 4*Hd0*sy*
            Cos[2*(phi + (t + t0)*ww)] + 12*Hd0*sx*Sin[2*(t - t0)*ww] + 
           64*Delta*sz*Sin[phi + 2*t*ww] + 2*Hd0*sx*Sin[2*phi + 4*t*ww] + 
           416*Delta*sz*Sin[phi + 2*t0*ww] - 25*Hd0*sx*Sin[2*phi + 4*t0*ww] + 
           4*Hd0*sx*Sin[2*(phi + (t + t0)*ww)]) + 48*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       8*Hd1*t0^3*ww^3*(2*Hd0^2*sy*Cos[phi]^2*Cos[phi + 2*t0*ww] + 
         4*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*Sin[phi] + 
         6*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] + Cos[phi + 2*t0*ww]*
          (4*(4*Delta^2 + Hd0^2)*sy + 8*Delta*Hd0*sz*Sin[phi] - 
           Hd0^2*sx*Sin[2*phi]) + 16*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 8*Delta*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t0*ww] + 4*Hd0^2*sx*Sin[phi + 2*t0*ww] + 
         2*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         8*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww] - 
         2*Hd0*Cos[phi]*(3*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           4*Delta*sz*Sin[phi + 2*t0*ww] + Hd0*sy*(1 - 4*Sin[(t - t0)*ww]*
              Sin[2*phi + (t + t0)*ww]))) - 2*Hd1*Sin[(t - t0)*ww]*
        (-24*Hd0^2*sy*Cos[phi + t*ww - t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 3*t*ww - t0*ww] - 24*Hd0^2*sy*Cos[phi - t*ww + t0*ww] + 
         27*Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sy*
          Cos[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sy*
          Cos[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 76*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         144*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + 24*Hd0^2*sx*
          Sin[phi + t*ww - t0*ww] - 2*Hd0^2*sx*Sin[phi + 3*t*ww - t0*ww] + 
         24*Hd0^2*sx*Sin[phi - t*ww + t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sx*
          Sin[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 76*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         384*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 144*Hd0^2*sx*
          Sin[3*phi + (t + t0)*ww]) - 32*Hd1*t*t0*ww^2*Sin[(t - t0)*ww]*
        (Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] + 
         Hd0^2*sy*Cos[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 4*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         7*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] + Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 4*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         16*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 
         7*Hd0^2*sx*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 64*Hd0*t*t0*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t0^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 4*Hd1*t*ww*
        (-18*Hd0^2*sy*Cos[phi] + (192*Delta^2 + 23*Hd0^2)*sy*
          Cos[phi + 2*t*ww] + 54*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         11*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 12*Hd0^2*sy*
          Cos[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 4*t*ww - 2*t0*ww] + 96*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         14*Hd0^2*sy*Cos[phi + 2*t0*ww] + 18*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sy*Cos[3*phi + 2*(t + t0)*ww] + 18*Hd0^2*sx*Sin[phi] + 
         48*Delta*Hd0*sz*Sin[2*(t - t0)*ww] - 144*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] + 192*Delta^2*sx*Sin[phi + 2*t*ww] + 
         23*Hd0^2*sx*Sin[phi + 2*t*ww] - 54*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 
         11*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 12*Hd0^2*sx*
          Sin[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sx*
          Sin[phi + 4*t*ww - 2*t0*ww] - 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 96*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         14*Hd0^2*sx*Sin[phi + 2*t0*ww] - 18*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sx*Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t^2*ww^2*
        (64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 80*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         112*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         32*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 5*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 16*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 16*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] - 4*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 12*Hd0^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 24*Hd0^2*sy*Sin[phi] - 
         112*Delta^2*sy*Sin[phi + 2*t*ww] - 8*Hd0^2*sy*Sin[phi + 2*t*ww] - 
         32*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 5*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sy*Sin[phi + 2*t*ww - 2*t0*ww] + 16*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sy*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       8*Hd0*t*ww^2*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
         16*Delta*Hd0*sz*Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t*ww)] + 48*Delta^2*sx*Cos[phi + 2*t*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         2*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 4*Hd0*t0*ww^2*
        (72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] + 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(t - t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] + 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 24*Hd0^2*sx*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t0^2*ww^2*
        (-64*Delta*Hd0*sz - 24*Hd0^2*sx*Cos[phi] - 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] + 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         16*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] - Hd0^2*sx*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] + 80*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 112*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] + 32*Hd0^2*sx*Cos[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] - 5*Hd0^2*sx*
          Cos[3*phi + 4*t0*ww] - 12*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] - 
         24*Hd0^2*sy*Sin[phi] - 16*Delta^2*sy*Sin[phi + 2*t*ww] - 
         8*Hd0^2*sy*Sin[phi + 2*t*ww] + 4*Hd0^2*sy*Sin[3*phi + 2*t*ww] + 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] - 6*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] + 112*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Sin[phi + 2*t0*ww] + 32*Hd0^2*sy*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] + 5*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww])))/
     ww^4
 
HoldPattern[CommutativeQ[WWreal]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
HlinbarFS[tb_, ta_] = Hlinbar
 
Hlinbar[tb_, ta_] = (1536*(-(Hd1*ta^2*(sx*Cos[phi] + sy*Sin[phi])) + 
        Hd1*tb^2*(sx*Cos[phi] + sy*Sin[phi]) - 
        2*ta*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
        2*tb*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
        (Hd1*ta*(sy*Cos[phi + 2*ta*ww] + sx*Sin[phi + 2*ta*ww]))/ww + 
        (Hd1*tb*(sy*Cos[phi + 2*tb*ww] + sx*Sin[phi + 2*tb*ww]))/ww - 
        (Hd1*Sin[(-ta + tb)*ww]*(sy*Cos[phi + (ta + tb)*ww] + 
           sx*Sin[phi + (ta + tb)*ww]))/ww^2 + 
        (2*Hd0*Sin[(-ta + tb)*ww]*(sx*Cos[phi + (ta + tb)*ww] - 
           sy*Sin[phi + (ta + tb)*ww]))/ww) + 
      16*((-12*Hd1^2*sz*ta*tb^2*Cos[2*(phi + ta*ww)])/ww + 
        (4*Hd1^2*sz*ta^3*(-2 + 3*Cos[2*(phi + ta*ww)]))/ww - 
        (6*Hd1^2*sz*ta*(Cos[2*(-ta + tb)*ww] + 6*Cos[2*(phi + ta*ww)]))/
         ww^3 + (12*Hd1^2*sz*ta^2*tb*Cos[2*(phi + tb*ww)])/ww - 
        (4*Hd1^2*sz*tb^3*(-2 + 3*Cos[2*(phi + tb*ww)]))/ww + 
        (6*Hd1^2*sz*tb*(Cos[2*(-ta + tb)*ww] + 6*Cos[2*(phi + tb*ww)]))/
         ww^3 + 16*Delta*Hd1*ta^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        48*Delta*Hd1*ta^2*tb*(sy*Cos[phi] - sx*Sin[phi]) + 
        48*Delta*Hd1*ta*tb^2*(sy*Cos[phi] - sx*Sin[phi]) - 
        16*Delta*Hd1*tb^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        (12*Hd1^2*sz*ta*tb*Sin[2*(-ta + tb)*ww])/ww^2 - 
        (6*Hd1^2*sz*ta^2*(5*Sin[2*(phi + ta*ww)] + Sin[2*(phi + tb*ww)]))/
         ww^2 + (6*Hd1^2*sz*tb^2*(Sin[2*(phi + ta*ww)] + 
           5*Sin[2*(phi + tb*ww)]))/ww^2 - 
        (3*Hd1^2*sz*(Sin[2*(-ta + tb)*ww] - 6*Sin[2*(phi + ta*ww)] + 
           6*Sin[2*(phi + tb*ww)]))/ww^4 + 
        (12*Hd1*ta*(6*Delta*sy*Cos[phi + 2*ta*ww] + 2*Delta*sy*
            Cos[phi + 2*tb*ww] - Hd0*sz*Sin[2*(-ta + tb)*ww] - 
           5*Hd0*sz*Sin[2*(phi + ta*ww)] + 6*Delta*sx*Sin[phi + 2*ta*ww] - 
           Hd0*sz*Sin[2*(phi + tb*ww)] + 2*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (12*Hd0*(-4*Delta*sy*Cos[phi + 2*ta*ww] + 
           4*Delta*sy*Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(-ta + tb)*ww] + 
           2*Hd0*sz*Sin[2*(phi + ta*ww)] - 4*Delta*sx*Sin[phi + 2*ta*ww] - 
           2*Hd0*sz*Sin[2*(phi + tb*ww)] + 4*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (12*Hd1*tb*(2*Delta*sy*Cos[phi + 2*ta*ww] + 
           6*Delta*sy*Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(-ta + tb)*ww] - 
           Hd0*sz*Sin[2*(phi + ta*ww)] + 2*Delta*sx*Sin[phi + 2*ta*ww] - 
           5*Hd0*sz*Sin[2*(phi + tb*ww)] + 6*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 - (24*Hd0*tb*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + Hd0*sz*Cos[2*(phi + tb*ww)] - 
           2*Delta*sx*Cos[phi + 2*tb*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] + 
           2*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (12*Hd1*tb^2*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww + 
        (24*Hd1*Sin[(-ta + tb)*ww]*(4*Delta*sy*Cos[phi + (ta + tb)*ww] + 
           4*Delta*sx*Sin[phi + (ta + tb)*ww] - 3*Hd0*sz*
            Sin[2*phi + (ta + tb)*ww]))/ww^3 + 
        (48*Hd1*ta*tb*Sin[(-ta + tb)*ww]*
          (2*Delta*sy*Cos[phi + (ta + tb)*ww] + 2*Delta*sx*
            Sin[phi + (ta + tb)*ww] - Hd0*sz*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (24*Hd0*ta*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           4*Delta*sx*Cos[phi + 2*ta*ww] + 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(-ta + tb)*ww] + 4*Delta*sy*Sin[phi + 2*ta*ww] + 
           4*Delta*sx*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] - 
           2*Hd0*sz*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (24*Hd1*ta^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] - 
           Hd0*sz*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww) + 
      (-16*Hd1*ta^2*tb*ww^3*(-3*Hd0^2*sy*Cos[phi] + (16*Delta^2 + 3*Hd0^2)*sy*
           Cos[phi + 2*ta*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 
          8*Delta^2*sy*Cos[phi + 2*tb*ww] + 3*Hd0^2*sx*Sin[phi] - 
          4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 16*Delta^2*sx*
           Sin[phi + 2*ta*ww] + 3*Hd0^2*sx*Sin[phi + 2*ta*ww] - 
          3*Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 4*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 8*Delta^2*sx*Sin[phi + 2*tb*ww]) + 
        16*Hd1*ta*tb^2*ww^3*(-3*Hd0^2*sy*Cos[phi] + 8*Delta^2*sy*
           Cos[phi + 2*ta*ww] + (16*Delta^2 + 3*Hd0^2)*sy*
           Cos[phi + 2*tb*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          8*Delta^2*sx*Sin[phi + 2*ta*ww] - 4*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 16*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 3*Hd0^2*sx*Sin[3*phi + 2*tb*ww]) + 
        16*Hd1*tb^3*ww^3*(Hd0^2*sy*Cos[phi] + Hd0^2*sy*Cos[phi + 2*ta*ww] + 
          Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 2*(4*Delta^2 + Hd0^2)*sy*
           Cos[phi + 2*tb*ww] - 2*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
          Hd0^2*sx*Sin[phi] - 4*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          Hd0^2*sx*Sin[phi + 2*ta*ww] - Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 
          4*Delta*Hd0*sz*Sin[2*(phi + tb*ww)] - 8*Delta^2*sx*
           Sin[phi + 2*tb*ww] - 2*Hd0^2*sx*Sin[phi + 2*tb*ww] + 
          2*Hd0^2*sx*Sin[3*phi + 2*tb*ww]) + 
        4*Hd0*ww*(-3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*ta*ww] - 
          12*Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 3*Hd0^2*sy*
           Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*Cos[phi + 2*ta*ww - 2*tb*ww] + 
          Hd0^2*sy*Cos[phi + 4*ta*ww - 2*tb*ww] + 96*Delta^2*sy*
           Cos[phi + 2*tb*ww] + 3*Hd0^2*sy*Cos[phi + 2*tb*ww] + 
          12*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 6*Hd0^2*sy*
           Cos[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sy*Cos[3*phi + 4*tb*ww] - 
          Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 48*Delta*Hd0*sz*
           Sin[2*(-ta + tb)*ww] + 48*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] - 
          96*Delta^2*sx*Sin[phi + 2*ta*ww] - 3*Hd0^2*sx*Sin[phi + 2*ta*ww] + 
          12*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 3*Hd0^2*sx*
           Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Sin[phi + 2*ta*ww - 2*tb*ww] + 
          Hd0^2*sx*Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 12*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww]) - 
        Hd1*ta*ww*(64*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 91*Hd0^2*sy*
           Cos[3*phi + 4*ta*ww] + 288*Delta^2*sy*Cos[phi + 2*tb*ww] + 
          32*Hd0^2*sy*Cos[phi + 2*tb*ww] + 8*Hd0^2*sy*Cos[phi]^2*
           (5*Cos[phi + 2*ta*ww] + Cos[phi + 2*tb*ww]) + 
          56*Hd0^2*sy*Cos[3*phi + 2*tb*ww] + 10*Hd0^2*sy*
           Cos[3*phi + 4*tb*ww] + 6*Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
          98*Hd0^2*sx*Sin[phi] - 288*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[phi] + 
          19*Hd0^2*sx*Cos[2*phi + 4*ta*ww]*Sin[phi] - 16*Delta*Hd0*sz*
           Cos[phi + 2*tb*ww]*Sin[phi] - 4*Hd0^2*sx*Cos[phi + 2*tb*ww]*
           Sin[2*phi] + 192*Delta^2*sx*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] + 48*Hd0^2*sx*Sin[phi]*Sin[(-ta + tb)*ww]^2 + 
          32*Hd0^2*sx*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
            2 - 16*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] + 
          12*Hd0^2*sx*Cos[phi + 2*tb*ww]*Sin[2*(-ta + tb)*ww] - 
          4*Hd0^2*sy*Sin[phi]*Sin[2*(-ta + tb)*ww] - 160*Delta*Hd0*sz*
           Sin[2*(phi + ta*ww)] - 240*Hd0^2*sy*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww]*Sin[2*(phi + ta*ww)] + 864*Delta^2*sx*
           Sin[phi + 2*ta*ww] - 56*Hd0^2*sx*Sin[phi + 2*ta*ww] - 
          4*Hd0^2*sx*Cos[phi + 2*ta*ww]^2*Sin[phi + 2*ta*ww] + 
          32*Delta*Hd0*sz*Cos[phi + 2*tb*ww]*Sin[phi + 2*ta*ww] + 
          16*Hd0^2*sy*Cos[phi + 2*tb*ww]*Sin[phi]*Sin[phi + 2*ta*ww] + 
          40*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*ta*ww] - 20*Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*ta*ww] - 12*Hd0^2*sy*Sin[2*(-ta + tb)*ww]*
           Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*Sin[2*(phi + ta*ww)]*
           Sin[phi + 2*ta*ww] - 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*ta*ww]^2 - 
          64*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 25*Hd0^2*sy*Sin[phi]*
           Sin[2*phi + 4*ta*ww] + 81*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 
          128*Delta*Hd0*sz*Sin[2*(phi + tb*ww)] + 288*Delta^2*sx*
           Sin[phi + 2*tb*ww] + 32*Hd0^2*sx*Sin[phi + 2*tb*ww] + 
          8*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*tb*ww] + 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*ta*ww]*
           Sin[phi + 2*tb*ww] - 56*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          2*Hd0^2*sy*Sin[phi]*Sin[2*phi + 4*tb*ww] - 2*Hd0^2*sy*
           Sin[phi + 2*ta*ww]*Sin[2*phi + 4*tb*ww] + 10*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - 192*Delta^2*sy*Sin[(-ta + tb)*ww]*
           Sin[phi + (ta + tb)*ww] + 96*Delta*Hd0*sz*Sin[phi]*
           Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] - 
          240*Hd0^2*sx*Sin[(-ta + tb)*ww]*Sin[2*(phi + ta*ww)]*
           Sin[phi + (ta + tb)*ww] - 288*Delta*Hd0*sz*Sin[(-ta + tb)*ww]*
           Sin[phi + 2*ta*ww]*Sin[phi + (ta + tb)*ww] + 16*Hd0^2*sx*Sin[phi]*
           Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
          16*Hd0^2*sx*Sin[(-ta + tb)*ww]^2*Sin[phi + 2*ta*ww]*
           Sin[phi + (ta + tb)*ww]^2 - 4*Hd0^2*sy*Sin[phi]*
           Sin[2*(phi + (ta + tb)*ww)] + 4*Hd0^2*sy*Sin[phi + 2*ta*ww]*
           Sin[2*(phi + (ta + tb)*ww)] + Hd0*Cos[phi]*(-144*Hd0*sy + 
            36*Hd0*sy*Cos[2*(-ta + tb)*ww] + 264*Hd0*sy*
             Cos[2*(phi + ta*ww)] + 25*Hd0*sy*Cos[2*phi + 4*ta*ww] + 
            24*Hd0*sy*Cos[2*(phi + tb*ww)] - 2*Hd0*sy*Cos[2*phi + 4*tb*ww] - 
            4*Hd0*sy*Cos[2*(phi + (ta + tb)*ww)] - 12*Hd0*sx*
             Sin[2*(-ta + tb)*ww] - 416*Delta*sz*Sin[phi + 2*ta*ww] + 
            25*Hd0*sx*Sin[2*phi + 4*ta*ww] - 64*Delta*sz*Sin[phi + 2*tb*ww] - 
            2*Hd0*sx*Sin[2*phi + 4*tb*ww] - 4*Hd0*sx*
             Sin[2*(phi + (ta + tb)*ww)]) + 2*Cos[phi + 2*ta*ww]*
           (432*Delta^2*sy - 31*Hd0^2*sy - 232*Delta*Hd0*sz*Sin[phi] - 
            10*Hd0^2*sx*Sin[2*phi] - 2*Hd0^2*sx*Sin[2*ta*ww] + 
            2*Hd0^2*sx*Sin[2*tb*ww] - 144*Delta*Hd0*sz*
             Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 
            8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 + 
            6*Hd0^2*sx*Sin[2*(-ta + tb)*ww] - 2*Hd0^2*sy*Sin[phi + 2*ta*ww]^
              2 - 2*Hd0^2*sx*Sin[2*(phi + tb*ww)] - 16*Delta*Hd0*sz*
             Sin[phi + 2*tb*ww] - Hd0^2*sx*Sin[2*phi + 4*tb*ww] + 
            2*Hd0^2*sx*Sin[2*(phi + (ta + tb)*ww)]) + 48*Hd0^2*sx*Sin[phi]*
           Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww]) + 
        8*Hd1*ta^3*ww^3*(2*Hd0^2*sy*Cos[phi]^2*Cos[phi + 2*ta*ww] + 
          4*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 2*Hd0^2*sx*Sin[phi] + 
          6*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[phi] + Cos[phi + 2*ta*ww]*
           (4*(4*Delta^2 + Hd0^2)*sy + 8*Delta*Hd0*sz*Sin[phi] - 
            Hd0^2*sx*Sin[2*phi]) + 16*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] - 8*Delta*Hd0*sz*Sin[2*(phi + ta*ww)] + 
          16*Delta^2*sx*Sin[phi + 2*ta*ww] + 4*Hd0^2*sx*Sin[phi + 2*ta*ww] + 
          2*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*ta*ww] - Hd0^2*sy*Sin[2*phi]*
           Sin[phi + 2*ta*ww] - 4*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 
          8*Hd0^2*sx*Sin[phi]*Sin[(-ta + tb)*ww]*Sin[2*phi + (ta + tb)*ww] - 
          2*Hd0*Cos[phi]*(3*Hd0*sy*Cos[2*(phi + ta*ww)] - 
            4*Delta*sz*Sin[phi + 2*ta*ww] + Hd0*sy*(1 - 4*Sin[(-ta + tb)*ww]*
               Sin[2*phi + (ta + tb)*ww]))) - 2*Hd1*Sin[(-ta + tb)*ww]*
         (-24*Hd0^2*sy*Cos[phi + ta*ww - tb*ww] - 2*Hd0^2*sy*
           Cos[phi + 3*ta*ww - tb*ww] - 24*Hd0^2*sy*
           Cos[phi - ta*ww + tb*ww] + 27*Hd0^2*sy*Cos[3*phi + 3*ta*ww + 
             tb*ww] - 2*Hd0^2*sy*Cos[phi - ta*ww + 3*tb*ww] + 
          27*Hd0^2*sy*Cos[3*phi + ta*ww + 3*tb*ww] + 576*Delta^2*sy*
           Cos[phi + (ta + tb)*ww] + 76*Hd0^2*sy*Cos[phi + (ta + tb)*ww] + 
          144*Hd0^2*sy*Cos[3*phi + (ta + tb)*ww] + 24*Hd0^2*sx*
           Sin[phi + ta*ww - tb*ww] - 2*Hd0^2*sx*Sin[phi + 3*ta*ww - tb*ww] + 
          24*Hd0^2*sx*Sin[phi - ta*ww + tb*ww] + 27*Hd0^2*sx*
           Sin[3*phi + 3*ta*ww + tb*ww] - 2*Hd0^2*sx*
           Sin[phi - ta*ww + 3*tb*ww] + 27*Hd0^2*sx*
           Sin[3*phi + ta*ww + 3*tb*ww] + 576*Delta^2*sx*
           Sin[phi + (ta + tb)*ww] + 76*Hd0^2*sx*Sin[phi + (ta + tb)*ww] - 
          384*Delta*Hd0*sz*Sin[2*phi + (ta + tb)*ww] - 144*Hd0^2*sx*
           Sin[3*phi + (ta + tb)*ww]) - 32*Hd1*ta*tb*ww^2*Sin[(-ta + tb)*ww]*
         (Hd0^2*sy*Cos[3*phi + 3*ta*ww + tb*ww] + 
          Hd0^2*sy*Cos[3*phi + ta*ww + 3*tb*ww] + 32*Delta^2*sy*
           Cos[phi + (ta + tb)*ww] + 4*Hd0^2*sy*Cos[phi + (ta + tb)*ww] + 
          7*Hd0^2*sy*Cos[3*phi + (ta + tb)*ww] + Hd0^2*sx*
           Sin[3*phi + 3*ta*ww + tb*ww] + Hd0^2*sx*
           Sin[3*phi + ta*ww + 3*tb*ww] + 32*Delta^2*sx*
           Sin[phi + (ta + tb)*ww] + 4*Hd0^2*sx*Sin[phi + (ta + tb)*ww] - 
          16*Delta*Hd0*sz*Sin[2*phi + (ta + tb)*ww] - 
          7*Hd0^2*sx*Sin[3*phi + (ta + tb)*ww]) - 32*Hd0*ta^2*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 64*Hd0*ta*tb*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 32*Hd0*tb^2*ww^3*
         Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (ta + tb)*ww] - 
          4*Delta*Hd0*sz*Cos[2*phi + (ta + tb)*ww] - 
          Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
           Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[phi + (ta + tb)*ww] - 
          Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 4*Hd1*tb*ww*
         (-18*Hd0^2*sy*Cos[phi] + 2*(48*Delta^2 + 7*Hd0^2)*sy*
           Cos[phi + 2*ta*ww] + 18*Hd0^2*sy*Cos[3*phi + 2*ta*ww] + 
          2*Hd0^2*sy*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
           Cos[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sy*
           Cos[phi + 4*ta*ww - 2*tb*ww] + 192*Delta^2*sy*Cos[phi + 2*tb*ww] + 
          23*Hd0^2*sy*Cos[phi + 2*tb*ww] + 54*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
          12*Hd0^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 11*Hd0^2*sy*
           Cos[3*phi + 4*tb*ww] - 2*Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
          14*Hd0^2*sy*Cos[3*phi + 2*(ta + tb)*ww] + 18*Hd0^2*sx*Sin[phi] + 
          48*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] - 48*Delta*Hd0*sz*
           Sin[2*(phi + ta*ww)] + 96*Delta^2*sx*Sin[phi + 2*ta*ww] + 
          14*Hd0^2*sx*Sin[phi + 2*ta*ww] - 18*Hd0^2*sx*Sin[3*phi + 2*ta*ww] + 
          2*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*
           Sin[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sx*
           Sin[phi + 4*ta*ww - 2*tb*ww] - 144*Delta*Hd0*sz*
           Sin[2*(phi + tb*ww)] + 192*Delta^2*sx*Sin[phi + 2*tb*ww] + 
          23*Hd0^2*sx*Sin[phi + 2*tb*ww] - 54*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
          12*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 11*Hd0^2*sx*
           Sin[3*phi + 4*tb*ww] - 2*Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww] + 
          14*Hd0^2*sx*Sin[3*phi + 2*(ta + tb)*ww]) - 4*Hd1*tb^2*ww^2*
         (64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 32*Delta*Hd0*sz*
           Cos[2*(-ta + tb)*ww] - 16*Delta*Hd0*sz*Cos[2*(phi + ta*ww)] - 
          16*Delta^2*sx*Cos[phi + 2*ta*ww] - 8*Hd0^2*sx*Cos[phi + 2*ta*ww] - 
          4*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 
          6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 80*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] + 112*Delta^2*sx*Cos[phi + 2*tb*ww] + 
          8*Hd0^2*sx*Cos[phi + 2*tb*ww] - 32*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Cos[phi - 2*ta*ww + 2*tb*ww] + 5*Hd0^2*sx*
           Cos[3*phi + 4*tb*ww] + 12*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 
          24*Hd0^2*sy*Sin[phi] + 16*Delta^2*sy*Sin[phi + 2*ta*ww] + 
          8*Hd0^2*sy*Sin[phi + 2*ta*ww] - 4*Hd0^2*sy*Sin[3*phi + 2*ta*ww] - 
          Hd0^2*sy*Sin[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
           Sin[phi + 2*ta*ww - 2*tb*ww] - 112*Delta^2*sy*Sin[phi + 2*tb*ww] - 
          8*Hd0^2*sy*Sin[phi + 2*tb*ww] - 32*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 
          6*Hd0^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 5*Hd0^2*sy*
           Sin[3*phi + 4*tb*ww] - 12*Hd0^2*sy*Sin[3*phi + 2*(ta + tb)*ww]) + 
        4*Hd1*ta^2*ww^2*(64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 
          32*Delta*Hd0*sz*Cos[2*(-ta + tb)*ww] - 80*Delta*Hd0*sz*
           Cos[2*(phi + ta*ww)] + 112*Delta^2*sx*Cos[phi + 2*ta*ww] + 
          8*Hd0^2*sx*Cos[phi + 2*ta*ww] - 32*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + 
          5*Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sx*
           Cos[phi + 2*ta*ww - 2*tb*ww] - 16*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] - 16*Delta^2*sx*Cos[phi + 2*tb*ww] - 
          8*Hd0^2*sx*Cos[phi + 2*tb*ww] - 4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 
          6*Hd0^2*sx*Cos[phi - 2*ta*ww + 2*tb*ww] + 
          Hd0^2*sx*Cos[3*phi + 4*tb*ww] + 12*Hd0^2*sx*
           Cos[3*phi + 2*(ta + tb)*ww] + 24*Hd0^2*sy*Sin[phi] - 
          112*Delta^2*sy*Sin[phi + 2*ta*ww] - 8*Hd0^2*sy*Sin[phi + 2*ta*ww] - 
          32*Hd0^2*sy*Sin[3*phi + 2*ta*ww] - 5*Hd0^2*sy*
           Sin[3*phi + 4*ta*ww] + 6*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 
          16*Delta^2*sy*Sin[phi + 2*tb*ww] + 8*Hd0^2*sy*Sin[phi + 2*tb*ww] - 
          4*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 6*Hd0^2*sy*
           Sin[phi - 2*ta*ww + 2*tb*ww] - Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 
          12*Hd0^2*sy*Sin[3*phi + 2*(ta + tb)*ww]) - 
        8*Hd0*tb*ww^2*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
          16*Delta*Hd0*sz*Cos[2*(-ta + tb)*ww] - 24*Delta*Hd0*sz*
           Cos[2*(phi + ta*ww)] + 48*Delta^2*sx*Cos[phi + 2*ta*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*ta*ww] + Hd0^2*sx*Cos[3*phi + 4*ta*ww] + 
          2*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 24*Delta*Hd0*sz*
           Cos[2*(phi + tb*ww)] + 48*Delta^2*sx*Cos[phi + 2*tb*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 2*Hd0^2*sx*
           Cos[phi - 2*ta*ww + 2*tb*ww] + Hd0^2*sx*Cos[3*phi + 4*tb*ww] + 
          4*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 8*Hd0^2*sy*Sin[phi] - 
          48*Delta^2*sy*Sin[phi + 2*ta*ww] - 6*Hd0^2*sy*
           Sin[3*phi + 2*ta*ww] - Hd0^2*sy*Sin[3*phi + 4*ta*ww] + 
          2*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] - 48*Delta^2*sy*
           Sin[phi + 2*tb*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + 
          2*Hd0^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 
          Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 4*Hd0^2*sy*
           Sin[3*phi + 2*(ta + tb)*ww]) + 4*Hd0*ta*ww^2*(72*Delta*Hd0*sz + 
          24*Delta*Hd0*sz*Cos[phi + 2*ta*ww]^2 + 12*Hd0^2*sx*
           Cos[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
          16*Delta*Hd0*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
           Cos[phi + 2*tb*ww] + 4*Hd0^2*sx*Cos[phi + 2*tb*ww] - 
          4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*tb*ww] - 
          6*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 30*Hd0^2*sy*Sin[phi] - 
          3*Hd0^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 4*Hd0^2*sx*
           Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*Hd0^2*sy*Cos[phi + 2*tb*ww]*
           Sin[2*phi] + 24*Hd0^2*sy*Cos[phi + (ta + tb)*ww]*
           Sin[(-ta + tb)*ww] - 48*Hd0^2*sy*Cos[2*(phi + ta*ww)]*
           Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 32*Delta*Hd0*sz*
           Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 - 
          8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
            2 - 6*Hd0^2*sx*Sin[phi]*Sin[2*(-ta + tb)*ww] + 
          24*Hd0^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 96*Delta^2*sy*
           Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*Sin[phi + 2*ta*ww] + 
          48*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*ta*ww] + 96*Delta*Hd0*sz*
           Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww]*Sin[phi + 2*ta*ww] + 
          24*Delta*Hd0*sz*Sin[phi + 2*ta*ww]^2 - 2*Hd0^2*sx*Sin[phi]*
           Sin[2*phi + 4*ta*ww] - 12*Hd0^2*sy*Sin[3*phi + 4*ta*ww] - 
          6*Hd0^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 12*Hd0^2*sx*Sin[phi]*
           Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
          4*Hd0^2*sy*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Cos[phi]^2*
           Sin[phi + 2*tb*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*tb*ww] + 
          2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*
           Sin[3*phi + 2*tb*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*tb*ww] - 
          3*Hd0^2*sy*Sin[3*phi + 4*tb*ww] + 24*Hd0^2*sx*Sin[(-ta + tb)*ww]*
           Sin[phi + (ta + tb)*ww] - 48*Hd0^2*sx*Cos[2*(phi + ta*ww)]*
           Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] + 32*Delta*Hd0*sz*
           Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
          24*Cos[phi + 2*ta*ww]*(4*Delta^2*sx - Hd0^2*sx - 
            4*Delta*Hd0*sz*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]) - 
          2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (ta + tb)*ww)] + 
          Hd0*Cos[phi]*(30*Hd0*sx - 48*Delta*sz*Cos[phi + 2*ta*ww] + 
            3*Hd0*sx*Cos[2*phi + 4*ta*ww] - 32*Delta*sz*Cos[phi + 2*tb*ww] + 
            6*Hd0*sy*Sin[2*(-ta + tb)*ww] - 24*Hd0*sy*Sin[2*(phi + ta*ww)] - 
            2*Hd0*sy*Sin[2*phi + 4*ta*ww] - 12*Hd0*sy*Sin[2*(phi + tb*ww)] + 
            Hd0*sy*Sin[2*phi + 4*tb*ww] - 8*Hd0*sx*Sin[(-ta + tb)*ww]^2*
             Sin[phi + (ta + tb)*ww]^2 - 2*Hd0*sy*
             Sin[2*(phi + (ta + tb)*ww)]) + 6*Hd0^2*sy*
           Sin[3*phi + 2*(ta + tb)*ww]))/ww^4)/(12288*(-ta + tb))
 
HoldPattern[CommutativeQ[sx]] ^= False
 
CommutativeQ[Blank] = False
 
CommutativeQ[BlankNullSequence] = False
 
CommutativeQ[BlankSequence] = False
 
CommutativeQ[Pattern] = False
 
CommutativeQ[Slot] = False
 
CommutativeQ[SlotSequence] = False
 
CommutativeQ[NonCommutativeMultiply`Private`a_List] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[NonCommutativeMultiply`Private`a_SparseArray] := 
    False /; MatrixQ[NonCommutativeMultiply`Private`a]
 
CommutativeQ[Subscript[NonCommutativeMultiply`Private`x_, ___]] := 
    CommutativeQ[NonCommutativeMultiply`Private`x]
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)?CommutativeQ[
      NonCommutativeMultiply`Private`x___]] := 
    And @@ CommutativeQ /@ {NonCommutativeMultiply`Private`x}
 
CommutativeQ[(NonCommutativeMultiply`Private`f_)[
      NonCommutativeMultiply`Private`x___]] := False
 
CommutativeQ[_] = True
 
CommutativeQ /: CommutativeQ::Commutative = 
     "Tried to set the `1` \"`2`\" to be commutative."
 
CommutativeQ /: CommutativeQ::CommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be commutative. Please set the symbol \
\"`1`\" to be commutative instead."
 
CommutativeQ /: CommutativeQ::NonCommutative = 
     "Tried to set the `1` \"`2`\" to be noncommutative."
 
CommutativeQ /: CommutativeQ::NonCommutativeSubscript = "Tried to set the \
subscript \"`2`\" of symbol \"`1`\" to be noncommutative. Please set the \
symbol \"`1`\" to be noncommutative instead."
 
CommutativeQ /: CommutativeQ::usage = "CommutativeQ[expr] is True if \
expression expr is commutative (the default), and False if expr is \
noncommutative.\n\nSee also: SetCommutative, SetNonCommutative."
 
Attributes[Subscript] = {NHoldRest}
 
Subscript[WWreal, 1][t_, t0_] = (-I/8)*(Hd1*t^2*(sx*Cos[phi] + sy*Sin[phi]) - 
      Hd1*t0^2*(sx*Cos[phi] + sy*Sin[phi]) + 
      2*t*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
      2*t0*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
      (Hd1*t*(sy*Cos[phi + 2*t*ww] + sx*Sin[phi + 2*t*ww]))/ww - 
      (Hd1*t0*(sy*Cos[phi + 2*t0*ww] + sx*Sin[phi + 2*t0*ww]))/ww - 
      (Hd1*Sin[(t - t0)*ww]*(sy*Cos[phi + (t + t0)*ww] + 
         sx*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (2*Hd0*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 2][t_, t0_] = 
    (-I/768)*((12*Hd1^2*sz*t*t0^2*Cos[2*(phi + t*ww)])/ww - 
      (4*Hd1^2*sz*t^3*(-2 + 3*Cos[2*(phi + t*ww)]))/ww + 
      (6*Hd1^2*sz*t*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t*ww)]))/ww^3 - 
      (12*Hd1^2*sz*t^2*t0*Cos[2*(phi + t0*ww)])/ww + 
      (4*Hd1^2*sz*t0^3*(-2 + 3*Cos[2*(phi + t0*ww)]))/ww - 
      (6*Hd1^2*sz*t0*(Cos[2*(t - t0)*ww] + 6*Cos[2*(phi + t0*ww)]))/ww^3 - 
      16*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      48*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) - 
      48*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) + 
      16*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      (12*Hd1^2*sz*t*t0*Sin[2*(t - t0)*ww])/ww^2 - 
      (12*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (3*Hd1^2*sz*(Sin[2*(t - t0)*ww] + 6*Sin[2*(phi + t*ww)] - 
         6*Sin[2*(phi + t0*ww)]))/ww^4 + 
      (6*Hd1^2*sz*t^2*(5*Sin[2*(phi + t*ww)] + Sin[2*(phi + t0*ww)]))/ww^2 - 
      (6*Hd1^2*sz*t0^2*(Sin[2*(phi + t*ww)] + 5*Sin[2*(phi + t0*ww)]))/ww^2 - 
      (12*Hd0*(4*Delta*sy*Cos[phi + 2*t*ww] - 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(t - t0)*ww] - 2*Hd0*sz*Sin[2*(phi + t*ww)] + 
         4*Delta*sx*Sin[phi + 2*t*ww] + 2*Hd0*sz*Sin[2*(phi + t0*ww)] - 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (12*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] + Hd0*sz*Sin[2*(t - t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (12*Hd1*t0*(2*Delta*sy*Cos[phi + 2*t*ww] + 6*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(t - t0)*ww] - 
         Hd0*sz*Sin[2*(phi + t*ww)] + 2*Delta*sx*Sin[phi + 2*t*ww] - 
         5*Hd0*sz*Sin[2*(phi + t0*ww)] + 6*Delta*sx*Sin[phi + 2*t0*ww]))/
       ww^2 - (24*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww + 
      (24*Hd1*Sin[(t - t0)*ww]*(4*Delta*sy*Cos[phi + (t + t0)*ww] + 
         4*Delta*sx*Sin[phi + (t + t0)*ww] - 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 + 
      (48*Hd1*t*t0*Sin[(t - t0)*ww]*(2*Delta*sy*Cos[phi + (t + t0)*ww] + 
         2*Delta*sx*Sin[phi + (t + t0)*ww] - 
         Hd0*sz*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] + 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] + 
         4*Delta*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         2*Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (24*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         Hd0*sz*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[WWreal, 3][t_, t0_] = 
    ((-I/12288)*(16*Hd1*t^2*t0*ww^3*(-3*Hd0^2*sy*Cos[phi] + 
         (16*Delta^2 + 3*Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         3*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 8*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] - 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         3*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 8*Delta^2*sx*Sin[phi + 2*t0*ww]) - 
       16*Hd1*t*t0^2*ww^3*(-3*Hd0^2*sy*Cos[phi] + 8*Delta^2*sy*
          Cos[phi + 2*t*ww] + 16*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         3*Hd0^2*sy*Cos[phi + 2*t0*ww] + 3*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 16*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] - 3*Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       16*Hd1*t^3*ww^3*(Hd0^2*sy*Cos[phi] - 2*(4*Delta^2 + Hd0^2)*sy*
          Cos[phi + 2*t*ww] - 2*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sy*Cos[phi + 2*t0*ww] + Hd0^2*sy*Cos[3*phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[phi] + 4*Delta*Hd0*sz*Sin[2*(phi + t*ww)] - 
         8*Delta^2*sx*Sin[phi + 2*t*ww] - 2*Hd0^2*sx*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[3*phi + 2*t*ww] - 4*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         Hd0^2*sx*Sin[3*phi + 2*t0*ww]) + 
       4*Hd0*ww*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
         12*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
          Cos[phi + 2*t0*ww] - 3*Hd0^2*sy*Cos[phi + 2*t0*ww] - 
         12*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Cos[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sy*Cos[3*phi + 4*t0*ww] + 
         Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(t - t0)*ww] - 48*Delta*Hd0*sz*Sin[2*(phi + t*ww)] + 
         96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*Hd0^2*sx*Sin[phi + 2*t*ww] - 
         12*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 3*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
         Hd0^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
         3*Hd0^2*sx*Sin[phi + 2*t0*ww] + 12*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 3*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww]) - 
       Hd1*t0*ww*(56*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 10*Hd0^2*sy*
          Cos[3*phi + 4*t*ww] + 6*Hd0^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
         864*Delta^2*sy*Cos[phi + 2*t0*ww] - 62*Hd0^2*sy*Cos[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Cos[phi]^2*(Cos[phi + 2*t*ww] + 5*Cos[phi + 2*t0*ww]) + 
         64*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 91*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + 98*Hd0^2*sx*Sin[phi] - 
         288*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] - 464*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[phi] + 19*Hd0^2*sx*Cos[2*phi + 4*t0*ww]*
          Sin[phi] - 20*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t*ww] + 192*Delta^2*sx*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 288*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 
         16*Hd0^2*sy*Cos[phi + 2*t0*ww]*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 + 48*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]^2 + 
         32*Hd0^2*sx*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         16*Delta*Hd0*sz*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(t - t0)*ww] - 4*Hd0^2*sy*Sin[phi]*Sin[2*(t - t0)*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]*Sin[2*t0*ww] - 128*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] - 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + t*ww)] + 288*Delta^2*sx*Sin[phi + 2*t*ww] + 
         32*Hd0^2*sx*Sin[phi + 2*t*ww] - 32*Delta*Hd0*sz*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t*ww] + 8*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[2*phi]*Sin[phi + 2*t*ww] - 56*Hd0^2*sx*
          Sin[3*phi + 2*t*ww] - 2*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*phi + 4*t*ww] + 2*Hd0^2*sy*Sin[phi]*Sin[2*phi + 4*t*ww] + 
         10*Hd0^2*sx*Sin[3*phi + 4*t*ww] - 160*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] - 240*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)] + 864*Delta^2*sx*
          Sin[phi + 2*t0*ww] - 56*Hd0^2*sx*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sx*Cos[phi + 2*t0*ww]^2*Sin[phi + 2*t0*ww] + 
         40*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - 20*Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 12*Hd0^2*sy*Sin[2*(t - t0)*ww]*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t*ww]*
          Sin[phi + 2*t0*ww] - 2*Hd0^2*sy*Sin[2*phi + 4*t*ww]*
          Sin[phi + 2*t0*ww] + 24*Hd0^2*sy*Sin[2*(phi + t0*ww)]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sy*Cos[phi + 2*t0*ww]*
          Sin[phi + 2*t0*ww]^2 - 8*Hd0^2*sx*Sin[phi]*Sin[phi + 2*t0*ww]^2 + 
         4*Cos[phi + 2*t*ww]*(72*Delta^2*sy + 8*Hd0^2*sy - 
           Hd0^2*sx*Sin[2*phi] + 3*Hd0^2*sx*Sin[2*(t - t0)*ww] + 
           8*Delta*Hd0*sz*Sin[phi + 2*t0*ww] + 4*Hd0*Sin[phi]*
            (-(Delta*sz) + Hd0*sy*Sin[phi + 2*t0*ww])) - 
         64*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 25*Hd0^2*sy*Sin[phi]*
          Sin[2*phi + 4*t0*ww] + 81*Hd0^2*sx*Sin[3*phi + 4*t0*ww] - 
         192*Delta^2*sy*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         96*Delta*Hd0*sz*Sin[phi]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         240*Hd0^2*sx*Sin[(t - t0)*ww]*Sin[2*(phi + t0*ww)]*
          Sin[phi + (t + t0)*ww] - 288*Delta*Hd0*sz*Sin[(t - t0)*ww]*
          Sin[phi + 2*t0*ww]*Sin[phi + (t + t0)*ww] + 16*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 + 
         16*Hd0^2*sx*Sin[(t - t0)*ww]^2*Sin[phi + 2*t0*ww]*
          Sin[phi + (t + t0)*ww]^2 + 4*Hd0^2*sx*Cos[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - 4*Hd0^2*sy*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + 4*Hd0^2*sy*Sin[phi + 2*t0*ww]*
          Sin[2*(phi + (t + t0)*ww)] - Hd0*Cos[phi]*(144*Hd0*sy - 
           36*Hd0*sy*Cos[2*(t - t0)*ww] - 24*Hd0*sy*Cos[2*(phi + t*ww)] + 
           2*Hd0*sy*Cos[2*phi + 4*t*ww] - 264*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           25*Hd0*sy*Cos[2*phi + 4*t0*ww] + 4*Hd0*sy*
            Cos[2*(phi + (t + t0)*ww)] + 12*Hd0*sx*Sin[2*(t - t0)*ww] + 
           64*Delta*sz*Sin[phi + 2*t*ww] + 2*Hd0*sx*Sin[2*phi + 4*t*ww] + 
           416*Delta*sz*Sin[phi + 2*t0*ww] - 25*Hd0*sx*Sin[2*phi + 4*t0*ww] + 
           4*Hd0*sx*Sin[2*(phi + (t + t0)*ww)]) + 48*Hd0^2*sx*Sin[phi]*
          Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       8*Hd1*t0^3*ww^3*(2*Hd0^2*sy*Cos[phi]^2*Cos[phi + 2*t0*ww] + 
         4*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*Sin[phi] + 
         6*Hd0^2*sx*Cos[2*(phi + t0*ww)]*Sin[phi] + Cos[phi + 2*t0*ww]*
          (4*(4*Delta^2 + Hd0^2)*sy + 8*Delta*Hd0*sz*Sin[phi] - 
           Hd0^2*sx*Sin[2*phi]) + 16*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 8*Delta*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         16*Delta^2*sx*Sin[phi + 2*t0*ww] + 4*Hd0^2*sx*Sin[phi + 2*t0*ww] + 
         2*Hd0^2*sx*Sin[phi]^2*Sin[phi + 2*t0*ww] - Hd0^2*sy*Sin[2*phi]*
          Sin[phi + 2*t0*ww] - 4*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         8*Hd0^2*sx*Sin[phi]*Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww] - 
         2*Hd0*Cos[phi]*(3*Hd0*sy*Cos[2*(phi + t0*ww)] - 
           4*Delta*sz*Sin[phi + 2*t0*ww] + Hd0*sy*(1 - 4*Sin[(t - t0)*ww]*
              Sin[2*phi + (t + t0)*ww]))) - 2*Hd1*Sin[(t - t0)*ww]*
        (-24*Hd0^2*sy*Cos[phi + t*ww - t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 3*t*ww - t0*ww] - 24*Hd0^2*sy*Cos[phi - t*ww + t0*ww] + 
         27*Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sy*
          Cos[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sy*
          Cos[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 76*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         144*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + 24*Hd0^2*sx*
          Sin[phi + t*ww - t0*ww] - 2*Hd0^2*sx*Sin[phi + 3*t*ww - t0*ww] + 
         24*Hd0^2*sx*Sin[phi - t*ww + t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] - 2*Hd0^2*sx*
          Sin[phi - t*ww + 3*t0*ww] + 27*Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 576*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 76*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         384*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 144*Hd0^2*sx*
          Sin[3*phi + (t + t0)*ww]) - 32*Hd1*t*t0*ww^2*Sin[(t - t0)*ww]*
        (Hd0^2*sy*Cos[3*phi + 3*t*ww + t0*ww] + 
         Hd0^2*sy*Cos[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sy*
          Cos[phi + (t + t0)*ww] + 4*Hd0^2*sy*Cos[phi + (t + t0)*ww] + 
         7*Hd0^2*sy*Cos[3*phi + (t + t0)*ww] + Hd0^2*sx*
          Sin[3*phi + 3*t*ww + t0*ww] + Hd0^2*sx*
          Sin[3*phi + t*ww + 3*t0*ww] + 32*Delta^2*sx*
          Sin[phi + (t + t0)*ww] + 4*Hd0^2*sx*Sin[phi + (t + t0)*ww] - 
         16*Delta*Hd0*sz*Sin[2*phi + (t + t0)*ww] - 
         7*Hd0^2*sx*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 64*Hd0*t*t0*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 32*Hd0*t0^2*ww^3*
        Sin[(t - t0)*ww]*((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 4*Hd1*t*ww*
        (-18*Hd0^2*sy*Cos[phi] + (192*Delta^2 + 23*Hd0^2)*sy*
          Cos[phi + 2*t*ww] + 54*Hd0^2*sy*Cos[3*phi + 2*t*ww] + 
         11*Hd0^2*sy*Cos[3*phi + 4*t*ww] - 12*Hd0^2*sy*
          Cos[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sy*
          Cos[phi + 4*t*ww - 2*t0*ww] + 96*Delta^2*sy*Cos[phi + 2*t0*ww] + 
         14*Hd0^2*sy*Cos[phi + 2*t0*ww] + 18*Hd0^2*sy*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sy*
          Cos[3*phi + 4*t0*ww] + Hd0^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sy*Cos[3*phi + 2*(t + t0)*ww] + 18*Hd0^2*sx*Sin[phi] + 
         48*Delta*Hd0*sz*Sin[2*(t - t0)*ww] - 144*Delta*Hd0*sz*
          Sin[2*(phi + t*ww)] + 192*Delta^2*sx*Sin[phi + 2*t*ww] + 
         23*Hd0^2*sx*Sin[phi + 2*t*ww] - 54*Hd0^2*sx*Sin[3*phi + 2*t*ww] + 
         11*Hd0^2*sx*Sin[3*phi + 4*t*ww] + 12*Hd0^2*sx*
          Sin[phi + 2*t*ww - 2*t0*ww] - 2*Hd0^2*sx*
          Sin[phi + 4*t*ww - 2*t0*ww] - 48*Delta*Hd0*sz*
          Sin[2*(phi + t0*ww)] + 96*Delta^2*sx*Sin[phi + 2*t0*ww] + 
         14*Hd0^2*sx*Sin[phi + 2*t0*ww] - 18*Hd0^2*sx*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 2*Hd0^2*sx*
          Sin[3*phi + 4*t0*ww] + Hd0^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] + 
         14*Hd0^2*sx*Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t^2*ww^2*
        (64*Delta*Hd0*sz + 24*Hd0^2*sx*Cos[phi] + 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 80*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         112*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         32*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 5*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 16*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 16*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] - 4*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 12*Hd0^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 24*Hd0^2*sy*Sin[phi] - 
         112*Delta^2*sy*Sin[phi + 2*t*ww] - 8*Hd0^2*sy*Sin[phi + 2*t*ww] - 
         32*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 5*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 
         6*Hd0^2*sy*Sin[phi + 2*t*ww - 2*t0*ww] + 16*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 8*Hd0^2*sy*Sin[phi + 2*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 6*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       8*Hd0*t*ww^2*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
         16*Delta*Hd0*sz*Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t*ww)] + 48*Delta^2*sx*Cos[phi + 2*t*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         2*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 4*Hd0*t0*ww^2*
        (72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] + 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] - 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(t - t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(t - t0)*ww]^2 - 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] + 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 24*Hd0^2*sx*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww]) - 4*Hd1*t0^2*ww^2*
        (-64*Delta*Hd0*sz - 24*Hd0^2*sx*Cos[phi] - 32*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] + 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         16*Delta^2*sx*Cos[phi + 2*t*ww] + 8*Hd0^2*sx*Cos[phi + 2*t*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] - Hd0^2*sx*Cos[3*phi + 4*t*ww] - 
         6*Hd0^2*sx*Cos[phi + 2*t*ww - 2*t0*ww] + 80*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] - 112*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         8*Hd0^2*sx*Cos[phi + 2*t0*ww] + 32*Hd0^2*sx*Cos[3*phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] - 5*Hd0^2*sx*
          Cos[3*phi + 4*t0*ww] - 12*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] - 
         24*Hd0^2*sy*Sin[phi] - 16*Delta^2*sy*Sin[phi + 2*t*ww] - 
         8*Hd0^2*sy*Sin[phi + 2*t*ww] + 4*Hd0^2*sy*Sin[3*phi + 2*t*ww] + 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] - 6*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] + 112*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         8*Hd0^2*sy*Sin[phi + 2*t0*ww] + 32*Hd0^2*sy*Sin[3*phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] + 5*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] + 12*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww])))/
     ww^4
 
HoldPattern[CommutativeQ[WWreal]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
