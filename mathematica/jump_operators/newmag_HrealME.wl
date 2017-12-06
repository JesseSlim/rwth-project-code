HoldPattern[CommutativeQ[WW]] ^= False
 
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
 
Subscript[WW, 1][t_, t0_] = 
    (-I/4)*(t*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) - 
      t0*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) + 
      (H1*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WW, 2][t_, t0_] = ((-I/64)*H1*(-2*H1*sz*t*ww + 2*H1*sz*t0*ww + 
       2*H1*sz*t*ww*Cos[2*(phi + t*ww)] + 4*Delta*(sy - sx*t*ww)*
        Cos[phi + 2*t*ww] + 2*H1*sz*t*ww*Cos[2*(phi + t0*ww)] - 
       4*H1*sz*t0*ww*Cos[2*(phi + t0*ww)] - 4*Delta*sy*Cos[phi + 2*t0*ww] - 
       4*Delta*sx*t*ww*Cos[phi + 2*t0*ww] + 8*Delta*sx*t0*ww*
        Cos[phi + 2*t0*ww] - 8*Delta*sy*t0*ww*Cos[phi + (t + t0)*ww]*
        Sin[(t - t0)*ww] + H1*sz*Sin[2*(t - t0)*ww] - 
       2*H1*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] + 
       4*Delta*sy*t*ww*Sin[phi + 2*t*ww] + 2*H1*sz*Sin[2*(phi + t0*ww)] - 
       4*Delta*sx*Sin[phi + 2*t0*ww] + 4*Delta*sy*t*ww*Sin[phi + 2*t0*ww] - 
       8*Delta*sy*t0*ww*Sin[phi + 2*t0*ww] - 8*Delta*sx*t0*ww*
        Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 4*H1*sz*t0*ww*
        Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[WW, 3][t_, t0_] = 
    ((-I/3072)*H1*(3*(32*Delta^2 + H1^2)*sy*Cos[phi + 2*t*ww] + 
       12*H1^2*sy*Cos[3*phi + 2*t*ww] + 3*H1^2*sy*Cos[3*phi + 4*t*ww] - 
       6*H1^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
        Cos[phi + 2*t0*ww] - 3*H1^2*sy*Cos[phi + 2*t0*ww] - 
       12*H1^2*sy*Cos[3*phi + 2*t0*ww] + 6*H1^2*sy*
        Cos[phi - 2*t*ww + 2*t0*ww] - 3*H1^2*sy*Cos[3*phi + 4*t0*ww] + 
       H1^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(t - t0)*ww] - 48*Delta*H1*sz*Sin[2*(phi + t*ww)] + 
       96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*H1^2*sx*Sin[phi + 2*t*ww] - 
       12*H1^2*sx*Sin[3*phi + 2*t*ww] + 3*H1^2*sx*Sin[3*phi + 4*t*ww] + 
       6*H1^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
       3*H1^2*sx*Sin[phi + 2*t0*ww] + 12*H1^2*sx*Sin[3*phi + 2*t0*ww] - 
       6*H1^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*H1^2*sx*Sin[3*phi + 4*t0*ww] + H1^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       8*t^2*ww^2*Sin[(t - t0)*ww]*((8*Delta^2 + H1^2)*sx*
          Cos[phi + (t + t0)*ww] - 4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 8*t0^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*H1*sz + 8*H1^2*sx*Cos[phi] + 16*Delta*H1*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*H1^2*sx*Cos[3*phi + 2*t*ww] + 
         H1^2*sx*Cos[3*phi + 4*t*ww] + 2*H1^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*H1*sz*Cos[2*(phi + t0*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t0*ww] - 6*H1^2*sx*Cos[3*phi + 2*t0*ww] + 
         2*H1^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         H1^2*sx*Cos[3*phi + 4*t0*ww] + 4*H1^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 8*H1^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*H1^2*sy*Sin[3*phi + 2*t*ww] - 
         H1^2*sy*Sin[3*phi + 4*t*ww] + 2*H1^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*H1^2*sy*Sin[3*phi + 2*t0*ww] + 2*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - H1^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*H1*sz - 16*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*H1^2*sx*Cos[phi + 2*t*ww] - 
         4*H1^2*sx*Cos[3*phi + 2*t*ww] + 3*H1^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*H1^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Cos[phi + 2*t0*ww]^2 - 6*H1^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*H1^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*H1^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*H1^2*sy*Sin[phi] - 
         3*H1^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*H1^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*H1^2*sy*Cos[phi + 2*t*ww]*
          Sin[2*phi] + 24*H1^2*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
         48*H1^2*sy*Cos[2*(phi + t0*ww)]*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 32*Delta*H1*sz*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 - 8*H1^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*
          Sin[(t - t0)*ww]^2 - 6*H1^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 
         12*H1^2*sx*Sin[phi]*Sin[2*(phi + t*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t*ww] - 4*H1^2*sy*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Cos[phi]^2*Sin[phi + 2*t*ww] + 32*Delta*H1*sz*Sin[phi]*
          Sin[phi + 2*t*ww] + 2*H1^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*t*ww] + H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t*ww] - 3*H1^2*sy*Sin[3*phi + 4*t*ww] + 
         24*H1^2*sx*Sin[phi]*Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 24*H1^2*sy*Sin[phi + 2*t0*ww] + 
         48*Delta*H1*sz*Sin[phi]*Sin[phi + 2*t0*ww] + 96*Delta*H1*sz*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Sin[phi + 2*t0*ww]^2 - 6*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - 2*H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t0*ww] - 12*H1^2*sy*Sin[3*phi + 4*t0*ww] + 
         24*H1^2*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         48*H1^2*sx*Cos[2*(phi + t0*ww)]*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 96*Delta*H1*sz*Cos[phi + 2*t0*ww]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 32*Delta*H1*sz*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 2*H1^2*sx*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + H1*Cos[phi]*
          (-32*Delta*sz*Cos[phi + 2*t*ww] - 48*Delta*sz*Cos[phi + 2*t0*ww] + 
           H1*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*H1^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Hbarnewmag[tb_, ta_] = 
    (768*(-(ta*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi])) + 
        tb*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) + 
        (H1*Sin[(-ta + tb)*ww]*(sx*Cos[phi + (ta + tb)*ww] - 
           sy*Sin[phi + (ta + tb)*ww]))/ww) - 
      (48*H1*(-2*H1*sz*ta*ww + 2*H1*sz*tb*ww + 2*H1*sz*(2*ta - tb)*ww*
          Cos[2*(phi + ta*ww)] + 4*Delta*(sy + sx*(-2*ta + tb)*ww)*
          Cos[phi + 2*ta*ww] - 2*H1*sz*tb*ww*Cos[2*(phi + tb*ww)] - 
         4*Delta*sy*Cos[phi + 2*tb*ww] + 4*Delta*sx*tb*ww*
          Cos[phi + 2*tb*ww] + 8*Delta*sy*ta*ww*Cos[phi + (ta + tb)*ww]*
          Sin[(-ta + tb)*ww] - H1*sz*Sin[2*(-ta + tb)*ww] - 
         2*H1*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] + 
         8*Delta*sy*ta*ww*Sin[phi + 2*ta*ww] - 4*Delta*sy*tb*ww*
          Sin[phi + 2*ta*ww] + 2*H1*sz*Sin[2*(phi + tb*ww)] - 
         4*Delta*sx*Sin[phi + 2*tb*ww] - 4*Delta*sy*tb*ww*
          Sin[phi + 2*tb*ww] + 8*Delta*sx*ta*ww*Sin[(-ta + tb)*ww]*
          Sin[phi + (ta + tb)*ww] - 4*H1*sz*ta*ww*Sin[(-ta + tb)*ww]*
          Sin[2*phi + (ta + tb)*ww]))/ww^2 + 
      (H1*(-96*Delta^2*sy*Cos[phi + 2*ta*ww] - 3*H1^2*sy*Cos[phi + 2*ta*ww] - 
         12*H1^2*sy*Cos[3*phi + 2*ta*ww] - 3*H1^2*sy*Cos[3*phi + 4*ta*ww] + 
         6*H1^2*sy*Cos[phi + 2*ta*ww - 2*tb*ww] + 
         H1^2*sy*Cos[phi + 4*ta*ww - 2*tb*ww] + 3*(32*Delta^2 + H1^2)*sy*
          Cos[phi + 2*tb*ww] + 12*H1^2*sy*Cos[3*phi + 2*tb*ww] - 
         6*H1^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 
         3*H1^2*sy*Cos[3*phi + 4*tb*ww] - H1^2*sy*
          Cos[phi - 2*ta*ww + 4*tb*ww] + 48*Delta*H1*sz*
          Sin[2*(-ta + tb)*ww] + 48*Delta*H1*sz*Sin[2*(phi + ta*ww)] - 
         96*Delta^2*sx*Sin[phi + 2*ta*ww] - 3*H1^2*sx*Sin[phi + 2*ta*ww] + 
         12*H1^2*sx*Sin[3*phi + 2*ta*ww] - 3*H1^2*sx*Sin[3*phi + 4*ta*ww] - 
         6*H1^2*sx*Sin[phi + 2*ta*ww - 2*tb*ww] + 
         H1^2*sx*Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*H1*sz*
          Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
         3*H1^2*sx*Sin[phi + 2*tb*ww] - 12*H1^2*sx*Sin[3*phi + 2*tb*ww] + 
         6*H1^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 
         3*H1^2*sx*Sin[3*phi + 4*tb*ww] - H1^2*sx*
          Sin[phi - 2*ta*ww + 4*tb*ww] - 8*ta^2*ww^2*Sin[(-ta + tb)*ww]*
          ((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) + 16*ta*tb*ww^2*
          Sin[(-ta + tb)*ww]*((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) - 8*tb^2*ww^2*
          Sin[(-ta + tb)*ww]*((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         2*tb*ww*(32*Delta*H1*sz + 8*H1^2*sx*Cos[phi] + 16*Delta*H1*sz*
            Cos[2*(-ta + tb)*ww] - 24*Delta*H1*sz*Cos[2*(phi + ta*ww)] + 
           48*Delta^2*sx*Cos[phi + 2*ta*ww] - 6*H1^2*sx*
            Cos[3*phi + 2*ta*ww] + H1^2*sx*Cos[3*phi + 4*ta*ww] + 
           2*H1^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 24*Delta*H1*sz*
            Cos[2*(phi + tb*ww)] + 48*Delta^2*sx*Cos[phi + 2*tb*ww] - 
           6*H1^2*sx*Cos[3*phi + 2*tb*ww] + 2*H1^2*sx*
            Cos[phi - 2*ta*ww + 2*tb*ww] + H1^2*sx*Cos[3*phi + 4*tb*ww] + 
           4*H1^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 8*H1^2*sy*Sin[phi] - 
           48*Delta^2*sy*Sin[phi + 2*ta*ww] - 6*H1^2*sy*
            Sin[3*phi + 2*ta*ww] - H1^2*sy*Sin[3*phi + 4*ta*ww] + 
           2*H1^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] - 48*Delta^2*sy*
            Sin[phi + 2*tb*ww] - 6*H1^2*sy*Sin[3*phi + 2*tb*ww] + 
           2*H1^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 
           H1^2*sy*Sin[3*phi + 4*tb*ww] - 4*H1^2*sy*
            Sin[3*phi + 2*(ta + tb)*ww]) + ta*ww*(72*Delta*H1*sz + 
           24*Delta*H1*sz*Cos[phi + 2*ta*ww]^2 + 12*H1^2*sx*
            Cos[3*phi + 4*ta*ww] - 6*H1^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
           16*Delta*H1*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
            Cos[phi + 2*tb*ww] + 4*H1^2*sx*Cos[phi + 2*tb*ww] - 
           4*H1^2*sx*Cos[3*phi + 2*tb*ww] + 3*H1^2*sx*Cos[3*phi + 4*tb*ww] - 
           6*H1^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 30*H1^2*sy*Sin[phi] - 
           3*H1^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 4*H1^2*sx*
            Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*H1^2*sy*Cos[phi + 2*tb*ww]*
            Sin[2*phi] + 24*H1^2*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(-ta + tb)*ww] - 48*H1^2*sy*Cos[2*(phi + ta*ww)]*
            Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 32*Delta*H1*sz*
            Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 - 
           8*H1^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
             2 - 6*H1^2*sx*Sin[phi]*Sin[2*(-ta + tb)*ww] + 
           24*H1^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 96*Delta^2*sy*
            Sin[phi + 2*ta*ww] + 24*H1^2*sy*Sin[phi + 2*ta*ww] + 
           48*Delta*H1*sz*Sin[phi]*Sin[phi + 2*ta*ww] + 96*Delta*H1*sz*
            Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww]*Sin[phi + 2*ta*ww] + 
           24*Delta*H1*sz*Sin[phi + 2*ta*ww]^2 - 2*H1^2*sx*Sin[phi]*
            Sin[2*phi + 4*ta*ww] - 12*H1^2*sy*Sin[3*phi + 4*ta*ww] - 
           6*H1^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 12*H1^2*sx*Sin[phi]*
            Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
           4*H1^2*sy*Sin[phi + 2*tb*ww] - 4*H1^2*sy*Cos[phi]^2*
            Sin[phi + 2*tb*ww] + 32*Delta*H1*sz*Sin[phi]*Sin[phi + 2*tb*ww] + 
           2*H1^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 4*H1^2*sy*
            Sin[3*phi + 2*tb*ww] + H1^2*sx*Sin[phi]*Sin[2*phi + 4*tb*ww] - 
           3*H1^2*sy*Sin[3*phi + 4*tb*ww] + 24*H1^2*sx*Sin[(-ta + tb)*ww]*
            Sin[phi + (ta + tb)*ww] - 48*H1^2*sx*Cos[2*(phi + ta*ww)]*
            Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] + 32*Delta*H1*sz*
            Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
           24*Cos[phi + 2*ta*ww]*(4*Delta^2*sx - H1^2*sx - 4*Delta*H1*sz*
              Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]) - 
           2*H1^2*sx*Sin[phi]*Sin[2*(phi + (ta + tb)*ww)] + 
           H1*Cos[phi]*(30*H1*sx - 48*Delta*sz*Cos[phi + 2*ta*ww] + 
             3*H1*sx*Cos[2*phi + 4*ta*ww] - 32*Delta*sz*Cos[phi + 2*tb*ww] + 
             6*H1*sy*Sin[2*(-ta + tb)*ww] - 24*H1*sy*Sin[2*(phi + ta*ww)] - 
             2*H1*sy*Sin[2*phi + 4*ta*ww] - 12*H1*sy*Sin[2*(phi + tb*ww)] + 
             H1*sy*Sin[2*phi + 4*tb*ww] - 8*H1*sx*Sin[(-ta + tb)*ww]^2*
              Sin[phi + (ta + tb)*ww]^2 - 2*H1*sy*Sin[2*(phi + (ta + tb)*
                  ww)]) + 6*H1^2*sy*Sin[3*phi + 2*(ta + tb)*ww])))/ww^3)/
     (3072*(-ta + tb))
 
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
 
