HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*(4*Delta*sz*t*ww^2 - 4*Delta*sz*t0*ww^2 + 
       sx*(2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2*Cos[phi] + 
       Hd1*sy*(t - t0)*ww*Cos[phi + 2*t*ww] + 2*Hd0*sy*t*ww^2*Sin[phi] + 
       Hd1*sy*t^2*ww^2*Sin[phi] - 2*Hd0*sy*t0*ww^2*Sin[phi] - 
       2*Hd1*sy*t*t0*ww^2*Sin[phi] + Hd1*sy*t0^2*ww^2*Sin[phi] - 
       Hd1*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
       2*Hd0*sx*ww*Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 
       Hd1*sx*t*ww*Sin[phi + 2*t*ww] - Hd1*sx*t0*ww*Sin[phi + 2*t*ww] - 
       Hd1*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
       2*Hd0*sy*ww*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (6*Hd1*t*t0*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww - 
      (3*Hd1*t0*(4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*
          Cos[phi + 2*t0*ww] - 4*Delta*sx*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         3*Hd0*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] - 
         3*Hd0*sz*Sin[2*(phi + t0*ww)] + 4*Delta*sx*Sin[phi + 2*t0*ww] + 
         4*Delta*sy*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         3*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((-I/3072)*Hd0*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
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
       6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*Hd0^2*sx*Sin[3*phi + 4*t0*ww] + Hd0^2*sx*
        Sin[phi - 2*t*ww + 4*t0*ww] - 8*t^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 8*t0^2*ww^2*Sin[(-t + t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 16*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t*ww] + 2*Hd0^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] - 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(-t + t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(-t + t0)*ww]^2 + 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(-t + t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] - 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] - 24*Hd0^2*sx*Sin[(-t + t0)*ww]*
          Sin[phi + (t + t0)*ww] + 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] - 6*sy*Sin[2*(-t + t0)*
                ww] - 12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Hlinbar[tb_, ta_] = ((384*(-4*Delta*sz*ta*ww^2 + 4*Delta*sz*tb*ww^2 + 
         sx*(-ta + tb)*(2*Hd0 + Hd1*(-ta + tb))*ww^2*Cos[phi] + 
         Hd1*sy*(-ta + tb)*ww*Cos[phi + 2*tb*ww] - 2*Hd0*sy*ta*ww^2*
          Sin[phi] + Hd1*sy*ta^2*ww^2*Sin[phi] + 2*Hd0*sy*tb*ww^2*Sin[phi] - 
         2*Hd1*sy*ta*tb*ww^2*Sin[phi] + Hd1*sy*tb^2*ww^2*Sin[phi] - 
         2*Hd0*sx*ww*Cos[phi + (ta + tb)*ww]*Sin[(ta - tb)*ww] - 
         Hd1*sy*Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] - 
         Hd1*sx*ta*ww*Sin[phi + 2*tb*ww] + Hd1*sx*tb*ww*Sin[phi + 2*tb*ww] + 
         2*Hd0*sy*ww*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] - 
         Hd1*sx*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]))/ww^2 - 
      16*(-4*Delta*Hd1*ta^3*(sy*Cos[phi] - sx*Sin[phi]) + 
        12*Delta*Hd1*ta^2*tb*(sy*Cos[phi] - sx*Sin[phi]) - 
        12*Delta*Hd1*ta*tb^2*(sy*Cos[phi] - sx*Sin[phi]) + 
        4*Delta*Hd1*tb^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        (3*Hd0*(4*Delta*sy*Cos[phi + 2*ta*ww] - 4*Delta*sy*
            Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(ta - tb)*ww] - 
           2*Hd0*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] + 
           2*Hd0*sz*Sin[2*(phi + tb*ww)] - 4*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 + (3*Hd1*tb*(2*Delta*sy*Cos[phi + 2*ta*ww] + 
           6*Delta*sy*Cos[phi + 2*tb*ww] - Hd0*sz*Sin[2*(ta - tb)*ww] - 
           Hd0*sz*Sin[2*(phi + ta*ww)] + 2*Delta*sx*Sin[phi + 2*ta*ww] - 
           5*Hd0*sz*Sin[2*(phi + tb*ww)] + 6*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 + (6*Hd0*tb*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + Hd0*sz*Cos[2*(phi + tb*ww)] - 
           2*Delta*sx*Cos[phi + 2*tb*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] + 
           2*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (6*Hd1*ta*tb*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww + 
        (3*Hd1*tb^2*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (3*Hd1*ta*(4*Delta*sy*Cos[phi + 2*ta*ww] + 4*Delta*sy*
            Cos[phi + 2*tb*ww] - 4*Delta*sx*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 4*Hd0*sz*Cos[2*phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] - Hd0*sz*Sin[2*(ta - tb)*ww] - 
           3*Hd0*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] - 
           3*Hd0*sz*Sin[2*(phi + tb*ww)] + 4*Delta*sx*Sin[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww]))/ww^2 + 
        (6*Hd1*Sin[(-ta + tb)*ww]*(-4*Delta*sy*Cos[phi + (ta + tb)*ww] - 
           4*Delta*sx*Sin[phi + (ta + tb)*ww] + 3*Hd0*sz*
            Sin[2*phi + (ta + tb)*ww]))/ww^3 - 
        (6*Hd0*ta*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           4*Delta*sx*Cos[phi + 2*ta*ww] - 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 4*Delta*sy*Sin[phi + 2*ta*ww] - 
           4*Delta*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           2*Hd0*sz*Sin[(ta - tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (6*Hd1*ta^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] - 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] - 
           4*Delta*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           3*Hd0*sz*Sin[(ta - tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww) + 
      (Hd0*(-96*Delta^2*sy*Cos[phi + 2*ta*ww] - 3*Hd0^2*sy*
          Cos[phi + 2*ta*ww] - 12*Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 
         3*Hd0^2*sy*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
          Cos[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sy*
          Cos[phi + 4*ta*ww - 2*tb*ww] + 3*(32*Delta^2 + Hd0^2)*sy*
          Cos[phi + 2*tb*ww] + 12*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
         6*Hd0^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sy*
          Cos[3*phi + 4*tb*ww] - Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
         48*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] + 48*Delta*Hd0*sz*
          Sin[2*(phi + ta*ww)] - 96*Delta^2*sx*Sin[phi + 2*ta*ww] - 
         3*Hd0^2*sx*Sin[phi + 2*ta*ww] + 12*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 
         3*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*
          Sin[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sx*
          Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*Hd0*sz*
          Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
         3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 12*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
         6*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sx*
          Sin[3*phi + 4*tb*ww] - Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww] + 
         8*ta^2*ww^2*Sin[(ta - tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 
         16*ta*tb*ww^2*Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         8*tb^2*ww^2*Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         2*tb*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
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
            Sin[3*phi + 2*(ta + tb)*ww]) + ta*ww*(72*Delta*Hd0*sz + 
           24*Delta*Hd0*sz*Cos[phi + 2*ta*ww]^2 + 12*Hd0^2*sx*
            Cos[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
           16*Delta*Hd0*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
            Cos[phi + 2*tb*ww] + 4*Hd0^2*sx*Cos[phi + 2*tb*ww] - 
           4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 3*Hd0^2*sx*
            Cos[3*phi + 4*tb*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 
           30*Hd0^2*sy*Sin[phi] - 3*Hd0^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 
           4*Hd0^2*sx*Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
            Cos[phi + 2*tb*ww]*Sin[2*phi] - 24*Hd0^2*sy*
            Cos[phi + (ta + tb)*ww]*Sin[(ta - tb)*ww] + 
           48*Hd0^2*sy*Cos[2*(phi + ta*ww)]*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 32*Delta*Hd0*sz*Cos[phi + (ta + tb)*ww]^2*
            Sin[(ta - tb)*ww]^2 - 8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*
            Sin[phi]*Sin[(ta - tb)*ww]^2 + 6*Hd0^2*sx*Sin[phi]*
            Sin[2*(ta - tb)*ww] + 24*Hd0^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 
           96*Delta^2*sy*Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*
            Sin[phi + 2*ta*ww] + 48*Delta*Hd0*sz*Sin[phi]*
            Sin[phi + 2*ta*ww] - 96*Delta*Hd0*sz*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww]*Sin[phi + 2*ta*ww] + 24*Delta*Hd0*sz*
            Sin[phi + 2*ta*ww]^2 - 2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*ta*ww] - 
           12*Hd0^2*sy*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sy*
            Sin[phi + 2*ta*ww - 2*tb*ww] + 12*Hd0^2*sx*Sin[phi]*
            Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
           4*Hd0^2*sy*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Cos[phi]^2*
            Sin[phi + 2*tb*ww] + 32*Delta*Hd0*sz*Sin[phi]*
            Sin[phi + 2*tb*ww] + 2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 
           4*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + Hd0^2*sx*Sin[phi]*
            Sin[2*phi + 4*tb*ww] - 3*Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 
           24*Hd0^2*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           48*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[(ta - tb)*ww]*
            Sin[phi + (ta + tb)*ww] + 32*Delta*Hd0*sz*Sin[(ta - tb)*ww]^2*
            Sin[phi + (ta + tb)*ww]^2 + 24*Cos[phi + 2*ta*ww]*
            (4*Delta^2*sx - Hd0^2*sx + 4*Delta*Hd0*sz*Sin[(ta - tb)*ww]*
              Sin[phi + (ta + tb)*ww]) - 2*Hd0^2*sx*Sin[phi]*
            Sin[2*(phi + (ta + tb)*ww)] + Hd0*Cos[phi]*(30*Hd0*sx - 
             48*Delta*sz*Cos[phi + 2*ta*ww] + 3*Hd0*sx*Cos[2*phi + 4*ta*ww] - 
             32*Delta*sz*Cos[phi + 2*tb*ww] - 6*Hd0*sy*Sin[2*(ta - tb)*ww] - 
             24*Hd0*sy*Sin[2*(phi + ta*ww)] - 2*Hd0*sy*Sin[2*phi + 4*ta*ww] - 
             12*Hd0*sy*Sin[2*(phi + tb*ww)] + Hd0*sy*Sin[2*phi + 4*tb*ww] - 
             8*Hd0*sx*Sin[(ta - tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 - 
             2*Hd0*sy*Sin[2*(phi + (ta + tb)*ww)]) + 6*Hd0^2*sy*
            Sin[3*phi + 2*(ta + tb)*ww])))/ww^3)/(3072*(-ta + tb))
 
HoldPattern[CommutativeQ[sz]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*(4*Delta*sz*t*ww^2 - 4*Delta*sz*t0*ww^2 + 
       sx*(2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2*Cos[phi] + 
       Hd1*sy*(t - t0)*ww*Cos[phi + 2*t*ww] + 2*Hd0*sy*t*ww^2*Sin[phi] + 
       Hd1*sy*t^2*ww^2*Sin[phi] - 2*Hd0*sy*t0*ww^2*Sin[phi] - 
       2*Hd1*sy*t*t0*ww^2*Sin[phi] + Hd1*sy*t0^2*ww^2*Sin[phi] - 
       Hd1*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
       2*Hd0*sx*ww*Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 
       Hd1*sx*t*ww*Sin[phi + 2*t*ww] - Hd1*sx*t0*ww*Sin[phi + 2*t*ww] - 
       Hd1*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
       2*Hd0*sy*ww*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (6*Hd1*t*t0*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww - 
      (3*Hd1*t0*(4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*
          Cos[phi + 2*t0*ww] - 4*Delta*sx*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         3*Hd0*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] - 
         3*Hd0*sz*Sin[2*(phi + t0*ww)] + 4*Delta*sx*Sin[phi + 2*t0*ww] + 
         4*Delta*sy*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         3*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((-I/3072)*Hd0*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
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
       6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*Hd0^2*sx*Sin[3*phi + 4*t0*ww] + Hd0^2*sx*
        Sin[phi - 2*t*ww + 4*t0*ww] - 8*t^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 8*t0^2*ww^2*Sin[(-t + t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 16*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t*ww] + 2*Hd0^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] - 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(-t + t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(-t + t0)*ww]^2 + 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(-t + t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] - 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] - 24*Hd0^2*sx*Sin[(-t + t0)*ww]*
          Sin[phi + (t + t0)*ww] + 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] - 6*sy*Sin[2*(-t + t0)*
                ww] - 12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*t - Hd1*t0)*
          ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(t - t0))*ww^2)*
        Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*t - Hd1*t0)*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] - 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Hlineffbar[tb_, ta_] = (-16*Delta*Hd1*(ta - tb)^2*(sy*Cos[phi] - 
        sx*Sin[phi]) + (3*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*(-ta + tb))*
            ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(-ta + tb))*
            ww^2)*Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(-ta + tb))*
            ww)*Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*
          Cos[phi + 2*\[Alpha]0] - 32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 
         32*Delta*Hd0*sx*ww*Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*
          Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*ta*ww*
          Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*tb*ww*
          Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
         Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
         64*Hd0*sy*ww^2*Sin[phi] - 32*Hd1*sy*ta*ww^2*Sin[phi] + 
         32*Hd1*sy*tb*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 
         16*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*
          Sin[phi + 2*\[Alpha]0] - 32*Delta*Hd0*sy*ww*
          Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*ta*ww*
          Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*tb*ww*
          Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
         Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2)/768
 
HoldPattern[CommutativeQ[sy]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*t - Hd1*t0)*
          ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(t - t0))*ww^2)*
        Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*t - Hd1*t0)*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] - 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
\[CapitalOmega]\[CapitalOmega]realsum[tb_, ta_] = 
    (-I/3072)*((384*(-4*Delta*sz*ta*ww^2 + 4*Delta*sz*tb*ww^2 + 
         sx*(-ta + tb)*(2*Hd0 + Hd1*(-ta + tb))*ww^2*Cos[phi] + 
         Hd1*sy*(-ta + tb)*ww*Cos[phi + 2*tb*ww] - 2*Hd0*sy*ta*ww^2*
          Sin[phi] + Hd1*sy*ta^2*ww^2*Sin[phi] + 2*Hd0*sy*tb*ww^2*Sin[phi] - 
         2*Hd1*sy*ta*tb*ww^2*Sin[phi] + Hd1*sy*tb^2*ww^2*Sin[phi] - 
         2*Hd0*sx*ww*Cos[phi + (ta + tb)*ww]*Sin[(ta - tb)*ww] - 
         Hd1*sy*Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] - 
         Hd1*sx*ta*ww*Sin[phi + 2*tb*ww] + Hd1*sx*tb*ww*Sin[phi + 2*tb*ww] + 
         2*Hd0*sy*ww*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] - 
         Hd1*sx*Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]))/ww^2 - 
      16*(-4*Delta*Hd1*ta^3*(sy*Cos[phi] - sx*Sin[phi]) + 
        12*Delta*Hd1*ta^2*tb*(sy*Cos[phi] - sx*Sin[phi]) - 
        12*Delta*Hd1*ta*tb^2*(sy*Cos[phi] - sx*Sin[phi]) + 
        4*Delta*Hd1*tb^3*(sy*Cos[phi] - sx*Sin[phi]) - 
        (3*Hd0*(4*Delta*sy*Cos[phi + 2*ta*ww] - 4*Delta*sy*
            Cos[phi + 2*tb*ww] + Hd0*sz*Sin[2*(ta - tb)*ww] - 
           2*Hd0*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] + 
           2*Hd0*sz*Sin[2*(phi + tb*ww)] - 4*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 + (3*Hd1*tb*(2*Delta*sy*Cos[phi + 2*ta*ww] + 
           6*Delta*sy*Cos[phi + 2*tb*ww] - Hd0*sz*Sin[2*(ta - tb)*ww] - 
           Hd0*sz*Sin[2*(phi + ta*ww)] + 2*Delta*sx*Sin[phi + 2*ta*ww] - 
           5*Hd0*sz*Sin[2*(phi + tb*ww)] + 6*Delta*sx*Sin[phi + 2*tb*ww]))/
         ww^2 + (6*Hd0*tb*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] + Hd0*sz*Cos[2*(phi + tb*ww)] - 
           2*Delta*sx*Cos[phi + 2*tb*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] + 
           2*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (6*Hd1*ta*tb*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww + 
        (3*Hd1*tb^2*(-2*Hd0*sz + Hd0*sz*Cos[2*(phi + ta*ww)] + 
           3*Hd0*sz*Cos[2*(phi + tb*ww)] - 4*Delta*sx*Cos[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[phi + 2*tb*ww]))/ww - 
        (3*Hd1*ta*(4*Delta*sy*Cos[phi + 2*ta*ww] + 4*Delta*sy*
            Cos[phi + 2*tb*ww] - 4*Delta*sx*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 4*Hd0*sz*Cos[2*phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] - Hd0*sz*Sin[2*(ta - tb)*ww] - 
           3*Hd0*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] - 
           3*Hd0*sz*Sin[2*(phi + tb*ww)] + 4*Delta*sx*Sin[phi + 2*tb*ww] + 
           4*Delta*sy*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww]))/ww^2 + 
        (6*Hd1*Sin[(-ta + tb)*ww]*(-4*Delta*sy*Cos[phi + (ta + tb)*ww] - 
           4*Delta*sx*Sin[phi + (ta + tb)*ww] + 3*Hd0*sz*
            Sin[2*phi + (ta + tb)*ww]))/ww^3 - 
        (6*Hd0*ta*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           4*Delta*sx*Cos[phi + 2*ta*ww] - 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 4*Delta*sy*Sin[phi + 2*ta*ww] - 
           4*Delta*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           2*Hd0*sz*Sin[(ta - tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww + 
        (6*Hd1*ta^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + ta*ww)] - 
           2*Delta*sx*Cos[phi + 2*ta*ww] - 4*Delta*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 2*Delta*sy*Sin[phi + 2*ta*ww] - 
           4*Delta*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           3*Hd0*sz*Sin[(ta - tb)*ww]*Sin[2*phi + (ta + tb)*ww]))/ww) + 
      (Hd0*(-96*Delta^2*sy*Cos[phi + 2*ta*ww] - 3*Hd0^2*sy*
          Cos[phi + 2*ta*ww] - 12*Hd0^2*sy*Cos[3*phi + 2*ta*ww] - 
         3*Hd0^2*sy*Cos[3*phi + 4*ta*ww] + 6*Hd0^2*sy*
          Cos[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sy*
          Cos[phi + 4*ta*ww - 2*tb*ww] + 3*(32*Delta^2 + Hd0^2)*sy*
          Cos[phi + 2*tb*ww] + 12*Hd0^2*sy*Cos[3*phi + 2*tb*ww] - 
         6*Hd0^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sy*
          Cos[3*phi + 4*tb*ww] - Hd0^2*sy*Cos[phi - 2*ta*ww + 4*tb*ww] + 
         48*Delta*Hd0*sz*Sin[2*(-ta + tb)*ww] + 48*Delta*Hd0*sz*
          Sin[2*(phi + ta*ww)] - 96*Delta^2*sx*Sin[phi + 2*ta*ww] - 
         3*Hd0^2*sx*Sin[phi + 2*ta*ww] + 12*Hd0^2*sx*Sin[3*phi + 2*ta*ww] - 
         3*Hd0^2*sx*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sx*
          Sin[phi + 2*ta*ww - 2*tb*ww] + Hd0^2*sx*
          Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*Hd0*sz*
          Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
         3*Hd0^2*sx*Sin[phi + 2*tb*ww] - 12*Hd0^2*sx*Sin[3*phi + 2*tb*ww] + 
         6*Hd0^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 3*Hd0^2*sx*
          Sin[3*phi + 4*tb*ww] - Hd0^2*sx*Sin[phi - 2*ta*ww + 4*tb*ww] + 
         8*ta^2*ww^2*Sin[(ta - tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) + 
         16*ta*tb*ww^2*Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         8*tb^2*ww^2*Sin[(-ta + tb)*ww]*((8*Delta^2 + Hd0^2)*sx*
            Cos[phi + (ta + tb)*ww] - 4*Delta*Hd0*sz*
            Cos[2*phi + (ta + tb)*ww] - Hd0^2*sx*Cos[3*phi + (ta + tb)*ww] - 
           8*Delta^2*sy*Sin[phi + (ta + tb)*ww] - Hd0^2*sy*
            Sin[phi + (ta + tb)*ww] - Hd0^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         2*tb*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 
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
            Sin[3*phi + 2*(ta + tb)*ww]) + ta*ww*(72*Delta*Hd0*sz + 
           24*Delta*Hd0*sz*Cos[phi + 2*ta*ww]^2 + 12*Hd0^2*sx*
            Cos[3*phi + 4*ta*ww] - 6*Hd0^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
           16*Delta*Hd0*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
            Cos[phi + 2*tb*ww] + 4*Hd0^2*sx*Cos[phi + 2*tb*ww] - 
           4*Hd0^2*sx*Cos[3*phi + 2*tb*ww] + 3*Hd0^2*sx*
            Cos[3*phi + 4*tb*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 
           30*Hd0^2*sy*Sin[phi] - 3*Hd0^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 
           4*Hd0^2*sx*Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
            Cos[phi + 2*tb*ww]*Sin[2*phi] - 24*Hd0^2*sy*
            Cos[phi + (ta + tb)*ww]*Sin[(ta - tb)*ww] + 
           48*Hd0^2*sy*Cos[2*(phi + ta*ww)]*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww] + 32*Delta*Hd0*sz*Cos[phi + (ta + tb)*ww]^2*
            Sin[(ta - tb)*ww]^2 - 8*Hd0^2*sy*Cos[phi + (ta + tb)*ww]^2*
            Sin[phi]*Sin[(ta - tb)*ww]^2 + 6*Hd0^2*sx*Sin[phi]*
            Sin[2*(ta - tb)*ww] + 24*Hd0^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 
           96*Delta^2*sy*Sin[phi + 2*ta*ww] + 24*Hd0^2*sy*
            Sin[phi + 2*ta*ww] + 48*Delta*Hd0*sz*Sin[phi]*
            Sin[phi + 2*ta*ww] - 96*Delta*Hd0*sz*Cos[phi + (ta + tb)*ww]*
            Sin[(ta - tb)*ww]*Sin[phi + 2*ta*ww] + 24*Delta*Hd0*sz*
            Sin[phi + 2*ta*ww]^2 - 2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*ta*ww] - 
           12*Hd0^2*sy*Sin[3*phi + 4*ta*ww] - 6*Hd0^2*sy*
            Sin[phi + 2*ta*ww - 2*tb*ww] + 12*Hd0^2*sx*Sin[phi]*
            Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
           4*Hd0^2*sy*Sin[phi + 2*tb*ww] - 4*Hd0^2*sy*Cos[phi]^2*
            Sin[phi + 2*tb*ww] + 32*Delta*Hd0*sz*Sin[phi]*
            Sin[phi + 2*tb*ww] + 2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 
           4*Hd0^2*sy*Sin[3*phi + 2*tb*ww] + Hd0^2*sx*Sin[phi]*
            Sin[2*phi + 4*tb*ww] - 3*Hd0^2*sy*Sin[3*phi + 4*tb*ww] - 
           24*Hd0^2*sx*Sin[(ta - tb)*ww]*Sin[phi + (ta + tb)*ww] + 
           48*Hd0^2*sx*Cos[2*(phi + ta*ww)]*Sin[(ta - tb)*ww]*
            Sin[phi + (ta + tb)*ww] + 32*Delta*Hd0*sz*Sin[(ta - tb)*ww]^2*
            Sin[phi + (ta + tb)*ww]^2 + 24*Cos[phi + 2*ta*ww]*
            (4*Delta^2*sx - Hd0^2*sx + 4*Delta*Hd0*sz*Sin[(ta - tb)*ww]*
              Sin[phi + (ta + tb)*ww]) - 2*Hd0^2*sx*Sin[phi]*
            Sin[2*(phi + (ta + tb)*ww)] + Hd0*Cos[phi]*(30*Hd0*sx - 
             48*Delta*sz*Cos[phi + 2*ta*ww] + 3*Hd0*sx*Cos[2*phi + 4*ta*ww] - 
             32*Delta*sz*Cos[phi + 2*tb*ww] - 6*Hd0*sy*Sin[2*(ta - tb)*ww] - 
             24*Hd0*sy*Sin[2*(phi + ta*ww)] - 2*Hd0*sy*Sin[2*phi + 4*ta*ww] - 
             12*Hd0*sy*Sin[2*(phi + tb*ww)] + Hd0*sy*Sin[2*phi + 4*tb*ww] - 
             8*Hd0*sx*Sin[(ta - tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 - 
             2*Hd0*sy*Sin[2*(phi + (ta + tb)*ww)]) + 6*Hd0^2*sy*
            Sin[3*phi + 2*(ta + tb)*ww])))/ww^3)
 
HoldPattern[CommutativeQ[sz]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*t - Hd1*t0)*
          ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(t - t0))*ww^2)*
        Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*t - Hd1*t0)*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] - 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*(4*Delta*sz*t*ww^2 - 4*Delta*sz*t0*ww^2 + 
       sx*(2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2*Cos[phi] + 
       Hd1*sy*(t - t0)*ww*Cos[phi + 2*t*ww] + 2*Hd0*sy*t*ww^2*Sin[phi] + 
       Hd1*sy*t^2*ww^2*Sin[phi] - 2*Hd0*sy*t0*ww^2*Sin[phi] - 
       2*Hd1*sy*t*t0*ww^2*Sin[phi] + Hd1*sy*t0^2*ww^2*Sin[phi] - 
       Hd1*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
       2*Hd0*sx*ww*Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 
       Hd1*sx*t*ww*Sin[phi + 2*t*ww] - Hd1*sx*t0*ww*Sin[phi + 2*t*ww] - 
       Hd1*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
       2*Hd0*sy*ww*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (6*Hd1*t*t0*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww - 
      (3*Hd1*t0*(4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*
          Cos[phi + 2*t0*ww] - 4*Delta*sx*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         3*Hd0*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] - 
         3*Hd0*sz*Sin[2*(phi + t0*ww)] + 4*Delta*sx*Sin[phi + 2*t0*ww] + 
         4*Delta*sy*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         3*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((-I/3072)*Hd0*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
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
       6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*Hd0^2*sx*Sin[3*phi + 4*t0*ww] + Hd0^2*sx*
        Sin[phi - 2*t*ww + 4*t0*ww] - 8*t^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 8*t0^2*ww^2*Sin[(-t + t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 16*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t*ww] + 2*Hd0^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] - 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(-t + t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(-t + t0)*ww]^2 + 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(-t + t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] - 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] - 24*Hd0^2*sx*Sin[(-t + t0)*ww]*
          Sin[phi + (t + t0)*ww] + 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] - 6*sy*Sin[2*(-t + t0)*
                ww] - 12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
\[CapitalOmega]\[CapitalOmega]effsum[tb_, ta_] = 
    (I/768)*(-ta + tb)*(16*Delta*Hd1*(ta - tb)^2*(sy*Cos[phi] - 
        sx*Sin[phi]) - (3*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*(-ta + tb))*
            ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(-ta + tb))*
            ww^2)*Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(-ta + tb))*
            ww)*Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*
          Cos[phi + 2*\[Alpha]0] - 32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 
         32*Delta*Hd0*sx*ww*Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*
          Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*ta*ww*
          Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*tb*ww*
          Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
         Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
         64*Hd0*sy*ww^2*Sin[phi] - 32*Hd1*sy*ta*ww^2*Sin[phi] + 
         32*Hd1*sy*tb*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 
         16*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*
          Sin[phi + 2*\[Alpha]0] - 32*Delta*Hd0*sy*ww*
          Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*ta*ww*
          Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*tb*ww*
          Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
         Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2)
 
