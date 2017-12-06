HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]]] ^= False
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega], 1][t_, t0_] = 
    (-I/8)*(Hd1*t^2*(sx*Cos[phi] + sy*Sin[phi]) - 
      Hd1*t0^2*(sx*Cos[phi] + sy*Sin[phi]) + 
      2*t*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) - 
      2*t0*(2*Delta*sz + Hd0*sx*Cos[phi] + Hd0*sy*Sin[phi]) + 
      (Hd1*t*(sy*Cos[phi + 2*t*ww] + sx*Sin[phi + 2*t*ww]))/ww - 
      (Hd1*t0*(sy*Cos[phi + 2*t0*ww] + sx*Sin[phi + 2*t0*ww]))/ww - 
      (Hd1*Sin[(t - t0)*ww]*(sy*Cos[phi + (t + t0)*ww] + 
         sx*Sin[phi + (t + t0)*ww]))/ww^2 - 
      (2*Hd0*Sin[(-t + t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww]))/ww)
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    (I/192)*(4*Delta*Hd1*t^3*(sy*Cos[phi] - sx*Sin[phi]) - 
      12*Delta*Hd1*t^2*t0*(sy*Cos[phi] - sx*Sin[phi]) + 
      12*Delta*Hd1*t*t0^2*(sy*Cos[phi] - sx*Sin[phi]) - 
      4*Delta*Hd1*t0^3*(sy*Cos[phi] - sx*Sin[phi]) + 
      (3*Hd1*t^2*(-2*Hd0*sz + 3*Hd0*sz*Cos[2*(phi + t*ww)] - 
         4*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] + 
         4*Delta*sy*Sin[phi + 2*t*ww]))/ww + 
      (3*Hd1*t*(6*Delta*sy*Cos[phi + 2*t*ww] + 2*Delta*sy*
          Cos[phi + 2*t0*ww] - Hd0*sz*Sin[2*(-t + t0)*ww] - 
         5*Hd0*sz*Sin[2*(phi + t*ww)] + 6*Delta*sx*Sin[phi + 2*t*ww] - 
         Hd0*sz*Sin[2*(phi + t0*ww)] + 2*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd0*(-4*Delta*sy*Cos[phi + 2*t*ww] + 4*Delta*sy*Cos[phi + 2*t0*ww] + 
         Hd0*sz*Sin[2*(-t + t0)*ww] + 2*Hd0*sz*Sin[2*(phi + t*ww)] - 
         4*Delta*sx*Sin[phi + 2*t*ww] - 2*Hd0*sz*Sin[2*(phi + t0*ww)] + 
         4*Delta*sx*Sin[phi + 2*t0*ww]))/ww^2 - 
      (3*Hd1*t0*(2*Delta*sy*Cos[phi + 2*t*ww] + 6*Delta*sy*
          Cos[phi + 2*t0*ww] + Hd0*sz*Sin[2*(-t + t0)*ww] - 
         Hd0*sz*Sin[2*(phi + t*ww)] + 2*Delta*sx*Sin[phi + 2*t*ww] - 
         5*Hd0*sz*Sin[2*(phi + t0*ww)] + 6*Delta*sx*Sin[phi + 2*t0*ww]))/
       ww^2 + (6*Hd0*t*(-(Hd0*sz) + Hd0*sz*Cos[2*(phi + t*ww)] - 
         2*Delta*sx*Cos[phi + 2*t*ww] + Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t*ww] + 
         2*Delta*sy*Sin[phi + 2*t0*ww]))/ww + 
      (12*Hd1*t*t0*Sin[(t - t0)*ww]*(-2*Delta*sy*Cos[phi + (t + t0)*ww] - 
         2*Delta*sx*Sin[phi + (t + t0)*ww] + 
         Hd0*sz*Sin[2*phi + (t + t0)*ww]))/ww + 
      (6*Hd1*Sin[(t - t0)*ww]*(-4*Delta*sy*Cos[phi + (t + t0)*ww] - 
         4*Delta*sx*Sin[phi + (t + t0)*ww] + 3*Hd0*sz*
          Sin[2*phi + (t + t0)*ww]))/ww^3 - 
      (6*Hd1*t0^2*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         2*Delta*sx*Cos[phi + 2*t0*ww] + 2*Delta*sy*Sin[phi + 2*t0*ww] + 
         Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww - 
      (6*Hd0*t0*(-(Hd0*sz) + 2*Hd0*sz*Cos[2*(phi + t0*ww)] - 
         4*Delta*sx*Cos[phi + 2*t0*ww] - 4*Delta*sy*Cos[phi + (t + t0)*ww]*
          Sin[(-t + t0)*ww] + 4*Delta*sy*Sin[phi + 2*t0*ww] - 
         4*Delta*sx*Sin[(-t + t0)*ww]*Sin[phi + (t + t0)*ww] + 
         2*Hd0*sz*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]))/ww)
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