Subscript[WW, 1][t_, t0_] = 
    (-I/4)*(t*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) - 
      t0*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) + 
      (H1*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WW, 2][t_, t0_] = ((-I/64)*H1*(-2*H1*sz*t*ww + 2*H1*sz*t0*ww + 
       2*H1*sz*t*ww*Cos[2*(phi + t*ww)] + 4*Delta*(sy - sx*t*ww)*
        Cos[phi + 2*t*ww] + 2*H1*sz*t*ww*Cos[2*(phi + t0*ww)] - 
       4*H1*sz*t0*ww*Cos[2*(phi + t0*ww)] - 4*Delta*sy*Cos[phi + 2*t0*ww] - 
       4*Delta*sx*t*ww*Cos[phi + 2*t0*ww] + 8*Delta*sx*t0*ww*
        Cos[phi + 2*t0*ww] - 8*Delta*sy*t0*ww*Cos[phi + (t + t0)*ww]*
        Sin[(t - t0)*ww] + H1*sz*Sin[2*(t - t0)*ww] - 
       2*H1*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] + 
       4*Delta*sy*t*ww*Sin[phi + 2*t*ww] + 2*H1*sz*Sin[2*(phi + t0*ww)] - 
       4*Delta*sx*Sin[phi + 2*t0*ww] + 4*Delta*sy*t*ww*Sin[phi + 2*t0*ww] - 
       8*Delta*sy*t0*ww*Sin[phi + 2*t0*ww] - 8*Delta*sx*t0*ww*
        Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 4*H1*sz*t0*ww*
        Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[WW, 3][t_, t0_] = 
    ((-I/3072)*H1*(3*(32*Delta^2 + H1^2)*sy*Cos[phi + 2*t*ww] + 
       12*H1^2*sy*Cos[3*phi + 2*t*ww] + 3*H1^2*sy*Cos[3*phi + 4*t*ww] - 
       6*H1^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
        Cos[phi + 2*t0*ww] - 3*H1^2*sy*Cos[phi + 2*t0*ww] - 
       12*H1^2*sy*Cos[3*phi + 2*t0*ww] + 6*H1^2*sy*
        Cos[phi - 2*t*ww + 2*t0*ww] - 3*H1^2*sy*Cos[3*phi + 4*t0*ww] + 
       H1^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(t - t0)*ww] - 48*Delta*H1*sz*Sin[2*(phi + t*ww)] + 
       96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*H1^2*sx*Sin[phi + 2*t*ww] - 
       12*H1^2*sx*Sin[3*phi + 2*t*ww] + 3*H1^2*sx*Sin[3*phi + 4*t*ww] + 
       6*H1^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
       3*H1^2*sx*Sin[phi + 2*t0*ww] + 12*H1^2*sx*Sin[3*phi + 2*t0*ww] - 
       6*H1^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*H1^2*sx*Sin[3*phi + 4*t0*ww] + H1^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       8*t^2*ww^2*Sin[(t - t0)*ww]*((8*Delta^2 + H1^2)*sx*
          Cos[phi + (t + t0)*ww] - 4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 8*t0^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*H1*sz + 8*H1^2*sx*Cos[phi] + 16*Delta*H1*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*H1^2*sx*Cos[3*phi + 2*t*ww] + 
         H1^2*sx*Cos[3*phi + 4*t*ww] + 2*H1^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*H1*sz*Cos[2*(phi + t0*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t0*ww] - 6*H1^2*sx*Cos[3*phi + 2*t0*ww] + 
         2*H1^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         H1^2*sx*Cos[3*phi + 4*t0*ww] + 4*H1^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 8*H1^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*H1^2*sy*Sin[3*phi + 2*t*ww] - 
         H1^2*sy*Sin[3*phi + 4*t*ww] + 2*H1^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*H1^2*sy*Sin[3*phi + 2*t0*ww] + 2*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - H1^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*H1*sz - 16*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*H1^2*sx*Cos[phi + 2*t*ww] - 
         4*H1^2*sx*Cos[3*phi + 2*t*ww] + 3*H1^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*H1^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Cos[phi + 2*t0*ww]^2 - 6*H1^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*H1^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*H1^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*H1^2*sy*Sin[phi] - 
         3*H1^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*H1^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*H1^2*sy*Cos[phi + 2*t*ww]*
          Sin[2*phi] + 24*H1^2*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
         48*H1^2*sy*Cos[2*(phi + t0*ww)]*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 32*Delta*H1*sz*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 - 8*H1^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*
          Sin[(t - t0)*ww]^2 - 6*H1^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 
         12*H1^2*sx*Sin[phi]*Sin[2*(phi + t*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t*ww] - 4*H1^2*sy*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Cos[phi]^2*Sin[phi + 2*t*ww] + 32*Delta*H1*sz*Sin[phi]*
          Sin[phi + 2*t*ww] + 2*H1^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*t*ww] + H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t*ww] - 3*H1^2*sy*Sin[3*phi + 4*t*ww] + 
         24*H1^2*sx*Sin[phi]*Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 24*H1^2*sy*Sin[phi + 2*t0*ww] + 
         48*Delta*H1*sz*Sin[phi]*Sin[phi + 2*t0*ww] + 96*Delta*H1*sz*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Sin[phi + 2*t0*ww]^2 - 6*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - 2*H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t0*ww] - 12*H1^2*sy*Sin[3*phi + 4*t0*ww] + 
         24*H1^2*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         48*H1^2*sx*Cos[2*(phi + t0*ww)]*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 96*Delta*H1*sz*Cos[phi + 2*t0*ww]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 32*Delta*H1*sz*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 2*H1^2*sx*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + H1*Cos[phi]*
          (-32*Delta*sz*Cos[phi + 2*t*ww] - 48*Delta*sz*Cos[phi + 2*t0*ww] + 
           H1*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*H1^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[WW]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Hbarnewmag[tb_, ta_] = 
    (768*(-(ta*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi])) + 
        tb*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) + 
        (H1*Sin[(-ta + tb)*ww]*(sx*Cos[phi + (ta + tb)*ww] - 
           sy*Sin[phi + (ta + tb)*ww]))/ww) - 
      (48*H1*(-2*H1*sz*ta*ww + 2*H1*sz*tb*ww + 2*H1*sz*(2*ta - tb)*ww*
          Cos[2*(phi + ta*ww)] + 4*Delta*(sy + sx*(-2*ta + tb)*ww)*
          Cos[phi + 2*ta*ww] - 2*H1*sz*tb*ww*Cos[2*(phi + tb*ww)] - 
         4*Delta*sy*Cos[phi + 2*tb*ww] + 4*Delta*sx*tb*ww*
          Cos[phi + 2*tb*ww] + 8*Delta*sy*ta*ww*Cos[phi + (ta + tb)*ww]*
          Sin[(-ta + tb)*ww] - H1*sz*Sin[2*(-ta + tb)*ww] - 
         2*H1*sz*Sin[2*(phi + ta*ww)] + 4*Delta*sx*Sin[phi + 2*ta*ww] + 
         8*Delta*sy*ta*ww*Sin[phi + 2*ta*ww] - 4*Delta*sy*tb*ww*
          Sin[phi + 2*ta*ww] + 2*H1*sz*Sin[2*(phi + tb*ww)] - 
         4*Delta*sx*Sin[phi + 2*tb*ww] - 4*Delta*sy*tb*ww*
          Sin[phi + 2*tb*ww] + 8*Delta*sx*ta*ww*Sin[(-ta + tb)*ww]*
          Sin[phi + (ta + tb)*ww] - 4*H1*sz*ta*ww*Sin[(-ta + tb)*ww]*
          Sin[2*phi + (ta + tb)*ww]))/ww^2 + 
      (H1*(-96*Delta^2*sy*Cos[phi + 2*ta*ww] - 3*H1^2*sy*Cos[phi + 2*ta*ww] - 
         12*H1^2*sy*Cos[3*phi + 2*ta*ww] - 3*H1^2*sy*Cos[3*phi + 4*ta*ww] + 
         6*H1^2*sy*Cos[phi + 2*ta*ww - 2*tb*ww] + 
         H1^2*sy*Cos[phi + 4*ta*ww - 2*tb*ww] + 3*(32*Delta^2 + H1^2)*sy*
          Cos[phi + 2*tb*ww] + 12*H1^2*sy*Cos[3*phi + 2*tb*ww] - 
         6*H1^2*sy*Cos[phi - 2*ta*ww + 2*tb*ww] + 
         3*H1^2*sy*Cos[3*phi + 4*tb*ww] - H1^2*sy*
          Cos[phi - 2*ta*ww + 4*tb*ww] + 48*Delta*H1*sz*
          Sin[2*(-ta + tb)*ww] + 48*Delta*H1*sz*Sin[2*(phi + ta*ww)] - 
         96*Delta^2*sx*Sin[phi + 2*ta*ww] - 3*H1^2*sx*Sin[phi + 2*ta*ww] + 
         12*H1^2*sx*Sin[3*phi + 2*ta*ww] - 3*H1^2*sx*Sin[3*phi + 4*ta*ww] - 
         6*H1^2*sx*Sin[phi + 2*ta*ww - 2*tb*ww] + 
         H1^2*sx*Sin[phi + 4*ta*ww - 2*tb*ww] - 48*Delta*H1*sz*
          Sin[2*(phi + tb*ww)] + 96*Delta^2*sx*Sin[phi + 2*tb*ww] + 
         3*H1^2*sx*Sin[phi + 2*tb*ww] - 12*H1^2*sx*Sin[3*phi + 2*tb*ww] + 
         6*H1^2*sx*Sin[phi - 2*ta*ww + 2*tb*ww] + 
         3*H1^2*sx*Sin[3*phi + 4*tb*ww] - H1^2*sx*
          Sin[phi - 2*ta*ww + 4*tb*ww] - 8*ta^2*ww^2*Sin[(-ta + tb)*ww]*
          ((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) + 16*ta*tb*ww^2*
          Sin[(-ta + tb)*ww]*((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) - 8*tb^2*ww^2*
          Sin[(-ta + tb)*ww]*((8*Delta^2 + H1^2)*sx*Cos[phi + (ta + tb)*ww] - 
           4*Delta*H1*sz*Cos[2*phi + (ta + tb)*ww] - 
           H1^2*sx*Cos[3*phi + (ta + tb)*ww] - 8*Delta^2*sy*
            Sin[phi + (ta + tb)*ww] - H1^2*sy*Sin[phi + (ta + tb)*ww] - 
           H1^2*sy*Sin[3*phi + (ta + tb)*ww]) - 
         2*tb*ww*(32*Delta*H1*sz + 8*H1^2*sx*Cos[phi] + 16*Delta*H1*sz*
            Cos[2*(-ta + tb)*ww] - 24*Delta*H1*sz*Cos[2*(phi + ta*ww)] + 
           48*Delta^2*sx*Cos[phi + 2*ta*ww] - 6*H1^2*sx*
            Cos[3*phi + 2*ta*ww] + H1^2*sx*Cos[3*phi + 4*ta*ww] + 
           2*H1^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 24*Delta*H1*sz*
            Cos[2*(phi + tb*ww)] + 48*Delta^2*sx*Cos[phi + 2*tb*ww] - 
           6*H1^2*sx*Cos[3*phi + 2*tb*ww] + 2*H1^2*sx*
            Cos[phi - 2*ta*ww + 2*tb*ww] + H1^2*sx*Cos[3*phi + 4*tb*ww] + 
           4*H1^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 8*H1^2*sy*Sin[phi] - 
           48*Delta^2*sy*Sin[phi + 2*ta*ww] - 6*H1^2*sy*
            Sin[3*phi + 2*ta*ww] - H1^2*sy*Sin[3*phi + 4*ta*ww] + 
           2*H1^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] - 48*Delta^2*sy*
            Sin[phi + 2*tb*ww] - 6*H1^2*sy*Sin[3*phi + 2*tb*ww] + 
           2*H1^2*sy*Sin[phi - 2*ta*ww + 2*tb*ww] - 
           H1^2*sy*Sin[3*phi + 4*tb*ww] - 4*H1^2*sy*
            Sin[3*phi + 2*(ta + tb)*ww]) + ta*ww*(72*Delta*H1*sz + 
           24*Delta*H1*sz*Cos[phi + 2*ta*ww]^2 + 12*H1^2*sx*
            Cos[3*phi + 4*ta*ww] - 6*H1^2*sx*Cos[phi + 2*ta*ww - 2*tb*ww] - 
           16*Delta*H1*sz*Cos[2*(phi + tb*ww)] + 96*Delta^2*sx*
            Cos[phi + 2*tb*ww] + 4*H1^2*sx*Cos[phi + 2*tb*ww] - 
           4*H1^2*sx*Cos[3*phi + 2*tb*ww] + 3*H1^2*sx*Cos[3*phi + 4*tb*ww] - 
           6*H1^2*sx*Cos[3*phi + 2*(ta + tb)*ww] + 30*H1^2*sy*Sin[phi] - 
           3*H1^2*sy*Cos[2*phi + 4*ta*ww]*Sin[phi] + 4*H1^2*sx*
            Cos[phi + 2*tb*ww]*Sin[phi]^2 - 2*H1^2*sy*Cos[phi + 2*tb*ww]*
            Sin[2*phi] + 24*H1^2*sy*Cos[phi + (ta + tb)*ww]*
            Sin[(-ta + tb)*ww] - 48*H1^2*sy*Cos[2*(phi + ta*ww)]*
            Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww] + 32*Delta*H1*sz*
            Cos[phi + (ta + tb)*ww]^2*Sin[(-ta + tb)*ww]^2 - 
           8*H1^2*sy*Cos[phi + (ta + tb)*ww]^2*Sin[phi]*Sin[(-ta + tb)*ww]^
             2 - 6*H1^2*sx*Sin[phi]*Sin[2*(-ta + tb)*ww] + 
           24*H1^2*sx*Sin[phi]*Sin[2*(phi + ta*ww)] - 96*Delta^2*sy*
            Sin[phi + 2*ta*ww] + 24*H1^2*sy*Sin[phi + 2*ta*ww] + 
           48*Delta*H1*sz*Sin[phi]*Sin[phi + 2*ta*ww] + 96*Delta*H1*sz*
            Cos[phi + (ta + tb)*ww]*Sin[(-ta + tb)*ww]*Sin[phi + 2*ta*ww] + 
           24*Delta*H1*sz*Sin[phi + 2*ta*ww]^2 - 2*H1^2*sx*Sin[phi]*
            Sin[2*phi + 4*ta*ww] - 12*H1^2*sy*Sin[3*phi + 4*ta*ww] - 
           6*H1^2*sy*Sin[phi + 2*ta*ww - 2*tb*ww] + 12*H1^2*sx*Sin[phi]*
            Sin[2*(phi + tb*ww)] - 96*Delta^2*sy*Sin[phi + 2*tb*ww] - 
           4*H1^2*sy*Sin[phi + 2*tb*ww] - 4*H1^2*sy*Cos[phi]^2*
            Sin[phi + 2*tb*ww] + 32*Delta*H1*sz*Sin[phi]*Sin[phi + 2*tb*ww] + 
           2*H1^2*sx*Sin[2*phi]*Sin[phi + 2*tb*ww] - 4*H1^2*sy*
            Sin[3*phi + 2*tb*ww] + H1^2*sx*Sin[phi]*Sin[2*phi + 4*tb*ww] - 
           3*H1^2*sy*Sin[3*phi + 4*tb*ww] + 24*H1^2*sx*Sin[(-ta + tb)*ww]*
            Sin[phi + (ta + tb)*ww] - 48*H1^2*sx*Cos[2*(phi + ta*ww)]*
            Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww] + 32*Delta*H1*sz*
            Sin[(-ta + tb)*ww]^2*Sin[phi + (ta + tb)*ww]^2 + 
           24*Cos[phi + 2*ta*ww]*(4*Delta^2*sx - H1^2*sx - 4*Delta*H1*sz*
              Sin[(-ta + tb)*ww]*Sin[phi + (ta + tb)*ww]) - 
           2*H1^2*sx*Sin[phi]*Sin[2*(phi + (ta + tb)*ww)] + 
           H1*Cos[phi]*(30*H1*sx - 48*Delta*sz*Cos[phi + 2*ta*ww] + 
             3*H1*sx*Cos[2*phi + 4*ta*ww] - 32*Delta*sz*Cos[phi + 2*tb*ww] + 
             6*H1*sy*Sin[2*(-ta + tb)*ww] - 24*H1*sy*Sin[2*(phi + ta*ww)] - 
             2*H1*sy*Sin[2*phi + 4*ta*ww] - 12*H1*sy*Sin[2*(phi + tb*ww)] + 
             H1*sy*Sin[2*phi + 4*tb*ww] - 8*H1*sx*Sin[(-ta + tb)*ww]^2*
              Sin[phi + (ta + tb)*ww]^2 - 2*H1*sy*Sin[2*(phi + (ta + tb)*
                  ww)]) + 6*H1^2*sy*Sin[3*phi + 2*(ta + tb)*ww])))/ww^3)/
     (3072*(-ta + tb))
 
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
 