HoldPattern[CommutativeQ[sy]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*t - Hd1*t0)*
          ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(t - t0))*ww^2)*
        Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*t - Hd1*t0)*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] - 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*(4*Delta*sz*t*ww^2 - 4*Delta*sz*t0*ww^2 + 
       sx*(2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2*Cos[phi] + 
       Hd1*sy*(t - t0)*ww*Cos[phi + 2*t*ww] + 2*Hd0*sy*t*ww^2*Sin[phi] + 
       Hd1*sy*t^2*ww^2*Sin[phi] - 2*Hd0*sy*t0*ww^2*Sin[phi] - 
       2*Hd1*sy*t*t0*ww^2*Sin[phi] + Hd1*sy*t0^2*ww^2*Sin[phi] - 
       Hd1*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
       2*Hd0*sx*ww*Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 
       Hd1*sx*t*ww*Sin[phi + 2*t*ww] - Hd1*sx*t0*ww*Sin[phi + 2*t*ww] - 
       Hd1*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
       2*Hd0*sy*ww*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (6*Hd1*t*t0*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww - 
      (3*Hd1*t0*(4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*
          Cos[phi + 2*t0*ww] - 4*Delta*sx*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         3*Hd0*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] - 
         3*Hd0*sz*Sin[2*(phi + t0*ww)] + 4*Delta*sx*Sin[phi + 2*t0*ww] + 
         4*Delta*sy*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         3*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((-I/3072)*Hd0*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
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
       6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*Hd0^2*sx*Sin[3*phi + 4*t0*ww] + Hd0^2*sx*
        Sin[phi - 2*t*ww + 4*t0*ww] - 8*t^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 8*t0^2*ww^2*Sin[(-t + t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 16*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t*ww] + 2*Hd0^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] - 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(-t + t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(-t + t0)*ww]^2 + 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(-t + t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] - 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] - 24*Hd0^2*sx*Sin[(-t + t0)*ww]*
          Sin[phi + (t + t0)*ww] + 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] - 6*sy*Sin[2*(-t + t0)*
                ww] - 12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
Jlin = ((I/4)*(Emd0 - Epd0)*Sin[\[Alpha]0 - \[Alpha]j]*
       (sx*Cos[phi + \[Alpha]0 + \[Alpha]j] - 
        sy*Sin[phi + \[Alpha]0 + \[Alpha]j]))/ww + 
     ((I/32)*Sin[\[Alpha]0 - \[Alpha]j]*
       (-((Emd0^2 - Epd0^2)*sz*Cos[\[Alpha]0 - \[Alpha]j]) - 
        4*(Delta*(Emd0 - Epd0)*sx + (Emd1 - Epd1)*sy)*
         Cos[phi + \[Alpha]0 + \[Alpha]j] + 2*Emd0^2*sz*
         Cos[2*phi + \[Alpha]0 + \[Alpha]j] - 2*Epd0^2*sz*
         Cos[2*phi + \[Alpha]0 + \[Alpha]j] - 4*Emd1*sx*
         Sin[phi + \[Alpha]0 + \[Alpha]j] + 4*Epd1*sx*
         Sin[phi + \[Alpha]0 + \[Alpha]j] + 4*Delta*Emd0*sy*
         Sin[phi + \[Alpha]0 + \[Alpha]j] - 4*Delta*Epd0*sy*
         Sin[phi + \[Alpha]0 + \[Alpha]j]))/ww^2
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*Hd0^2) + Hd0*(Hd0 + Hd1*t - Hd1*t0)*
          ww + 16*Delta*ww^2) - 2*sx*(Hd0^3 - 16*(2*Hd0 + Hd1*(t - t0))*ww^2)*
        Cos[phi] + 8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*t - Hd1*t0)*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] - 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*(4*Delta*sz*t*ww^2 - 4*Delta*sz*t0*ww^2 + 
       sx*(2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2*Cos[phi] + 
       Hd1*sy*(t - t0)*ww*Cos[phi + 2*t*ww] + 2*Hd0*sy*t*ww^2*Sin[phi] + 
       Hd1*sy*t^2*ww^2*Sin[phi] - 2*Hd0*sy*t0*ww^2*Sin[phi] - 
       2*Hd1*sy*t*t0*ww^2*Sin[phi] + Hd1*sy*t0^2*ww^2*Sin[phi] - 
       Hd1*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
       2*Hd0*sx*ww*Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 
       Hd1*sx*t*ww*Sin[phi + 2*t*ww] - Hd1*sx*t0*ww*Sin[phi + 2*t*ww] - 
       Hd1*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 
       2*Hd0*sy*ww*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww - 
      (6*Hd1*t*t0*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 + 
      (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww - 
      (3*Hd1*t0*(4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*
          Cos[phi + 2*t0*ww] - 4*Delta*sx*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Hd0*sz*Cos[2*phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         3*Hd0*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] - 
         3*Hd0*sz*Sin[2*(phi + t0*ww)] + 4*Delta*sx*Sin[phi + 2*t0*ww] + 
         4*Delta*sy*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww]))/ww^2 + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         3*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((-I/3072)*Hd0*(3*(32*Delta^2 + Hd0^2)*sy*Cos[phi + 2*t*ww] + 
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
       6*Hd0^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*Hd0^2*sx*Sin[3*phi + 4*t0*ww] + Hd0^2*sx*
        Sin[phi - 2*t*ww + 4*t0*ww] - 8*t^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) + 8*t0^2*ww^2*Sin[(-t + t0)*ww]*
        ((8*Delta^2 + Hd0^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*Hd0*sz*Cos[2*phi + (t + t0)*ww] - 
         Hd0^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - Hd0^2*sy*Sin[phi + (t + t0)*ww] - 
         Hd0^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*Hd0*sz + 8*Hd0^2*sx*Cos[phi] + 16*Delta*Hd0*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 
         Hd0^2*sx*Cos[3*phi + 4*t*ww] + 2*Hd0^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*Hd0*sz*
          Cos[2*(phi + t0*ww)] + 48*Delta^2*sx*Cos[phi + 2*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*t0*ww] + 2*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + Hd0^2*sx*Cos[3*phi + 4*t0*ww] + 
         4*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 8*Hd0^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*Hd0^2*sy*Sin[3*phi + 2*t*ww] - 
         Hd0^2*sy*Sin[3*phi + 4*t*ww] + 2*Hd0^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*Hd0^2*sy*Sin[3*phi + 2*t0*ww] + 2*Hd0^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - Hd0^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*Hd0^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*Hd0*sz - 16*Delta*Hd0*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*Hd0^2*sx*Cos[phi + 2*t*ww] - 
         4*Hd0^2*sx*Cos[3*phi + 2*t*ww] + 3*Hd0^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*Hd0^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*Hd0*sz*Cos[phi + 2*t0*ww]^2 - 6*Hd0^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*Hd0^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*Hd0^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*Hd0^2*sy*Sin[phi] - 
         3*Hd0^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*Hd0^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*Hd0^2*sy*
          Cos[phi + 2*t*ww]*Sin[2*phi] - 24*Hd0^2*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 48*Hd0^2*sy*Cos[2*(phi + t0*ww)]*
          Cos[phi + (t + t0)*ww]*Sin[(-t + t0)*ww] + 32*Delta*Hd0*sz*
          Cos[phi + (t + t0)*ww]^2*Sin[(-t + t0)*ww]^2 - 
         8*Hd0^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*Sin[(-t + t0)*ww]^2 + 
         6*Hd0^2*sx*Sin[phi]*Sin[2*(-t + t0)*ww] + 12*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t*ww)] - 96*Delta^2*sy*Sin[phi + 2*t*ww] - 
         4*Hd0^2*sy*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*Cos[phi]^2*
          Sin[phi + 2*t*ww] + 32*Delta*Hd0*sz*Sin[phi]*Sin[phi + 2*t*ww] + 
         2*Hd0^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 4*Hd0^2*sy*
          Sin[3*phi + 2*t*ww] + Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t*ww] - 
         3*Hd0^2*sy*Sin[3*phi + 4*t*ww] + 24*Hd0^2*sx*Sin[phi]*
          Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*Sin[phi + 2*t0*ww] + 
         24*Hd0^2*sy*Sin[phi + 2*t0*ww] + 48*Delta*Hd0*sz*Sin[phi]*
          Sin[phi + 2*t0*ww] - 96*Delta*Hd0*sz*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww]*Sin[phi + 2*t0*ww] + 24*Delta*Hd0*sz*
          Sin[phi + 2*t0*ww]^2 - 6*Hd0^2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*phi + 4*t0*ww] - 12*Hd0^2*sy*
          Sin[3*phi + 4*t0*ww] - 24*Hd0^2*sx*Sin[(-t + t0)*ww]*
          Sin[phi + (t + t0)*ww] + 48*Hd0^2*sx*Cos[2*(phi + t0*ww)]*
          Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 96*Delta*Hd0*sz*
          Cos[phi + 2*t0*ww]*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         32*Delta*Hd0*sz*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
         2*Hd0^2*sx*Sin[phi]*Sin[2*(phi + (t + t0)*ww)] + 
         Hd0*Cos[phi]*(-32*Delta*sz*Cos[phi + 2*t*ww] - 
           48*Delta*sz*Cos[phi + 2*t0*ww] + 
           Hd0*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] - 6*sy*Sin[2*(-t + t0)*
                ww] - 12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(-t + t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*Hd0^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