Subscript[WW, 1][t_, t0_] = 
    (-I/4)*(t*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) - 
      t0*(2*Delta*sz + H1*sx*Cos[phi] + H1*sy*Sin[phi]) + 
      (H1*Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[WW, 2][t_, t0_] = ((-I/64)*H1*(-2*H1*sz*t*ww + 2*H1*sz*t0*ww + 
       2*H1*sz*t*ww*Cos[2*(phi + t*ww)] + 4*Delta*(sy - sx*t*ww)*
        Cos[phi + 2*t*ww] + 2*H1*sz*t*ww*Cos[2*(phi + t0*ww)] - 
       4*H1*sz*t0*ww*Cos[2*(phi + t0*ww)] - 4*Delta*sy*Cos[phi + 2*t0*ww] - 
       4*Delta*sx*t*ww*Cos[phi + 2*t0*ww] + 8*Delta*sx*t0*ww*
        Cos[phi + 2*t0*ww] - 8*Delta*sy*t0*ww*Cos[phi + (t + t0)*ww]*
        Sin[(t - t0)*ww] + H1*sz*Sin[2*(t - t0)*ww] - 
       2*H1*sz*Sin[2*(phi + t*ww)] + 4*Delta*sx*Sin[phi + 2*t*ww] + 
       4*Delta*sy*t*ww*Sin[phi + 2*t*ww] + 2*H1*sz*Sin[2*(phi + t0*ww)] - 
       4*Delta*sx*Sin[phi + 2*t0*ww] + 4*Delta*sy*t*ww*Sin[phi + 2*t0*ww] - 
       8*Delta*sy*t0*ww*Sin[phi + 2*t0*ww] - 8*Delta*sx*t0*ww*
        Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 4*H1*sz*t0*ww*
        Sin[(t - t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[WW, 3][t_, t0_] = 
    ((-I/3072)*H1*(3*(32*Delta^2 + H1^2)*sy*Cos[phi + 2*t*ww] + 
       12*H1^2*sy*Cos[3*phi + 2*t*ww] + 3*H1^2*sy*Cos[3*phi + 4*t*ww] - 
       6*H1^2*sy*Cos[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sy*Cos[phi + 4*t*ww - 2*t0*ww] - 96*Delta^2*sy*
        Cos[phi + 2*t0*ww] - 3*H1^2*sy*Cos[phi + 2*t0*ww] - 
       12*H1^2*sy*Cos[3*phi + 2*t0*ww] + 6*H1^2*sy*
        Cos[phi - 2*t*ww + 2*t0*ww] - 3*H1^2*sy*Cos[3*phi + 4*t0*ww] + 
       H1^2*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(t - t0)*ww] - 48*Delta*H1*sz*Sin[2*(phi + t*ww)] + 
       96*Delta^2*sx*Sin[phi + 2*t*ww] + 3*H1^2*sx*Sin[phi + 2*t*ww] - 
       12*H1^2*sx*Sin[3*phi + 2*t*ww] + 3*H1^2*sx*Sin[3*phi + 4*t*ww] + 
       6*H1^2*sx*Sin[phi + 2*t*ww - 2*t0*ww] - 
       H1^2*sx*Sin[phi + 4*t*ww - 2*t0*ww] + 48*Delta*H1*sz*
        Sin[2*(phi + t0*ww)] - 96*Delta^2*sx*Sin[phi + 2*t0*ww] - 
       3*H1^2*sx*Sin[phi + 2*t0*ww] + 12*H1^2*sx*Sin[3*phi + 2*t0*ww] - 
       6*H1^2*sx*Sin[phi - 2*t*ww + 2*t0*ww] - 
       3*H1^2*sx*Sin[3*phi + 4*t0*ww] + H1^2*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       8*t^2*ww^2*Sin[(t - t0)*ww]*((8*Delta^2 + H1^2)*sx*
          Cos[phi + (t + t0)*ww] - 4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) + 16*t*t0*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 8*t0^2*ww^2*Sin[(t - t0)*ww]*
        ((8*Delta^2 + H1^2)*sx*Cos[phi + (t + t0)*ww] - 
         4*Delta*H1*sz*Cos[2*phi + (t + t0)*ww] - 
         H1^2*sx*Cos[3*phi + (t + t0)*ww] - 8*Delta^2*sy*
          Sin[phi + (t + t0)*ww] - H1^2*sy*Sin[phi + (t + t0)*ww] - 
         H1^2*sy*Sin[3*phi + (t + t0)*ww]) - 
       2*t*ww*(32*Delta*H1*sz + 8*H1^2*sx*Cos[phi] + 16*Delta*H1*sz*
          Cos[2*(t - t0)*ww] - 24*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t*ww] - 6*H1^2*sx*Cos[3*phi + 2*t*ww] + 
         H1^2*sx*Cos[3*phi + 4*t*ww] + 2*H1^2*sx*
          Cos[phi + 2*t*ww - 2*t0*ww] - 24*Delta*H1*sz*Cos[2*(phi + t0*ww)] + 
         48*Delta^2*sx*Cos[phi + 2*t0*ww] - 6*H1^2*sx*Cos[3*phi + 2*t0*ww] + 
         2*H1^2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         H1^2*sx*Cos[3*phi + 4*t0*ww] + 4*H1^2*sx*
          Cos[3*phi + 2*(t + t0)*ww] + 8*H1^2*sy*Sin[phi] - 
         48*Delta^2*sy*Sin[phi + 2*t*ww] - 6*H1^2*sy*Sin[3*phi + 2*t*ww] - 
         H1^2*sy*Sin[3*phi + 4*t*ww] + 2*H1^2*sy*
          Sin[phi + 2*t*ww - 2*t0*ww] - 48*Delta^2*sy*Sin[phi + 2*t0*ww] - 
         6*H1^2*sy*Sin[3*phi + 2*t0*ww] + 2*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - H1^2*sy*Sin[3*phi + 4*t0*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*(t + t0)*ww]) + 
       t0*ww*(72*Delta*H1*sz - 16*Delta*H1*sz*Cos[2*(phi + t*ww)] + 
         96*Delta^2*sx*Cos[phi + 2*t*ww] + 4*H1^2*sx*Cos[phi + 2*t*ww] - 
         4*H1^2*sx*Cos[3*phi + 2*t*ww] + 3*H1^2*sx*Cos[3*phi + 4*t*ww] + 
         96*Delta^2*sx*Cos[phi + 2*t0*ww] - 24*H1^2*sx*Cos[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Cos[phi + 2*t0*ww]^2 - 6*H1^2*sx*
          Cos[phi - 2*t*ww + 2*t0*ww] + 12*H1^2*sx*Cos[3*phi + 4*t0*ww] - 
         6*H1^2*sx*Cos[3*phi + 2*(t + t0)*ww] + 30*H1^2*sy*Sin[phi] - 
         3*H1^2*sy*Cos[2*phi + 4*t0*ww]*Sin[phi] + 
         4*H1^2*sx*Cos[phi + 2*t*ww]*Sin[phi]^2 - 2*H1^2*sy*Cos[phi + 2*t*ww]*
          Sin[2*phi] + 24*H1^2*sy*Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww] - 
         48*H1^2*sy*Cos[2*(phi + t0*ww)]*Cos[phi + (t + t0)*ww]*
          Sin[(t - t0)*ww] + 32*Delta*H1*sz*Cos[phi + (t + t0)*ww]^2*
          Sin[(t - t0)*ww]^2 - 8*H1^2*sy*Cos[phi + (t + t0)*ww]^2*Sin[phi]*
          Sin[(t - t0)*ww]^2 - 6*H1^2*sx*Sin[phi]*Sin[2*(t - t0)*ww] + 
         12*H1^2*sx*Sin[phi]*Sin[2*(phi + t*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t*ww] - 4*H1^2*sy*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Cos[phi]^2*Sin[phi + 2*t*ww] + 32*Delta*H1*sz*Sin[phi]*
          Sin[phi + 2*t*ww] + 2*H1^2*sx*Sin[2*phi]*Sin[phi + 2*t*ww] - 
         4*H1^2*sy*Sin[3*phi + 2*t*ww] + H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t*ww] - 3*H1^2*sy*Sin[3*phi + 4*t*ww] + 
         24*H1^2*sx*Sin[phi]*Sin[2*(phi + t0*ww)] - 96*Delta^2*sy*
          Sin[phi + 2*t0*ww] + 24*H1^2*sy*Sin[phi + 2*t0*ww] + 
         48*Delta*H1*sz*Sin[phi]*Sin[phi + 2*t0*ww] + 96*Delta*H1*sz*
          Cos[phi + (t + t0)*ww]*Sin[(t - t0)*ww]*Sin[phi + 2*t0*ww] + 
         24*Delta*H1*sz*Sin[phi + 2*t0*ww]^2 - 6*H1^2*sy*
          Sin[phi - 2*t*ww + 2*t0*ww] - 2*H1^2*sx*Sin[phi]*
          Sin[2*phi + 4*t0*ww] - 12*H1^2*sy*Sin[3*phi + 4*t0*ww] + 
         24*H1^2*sx*Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] - 
         48*H1^2*sx*Cos[2*(phi + t0*ww)]*Sin[(t - t0)*ww]*
          Sin[phi + (t + t0)*ww] - 96*Delta*H1*sz*Cos[phi + 2*t0*ww]*
          Sin[(t - t0)*ww]*Sin[phi + (t + t0)*ww] + 32*Delta*H1*sz*
          Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 2*H1^2*sx*Sin[phi]*
          Sin[2*(phi + (t + t0)*ww)] + H1*Cos[phi]*
          (-32*Delta*sz*Cos[phi + 2*t*ww] - 48*Delta*sz*Cos[phi + 2*t0*ww] + 
           H1*(30*sx + 3*sx*Cos[2*phi + 4*t0*ww] + 6*sy*Sin[2*(t - t0)*ww] - 
             12*sy*Sin[2*(phi + t*ww)] + sy*Sin[2*phi + 4*t*ww] - 
             24*sy*Sin[2*(phi + t0*ww)] - 2*sy*Sin[2*phi + 4*t0*ww] - 
             8*sx*Sin[(t - t0)*ww]^2*Sin[phi + (t + t0)*ww]^2 - 
             2*sy*Sin[2*(phi + (t + t0)*ww)])) + 6*H1^2*sy*
          Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
HoldPattern[CommutativeQ[WW]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
test = "test"
