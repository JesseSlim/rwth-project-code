HoldPattern[CommutativeQ[\[CapitalOmega]bscoeff]] ^= False
 
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
 
Subscript[\[CapitalOmega]bscoeff, 1][t_, t0_] = 
    ((-I/4)*H1*(sx*(t - t0)*ww*Cos[phi] + sy*(t - t0)*ww*Sin[phi] + 
       Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww])))/ww
 
Subscript[\[CapitalOmega]bscoeff, 2][t_, t0_] = 
    ((I/64)*H1^2*sz*(-2*t*ww + 2*t*ww*Cos[2*(phi + t*ww)] + 
       2*(t - t0)*ww*Cos[2*(phi + t0*ww)] + Sin[2*(t - t0)*ww] - 
       2*Sin[2*(phi + t*ww)] + 4*t0*ww*Sin[phi + t0*ww]^2 + 
       2*Sin[2*(phi + t0*ww)] - 4*t0*ww*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]bscoeff, 3][t_, t0_] = 
    ((I/1536)*H1^3*(4*t^2*ww^2*(Cos[2*(phi + t*ww)] - Cos[2*(phi + t0*ww)])*
        (sy*Cos[phi] - sx*Sin[phi]) - 8*t*t0*ww^2*(Cos[2*(phi + t*ww)] - 
         Cos[2*(phi + t0*ww)])*(sy*Cos[phi] - sx*Sin[phi]) + 
       8*t0^2*ww^2*(sy*Cos[phi] - sx*Sin[phi])*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww] - Sin[(t - t0)*ww]*
        (6*sx*Cos[phi + t*ww - t0*ww] - sx*Cos[phi + 3*t*ww - t0*ww] + 
         6*sx*Cos[phi - t*ww + t0*ww] + 3*sx*Cos[3*phi + 3*t*ww + t0*ww] - 
         sx*Cos[phi - t*ww + 3*t0*ww] + 3*sx*Cos[3*phi + t*ww + 3*t0*ww] + 
         2*sx*Cos[phi + (t + t0)*ww] - 12*sx*Cos[3*phi + (t + t0)*ww] + 
         6*sy*Sin[phi + t*ww - t0*ww] + sy*Sin[phi + 3*t*ww - t0*ww] + 
         6*sy*Sin[phi - t*ww + t0*ww] - 3*sy*Sin[3*phi + 3*t*ww + t0*ww] + 
         sy*Sin[phi - t*ww + 3*t0*ww] - 3*sy*Sin[3*phi + t*ww + 3*t0*ww] - 
         2*sy*Sin[phi + (t + t0)*ww] - 12*sy*Sin[3*phi + (t + t0)*ww]) + 
       t*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       t0*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
Subscript[\[CapitalOmega]bscoeff, 4][t_, t0_] = 
    ((I/49152)*H1^4*sz*(4*t*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 
         5*Cos[4*(phi + t*ww)] - 2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 
         8*Cos[2*(phi + t0*ww)] + 5*Cos[4*(phi + t0*ww)] - 
         2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 8*Cos[4*phi + 2*(t + t0)*ww]) - 
       4*t0*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 5*Cos[4*(phi + t*ww)] - 
         2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 8*Cos[2*(phi + t0*ww)] + 
         5*Cos[4*(phi + t0*ww)] - 2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         8*Cos[4*phi + 2*(t + t0)*ww]) + 16*t0^2*ww^2*
        (Cos[4*phi + 3*t*ww + t0*ww] + Cos[4*phi + t*ww + 3*t0*ww] + 
         2*Cos[2*phi + (t + t0)*ww])*Sin[(t - t0)*ww] + 
       8*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
       32*Cos[phi + t*ww]^2*Sin[2*(-t + t0)*ww] + 2*Sin[4*(-t + t0)*ww] - 
       104*Cos[phi + t*ww]^3*Sin[phi + t*ww] - 28*Sin[2*(phi + t*ww)] - 
       5*Sin[4*(phi + t*ww)] + 2*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
       8*t^2*ww^2*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 128*t*t0*ww^2*
        (Cos[phi + t*ww]^3*Sin[phi + t*ww] - Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 66*Sin[2*(phi + t0*ww)] + 
       18*Sin[4*(phi + t0*ww)] - 14*Sin[2*phi - 2*t*ww + 4*t0*ww]))/ww^4
 
Subscript[\[CapitalOmega]bscoeff, 5][t_, t0_] = 
    ((I/5898240)*H1^5*(32*sx*(t - t0)*ww*(57 + 2*t^2*ww^2 - 4*t*t0*ww^2 + 
         2*t0^2*ww^2)*Cos[phi] + 4*(15*sx*(-t + t0)*ww + 
         sy*(-15 + 42*t0^2*ww^2 + 8*t^4*ww^4 - 32*t^3*t0*ww^4 + 8*t0^4*ww^4 + 
           6*t^2*ww^2*(7 + 8*t0^2*ww^2) - 4*t*t0*ww^2*(21 + 8*t0^2*ww^2)))*
        Cos[phi + 2*t*ww] - 1305*sy*Cos[3*phi + 2*t*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t*ww] + 1080*sx*t0*ww*Cos[3*phi + 2*t*ww] + 
       336*sy*t^2*ww^2*Cos[3*phi + 2*t*ww] - 672*sy*t*t0*ww^2*
        Cos[3*phi + 2*t*ww] + 336*sy*t0^2*ww^2*Cos[3*phi + 2*t*ww] + 
       32*sy*t^4*ww^4*Cos[3*phi + 2*t*ww] - 128*sy*t^3*t0*ww^4*
        Cos[3*phi + 2*t*ww] + 192*sy*t^2*t0^2*ww^4*Cos[3*phi + 2*t*ww] - 
       128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t*ww] + 32*sy*t0^4*ww^4*
        Cos[3*phi + 2*t*ww] - 285*sy*Cos[3*phi + 4*t*ww] + 
       186*sx*t*ww*Cos[3*phi + 4*t*ww] - 186*sx*t0*ww*Cos[3*phi + 4*t*ww] + 
       60*sy*t^2*ww^2*Cos[3*phi + 4*t*ww] - 120*sy*t*t0*ww^2*
        Cos[3*phi + 4*t*ww] + 60*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww] - 
       16*sx*t^3*ww^3*Cos[3*phi + 4*t*ww] + 48*sx*t^2*t0*ww^3*
        Cos[3*phi + 4*t*ww] - 48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t*ww] + 
       16*sx*t0^3*ww^3*Cos[3*phi + 4*t*ww] - 135*sy*Cos[5*phi + 4*t*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t*ww] + 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t*ww] - 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t*ww] + 180*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t*ww] - 45*sy*Cos[5*phi + 6*t*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t*ww] + 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t*ww] - 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t*ww] + 24*sy*t0^2*ww^2*Cos[5*phi + 6*t*ww] - 
       45*sy*Cos[phi + 4*t*ww - 4*t0*ww] - 36*sx*t*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] - 6*sy*Cos[phi + 6*t*ww - 4*t0*ww] + 
       900*sy*Cos[phi + 2*t*ww - 2*t0*ww] + 744*sx*t*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] + 480*sy*t*t0*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t0^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 30*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
       60*sx*t*ww*Cos[phi + 4*t*ww - 2*t0*ww] - 60*sx*t0*ww*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] - 48*sy*t*t0*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t0^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 135*sy*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sx*t*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       144*sy*t*t0*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sy*Cos[3*phi + 6*t*ww - 2*t0*ww] - 24*sx*t*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 60*sy*Cos[phi + 2*t0*ww] - 
       60*sx*t*ww*Cos[phi + 2*t0*ww] + 60*sx*t0*ww*Cos[phi + 2*t0*ww] - 
       168*sy*t^2*ww^2*Cos[phi + 2*t0*ww] + 336*sy*t*t0*ww^2*
        Cos[phi + 2*t0*ww] - 168*sy*t0^2*ww^2*Cos[phi + 2*t0*ww] - 
       32*sy*t^4*ww^4*Cos[phi + 2*t0*ww] + 128*sy*t^3*t0*ww^4*
        Cos[phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*Cos[phi + 2*t0*ww] + 
       128*sy*t*t0^3*ww^4*Cos[phi + 2*t0*ww] - 32*sy*t0^4*ww^4*
        Cos[phi + 2*t0*ww] + 1305*sy*Cos[3*phi + 2*t0*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t0*ww] + 1080*sx*t0*ww*
        Cos[3*phi + 2*t0*ww] - 336*sy*t^2*ww^2*Cos[3*phi + 2*t0*ww] + 
       672*sy*t*t0*ww^2*Cos[3*phi + 2*t0*ww] - 336*sy*t0^2*ww^2*
        Cos[3*phi + 2*t0*ww] - 32*sy*t^4*ww^4*Cos[3*phi + 2*t0*ww] + 
       128*sy*t^3*t0*ww^4*Cos[3*phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*
        Cos[3*phi + 2*t0*ww] + 128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t0*ww] - 
       32*sy*t0^4*ww^4*Cos[3*phi + 2*t0*ww] - 
       900*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 744*sx*t*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 480*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 45*sy*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sx*t*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sx*t0*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sy*t*t0*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sy*Cos[3*phi + 4*t0*ww] + 186*sx*t*ww*Cos[3*phi + 4*t0*ww] - 
       186*sx*t0*ww*Cos[3*phi + 4*t0*ww] - 60*sy*t^2*ww^2*
        Cos[3*phi + 4*t0*ww] + 120*sy*t*t0*ww^2*Cos[3*phi + 4*t0*ww] - 
       60*sy*t0^2*ww^2*Cos[3*phi + 4*t0*ww] - 16*sx*t^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 48*sx*t^2*t0*ww^3*Cos[3*phi + 4*t0*ww] - 
       48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t0*ww] + 16*sx*t0^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 135*sy*Cos[5*phi + 4*t0*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t0*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t0*ww] - 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t0*ww] + 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t0*ww] - 180*sy*t0^2*ww^2*Cos[5*phi + 4*t0*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t0*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t0*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t0*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t0*ww] + 
       45*sy*Cos[phi - 4*t*ww + 4*t0*ww] - 36*sx*t*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] - 30*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
       60*sx*t*ww*Cos[phi - 2*t*ww + 4*t0*ww] - 60*sx*t0*ww*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 135*sy*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sx*t*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       144*sy*t*t0*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t0^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sy*Cos[5*phi + 2*t*ww + 4*t0*ww] + 120*sx*t*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 120*sx*t0*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 96*sy*t*t0*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t0^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 45*sy*Cos[5*phi + 6*t0*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t0*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t0*ww] - 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t0*ww] - 24*sy*t0^2*ww^2*Cos[5*phi + 6*t0*ww] + 
       6*sy*Cos[phi - 4*t*ww + 6*t0*ww] - 
       30*sy*Cos[3*phi - 2*t*ww + 6*t0*ww] - 24*sx*t*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 576*sx*t*ww*
        Cos[3*phi + 2*(t + t0)*ww] - 576*sx*t0*ww*
        Cos[3*phi + 2*(t + t0)*ww] + 32*sx*t^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^2*t0*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] + 96*sx*t*t0^2*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 32*sx*t0^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 288*sx*t^2*t0*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] - 288*sx*t*t0^2*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 96*sx*t0^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 1824*sy*t*ww*Sin[phi] - 
       1824*sy*t0*ww*Sin[phi] + 64*sy*t^3*ww^3*Sin[phi] - 
       192*sy*t^2*t0*ww^3*Sin[phi] + 192*sy*t*t0^2*ww^3*Sin[phi] - 
       64*sy*t0^3*ww^3*Sin[phi] - 60*sx*Sin[phi + 2*t*ww] + 
       60*sy*t*ww*Sin[phi + 2*t*ww] - 60*sy*t0*ww*Sin[phi + 2*t*ww] + 
       168*sx*t^2*ww^2*Sin[phi + 2*t*ww] - 336*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww] + 168*sx*t0^2*ww^2*Sin[phi + 2*t*ww] + 
       32*sx*t^4*ww^4*Sin[phi + 2*t*ww] - 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t*ww] + 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t*ww] - 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t*ww] + 32*sx*t0^4*ww^4*
        Sin[phi + 2*t*ww] + 1305*sx*Sin[3*phi + 2*t*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t*ww] + 1080*sy*t0*ww*Sin[3*phi + 2*t*ww] - 
       336*sx*t^2*ww^2*Sin[3*phi + 2*t*ww] + 672*sx*t*t0*ww^2*
        Sin[3*phi + 2*t*ww] - 336*sx*t0^2*ww^2*Sin[3*phi + 2*t*ww] - 
       32*sx*t^4*ww^4*Sin[3*phi + 2*t*ww] + 128*sx*t^3*t0*ww^4*
        Sin[3*phi + 2*t*ww] - 192*sx*t^2*t0^2*ww^4*Sin[3*phi + 2*t*ww] + 
       128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t*ww] - 32*sx*t0^4*ww^4*
        Sin[3*phi + 2*t*ww] - 285*sx*Sin[3*phi + 4*t*ww] - 
       186*sy*t*ww*Sin[3*phi + 4*t*ww] + 186*sy*t0*ww*Sin[3*phi + 4*t*ww] + 
       60*sx*t^2*ww^2*Sin[3*phi + 4*t*ww] - 120*sx*t*t0*ww^2*
        Sin[3*phi + 4*t*ww] + 60*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww] + 
       16*sy*t^3*ww^3*Sin[3*phi + 4*t*ww] - 48*sy*t^2*t0*ww^3*
        Sin[3*phi + 4*t*ww] + 48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t*ww] - 
       16*sy*t0^3*ww^3*Sin[3*phi + 4*t*ww] + 135*sx*Sin[5*phi + 4*t*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t*ww] - 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t*ww] + 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t*ww] - 180*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t*ww] - 45*sx*Sin[5*phi + 6*t*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t*ww] + 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t*ww] - 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t*ww] + 24*sx*t0^2*ww^2*Sin[5*phi + 6*t*ww] + 
       45*sx*Sin[phi + 4*t*ww - 4*t0*ww] - 36*sy*t*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] - 6*sx*Sin[phi + 6*t*ww - 4*t0*ww] - 
       900*sx*Sin[phi + 2*t*ww - 2*t0*ww] + 744*sy*t*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 480*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t0^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 30*sx*Sin[phi + 4*t*ww - 2*t0*ww] - 
       60*sy*t*ww*Sin[phi + 4*t*ww - 2*t0*ww] + 60*sy*t0*ww*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 48*sx*t*t0*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t0^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 135*sx*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sy*t*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       144*sx*t*t0*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sx*Sin[3*phi + 6*t*ww - 2*t0*ww] + 24*sy*t*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] + 60*sx*Sin[phi + 2*t0*ww] + 
       60*sy*t*ww*Sin[phi + 2*t0*ww] - 60*sy*t0*ww*Sin[phi + 2*t0*ww] - 
       168*sx*t^2*ww^2*Sin[phi + 2*t0*ww] + 336*sx*t*t0*ww^2*
        Sin[phi + 2*t0*ww] - 168*sx*t0^2*ww^2*Sin[phi + 2*t0*ww] - 
       32*sx*t^4*ww^4*Sin[phi + 2*t0*ww] + 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t0*ww] - 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t0*ww] + 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t0*ww] - 32*sx*t0^4*ww^4*
        Sin[phi + 2*t0*ww] - 1305*sx*Sin[3*phi + 2*t0*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t0*ww] + 1080*sy*t0*ww*
        Sin[3*phi + 2*t0*ww] + 336*sx*t^2*ww^2*Sin[3*phi + 2*t0*ww] - 
       672*sx*t*t0*ww^2*Sin[3*phi + 2*t0*ww] + 336*sx*t0^2*ww^2*
        Sin[3*phi + 2*t0*ww] + 32*sx*t^4*ww^4*Sin[3*phi + 2*t0*ww] - 
       128*sx*t^3*t0*ww^4*Sin[3*phi + 2*t0*ww] + 192*sx*t^2*t0^2*ww^4*
        Sin[3*phi + 2*t0*ww] - 128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t0*ww] + 
       32*sx*t0^4*ww^4*Sin[3*phi + 2*t0*ww] + 
       900*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 744*sy*t*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] + 480*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 45*sx*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sy*t*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sy*t0*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sx*t*t0*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sx*Sin[3*phi + 4*t0*ww] - 186*sy*t*ww*Sin[3*phi + 4*t0*ww] + 
       186*sy*t0*ww*Sin[3*phi + 4*t0*ww] - 60*sx*t^2*ww^2*
        Sin[3*phi + 4*t0*ww] + 120*sx*t*t0*ww^2*Sin[3*phi + 4*t0*ww] - 
       60*sx*t0^2*ww^2*Sin[3*phi + 4*t0*ww] + 16*sy*t^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 48*sy*t^2*t0*ww^3*Sin[3*phi + 4*t0*ww] + 
       48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t0*ww] - 16*sy*t0^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 135*sx*Sin[5*phi + 4*t0*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t0*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t0*ww] + 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t0*ww] - 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t0*ww] + 180*sx*t0^2*ww^2*Sin[5*phi + 4*t0*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t0*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t0*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t0*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t0*ww] - 
       45*sx*Sin[phi - 4*t*ww + 4*t0*ww] - 36*sy*t*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] - 30*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       60*sy*t*ww*Sin[phi - 2*t*ww + 4*t0*ww] + 60*sy*t0*ww*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 135*sx*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sy*t*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       144*sx*t*t0*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t0^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sx*Sin[5*phi + 2*t*ww + 4*t0*ww] - 120*sy*t*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 120*sy*t0*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 96*sx*t*t0*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t0^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 45*sx*Sin[5*phi + 6*t0*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t0*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t0*ww] - 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t0*ww] - 24*sx*t0^2*ww^2*Sin[5*phi + 6*t0*ww] + 
       6*sx*Sin[phi - 4*t*ww + 6*t0*ww] - 
       30*sx*Sin[3*phi - 2*t*ww + 6*t0*ww] + 24*sy*t*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 576*sy*t*ww*
        Sin[3*phi + 2*(t + t0)*ww] + 576*sy*t0*ww*
        Sin[3*phi + 2*(t + t0)*ww] - 32*sy*t^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 96*sy*t^2*t0*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t*t0^2*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 32*sy*t0^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 288*sy*t^2*t0*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] - 288*sy*t*t0^2*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 96*sy*t0^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww]))/ww^5
 
Subscript[\[CapitalOmega]bscoeff, 6][t_, t0_] = 
    ((-I/47185920)*H1^6*sz*(16*t^3*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - 
         Cos[2*(phi + t*ww)] + 2*Cos[4*(phi + t*ww)] + 
         3*Cos[6*(phi + t*ww)] + Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         Cos[2*(phi + t0*ww)] + 2*Cos[4*(phi + t0*ww)] + 
         3*Cos[6*(phi + t0*ww)] - 3*Cos[6*phi + 4*t*ww + 2*t0*ww] + 
         Cos[2*phi - 2*t*ww + 4*t0*ww] - 3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
         4*Cos[4*phi + 2*(t + t0)*ww]) - 48*t^2*t0*ww^3*
        (-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) + 
       48*t*t0^2*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) - 
       12*t*ww*(-25 + 80*Cos[2*(-t + t0)*ww] - 10*Cos[4*(-t + t0)*ww] + 
         6*Cos[2*(phi + t*ww)] + 86*Cos[4*(phi + t*ww)] + 
         20*Cos[6*(phi + t*ww)] + 3*Cos[2*phi + 6*t*ww - 4*t0*ww] - 
         54*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         14*Cos[4*phi + 6*t*ww - 2*t0*ww] + 6*Cos[2*(phi + t0*ww)] + 
         86*Cos[4*(phi + t0*ww)] + 20*Cos[6*(phi + t0*ww)] + 
         5*Cos[6*phi + 4*t*ww + 2*t0*ww] - 54*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         5*Cos[6*phi + 2*t*ww + 4*t0*ww] + 3*Cos[2*phi - 4*t*ww + 6*t0*ww] - 
         14*Cos[4*phi - 2*t*ww + 6*t0*ww] + 156*Cos[4*phi + 2*(t + t0)*ww]) + 
       1002*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       1872*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       72*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       186*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       3378*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
       210*Sin[2*(-t + t0)*ww] + 1614*Cos[2*(phi + t*ww)]*
        Sin[2*(-t + t0)*ww] - 66*Cos[2*phi - 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] + 120*Cos[6*phi + 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] - 72*Cos[2*phi + 3*t*ww - t0*ww]*
        Sin[3*(-t + t0)*ww] + 184*Cos[4*phi + 3*t*ww + t0*ww]*
        Sin[3*(-t + t0)*ww] - 39*Sin[4*(-t + t0)*ww] + 
       6*Sin[6*(-t + t0)*ww] + 36*Sin[2*(phi + t*ww)] + 
       1140*Sin[4*(phi + t*ww)] + 115*Sin[6*(phi + t*ww)] + 
       6*Sin[2*phi + 6*t*ww - 4*t0*ww] - 18*Sin[2*phi + 4*t*ww - 2*t0*ww] - 
       28*Sin[4*phi + 6*t*ww - 2*t0*ww] - 32*t^4*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 128*t^3*t0*ww^4*(2*Sin[2*(phi + t*ww)] + 
         Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 
       192*t^2*t0^2*ww^4*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) + 128*t*t0^3*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) - 339*Sin[2*(phi + t0*ww)] - 
       2132*Sin[4*(phi + t0*ww)] + 32*t0^4*ww^4*
        (4*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - Sin[4*(phi + t*ww)] + 
         Sin[4*(phi + t0*ww)]) - 82*Sin[6*(phi + t0*ww)] + 
       15*Sin[6*phi + 4*t*ww + 2*t0*ww] + 324*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
       48*Sin[6*phi + 2*t*ww + 4*t0*ww] - 9*Sin[2*phi - 4*t*ww + 6*t0*ww] + 
       24*t^2*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) - 
       48*t*t0*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) + 
       84*Sin[4*phi - 2*t*ww + 6*t0*ww] + 16*t0^3*ww^3*
        (8*Cos[2*(phi + t*ww)] - 2*Cos[4*(phi + t*ww)] - 
         3*Cos[6*(phi + t*ww)] - 8*Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] + 
         24*Sin[(-t + t0)*ww]^2 - 2*Sin[2*(-t + t0)*ww]*Sin[2*(phi + t*ww)] + 
         2*Sin[(-t + t0)*ww]*Sin[2*phi - t*ww + 3*t0*ww] + 
         8*Sin[(-t + t0)*ww]*Sin[4*phi + t*ww + 3*t0*ww] + 
         6*Sin[2*(-t + t0)*ww]*Sin[6*phi + 2*t*ww + 4*t0*ww] + 
         6*Sin[(-t + t0)*ww]*Sin[6*phi + t*ww + 5*t0*ww] - 
         14*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       12*t0*ww*(32*Cos[2*(-t + t0)*ww] - 3*Cos[4*(-t + t0)*ww] + 
         2*(8 + 23*Cos[2*(phi + t*ww)] + 43*Cos[4*(phi + t*ww)] + 
           10*Cos[6*(phi + t*ww)] - 3*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
           Cos[4*phi + 6*t*ww - 2*t0*ww] - 59*Cos[2*(phi + t0*ww)] + 
           111*Cos[4*(phi + t0*ww)] + 17*Cos[6*(phi + t0*ww)] + 
           2*Cos[6*phi + 4*t*ww + 2*t0*ww] - 
           6*Cos[2*phi - 2*t*ww + 4*t0*ww] - 
           4*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
           3*Cos[4*phi - 2*t*ww + 6*t0*ww] - 48*Sin[(-t + t0)*ww]^2 + 
           7*Sin[2*(-t + t0)*ww]^2 - 48*Sin[2*(-t + t0)*ww]*
            Sin[2*(phi + t*ww)] + 3*Sin[3*(-t + t0)*ww]*
            Sin[2*phi + 3*t*ww - t0*ww] - 12*Sin[3*(-t + t0)*ww]*
            Sin[4*phi + 3*t*ww + t0*ww] + 42*Sin[(-t + t0)*ww]*
            Sin[2*phi - t*ww + 3*t0*ww] + 156*Sin[(-t + t0)*ww]*
            Sin[4*phi + t*ww + 3*t0*ww] - 3*Sin[2*(-t + t0)*ww]*
            Sin[2*phi - 2*t*ww + 4*t0*ww] + Sin[2*(-t + t0)*ww]*
            Sin[6*phi + 2*t*ww + 4*t0*ww] + 8*Sin[(-t + t0)*ww]*
            Sin[4*phi - t*ww + 5*t0*ww] + 13*Sin[(-t + t0)*ww]*
            Sin[6*phi + t*ww + 5*t0*ww] - 40*Sin[(-t + t0)*ww]*
            Sin[2*phi + (t + t0)*ww])) - 12*t0^2*ww^2*
        (28*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
         16*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
         12*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] + 
         16*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
         96*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
         32*Sin[2*(-t + t0)*ww] + 24*Cos[2*(phi + t*ww)]*
          Sin[2*(-t + t0)*ww] - 22*Cos[6*phi + 2*t*ww + 4*t0*ww]*
          Sin[2*(-t + t0)*ww] + 12*Cos[4*phi + 3*t*ww + t0*ww]*
          Sin[3*(-t + t0)*ww] + 6*Sin[4*(-t + t0)*ww] - 
         2*Sin[2*(phi + t*ww)] + 32*Sin[4*(phi + t*ww)] + 
         14*Sin[6*(phi + t*ww)] + 4*Sin[2*(phi + t0*ww)] - 
         24*Sin[4*(phi + t0*ww)] - 11*Sin[6*(phi + t0*ww)] - 
         3*Sin[6*phi + 4*t*ww + 2*t0*ww] - 2*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
         8*Sin[4*phi + 2*(t + t0)*ww]) + 936*Sin[4*phi + 2*(t + t0)*ww]))/ww^6
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
Hbscoeff = (I*((-I/32)*H1^2*sz*t0 + (I/32)*H1^2*sz*t0*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + (I/384)*H1^3*t0^2*
         Cos[2*(phi + t0*ww)]*(sy*Cos[phi] - sx*Sin[phi]) - 
        (I/384)*H1^3*t0^2*Cos[2*(phi + (t0 + Pi/ww)*ww)]*
         (sy*Cos[phi] - sx*Sin[phi]) - (I/4)*H1*(Pi*sx*Cos[phi] + 
          Pi*sy*Sin[phi]) + (I/16)*H1^2*sz*t0*Sin[phi + t0*ww]^2))/Pi + 
     (I*((-I/2048)*H1^4*sz*t0 + (I/192)*H1^3*Pi*sx*Cos[phi] + 
        (I/1536)*H1^4*sz*t0*Cos[2*(phi + t0*ww)] + (I/2949120)*H1^6*sz*t0^3*
         Cos[2*(phi + t0*ww)] + ((5*I)/12288)*H1^4*sz*t0*
         Cos[4*(phi + t0*ww)] - (I/1474560)*H1^6*sz*t0^3*
         Cos[4*(phi + t0*ww)] - (I/983040)*H1^6*sz*t0^3*
         Cos[6*(phi + t0*ww)] - (I/256)*H1^3*Pi*sx*Cos[3*phi + 2*t0*ww] + 
        (I/1536)*H1^3*Pi*sx*Cos[3*phi + 4*t0*ww] + (I/768)*H1^3*Pi*sx*
         Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/6144)*H1^4*sz*t0*
         Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/2949120)*H1^6*sz*t0^3*
         Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/1536)*H1^4*sz*t0*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + (I/2949120)*H1^6*sz*t0^3*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + ((5*I)/12288)*H1^4*sz*t0*
         Cos[4*(phi + (t0 + Pi/ww)*ww)] - (I/1474560)*H1^6*sz*t0^3*
         Cos[4*(phi + (t0 + Pi/ww)*ww)] - (I/2949120)*H1^6*sz*t0^3*
         (-8*Cos[2*(phi + t0*ww)] + 2*Cos[4*(phi + t0*ww)] + 
          3*Cos[6*(phi + t0*ww)] + 8*Cos[2*(phi + (t0 + Pi/ww)*ww)] - 
          2*Cos[4*(phi + (t0 + Pi/ww)*ww)] - 
          3*Cos[6*(phi + (t0 + Pi/ww)*ww)]) - (I/983040)*H1^6*sz*t0^3*
         Cos[6*(phi + (t0 + Pi/ww)*ww)] - (I/256)*H1^3*Pi*sx*
         Cos[3*phi + 2*(t0 + Pi/ww)*ww] + (I/768)*H1^3*Pi*sx*
         Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/983040)*H1^6*sz*t0^3*
         Cos[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/1536)*H1^3*Pi*sx*
         Cos[3*phi + 4*(t0 + Pi/ww)*ww] - (I/6144)*H1^4*sz*t0*
         Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/2949120)*H1^6*sz*t0^3*
         Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/983040)*H1^6*sz*t0^3*
         Cos[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/384)*H1^3*Pi*sx*
         Cos[3*phi + 2*(2*t0 + Pi/ww)*ww] + (I/1536)*H1^4*sz*t0*
         Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] + (I/737280)*H1^6*sz*t0^3*
         Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] - (I/12288)*H1^4*sz*t0*
         (-6 + 8*Cos[2*(phi + t0*ww)] + 5*Cos[4*(phi + t0*ww)] - 
          2*Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + 
          8*Cos[2*(phi + (t0 + Pi/ww)*ww)] + 
          5*Cos[4*(phi + (t0 + Pi/ww)*ww)] - 
          2*Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
          8*Cos[4*phi + 2*(2*t0 + Pi/ww)*ww]) + (I/192)*H1^3*Pi*sy*Sin[phi] - 
        (I/384)*H1^3*Pi^2*Cos[2*(phi + t0*ww)]*(sy*Cos[phi] - sx*Sin[phi]) + 
        (I/384)*H1^3*Pi^2*Cos[2*(phi + (t0 + Pi/ww)*ww)]*
         (sy*Cos[phi] - sx*Sin[phi]) - (I/256)*H1^3*Pi*sy*
         Sin[3*phi + 2*t0*ww] - (I/1536)*H1^3*Pi*sy*Sin[3*phi + 4*t0*ww] + 
        (I/768)*H1^3*Pi*sy*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/384)*H1^4*Pi*sz*t0*Cos[phi + (t0 + Pi/ww)*ww]^3*
         Sin[phi + (t0 + Pi/ww)*ww] + (I/1536)*H1^4*Pi*sz*t0*
         Sin[2*(phi + (t0 + Pi/ww)*ww)] + (I/3072)*H1^4*Pi*sz*t0*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] - (I/256)*H1^3*Pi*sy*
         Sin[3*phi + 2*(t0 + Pi/ww)*ww] + (I/768)*H1^3*Pi*sy*
         Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/1536)*H1^3*Pi*sy*
         Sin[3*phi + 4*(t0 + Pi/ww)*ww] - (I/384)*H1^3*Pi*sy*
         Sin[3*phi + 2*(2*t0 + Pi/ww)*ww]))/(Pi*ww^2) + 
     (I*((-I/32)*H1^2*Pi*sz + (I/192)*H1^3*sx*t0*Cos[phi] + 
        (I/32)*H1^2*Pi*sz*Cos[2*(phi + t0*ww)] - (I/256)*H1^3*sx*t0*
         Cos[3*phi + 2*t0*ww] + (I/1536)*H1^3*sx*t0*Cos[3*phi + 4*t0*ww] + 
        (I/768)*H1^3*sx*t0*Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        (I/32)*H1^2*Pi*sz*Cos[2*(phi + (t0 + Pi/ww)*ww)] - 
        (I/256)*H1^3*sx*t0*Cos[3*phi + 2*(t0 + Pi/ww)*ww] + 
        (I/768)*H1^3*sx*t0*Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + 
        (I/1536)*H1^3*sx*t0*Cos[3*phi + 4*(t0 + Pi/ww)*ww] + 
        (I/384)*H1^3*sx*t0*Cos[3*phi + 2*(2*t0 + Pi/ww)*ww] + 
        (I/192)*H1^3*sy*t0*Sin[phi] + (I/768)*H1^4*sz*t0^2*Cos[phi + t0*ww]^3*
         Sin[phi + t0*ww] + (I/184320)*H1^6*sz*t0^4*Cos[phi + t0*ww]^3*
         Sin[phi + t0*ww] + (I/32)*H1^2*sz*Sin[2*(phi + t0*ww)] - 
        (I/256)*H1^3*sy*t0*Sin[3*phi + 2*t0*ww] - (I/1536)*H1^3*sy*t0*
         Sin[3*phi + 4*t0*ww] + (I/768)*H1^3*sy*t0*
         Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/384)*H1^4*sz*t0^2*
         Cos[phi + (t0 + Pi/ww)*ww]^3*Sin[phi + (t0 + Pi/ww)*ww] - 
        (I/32)*H1^2*sz*Sin[2*(phi + (t0 + Pi/ww)*ww)] + 
        (I/3072)*H1^4*sz*t0^2*Sin[2*(phi + (t0 + Pi/ww)*ww)] - 
        (I/737280)*H1^6*sz*t0^4*Sin[2*(phi + (t0 + Pi/ww)*ww)] - 
        (I/1474560)*H1^6*sz*t0^4*(Sin[4*(phi + t0*ww)] - 
          Sin[4*(phi + (t0 + Pi/ww)*ww)]) + (I/6144)*H1^4*sz*t0^2*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] - (I/1474560)*H1^6*sz*t0^4*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] - (I/256)*H1^3*sy*t0*
         Sin[3*phi + 2*(t0 + Pi/ww)*ww] + (I/768)*H1^3*sy*t0*
         Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/1536)*H1^3*sy*t0*
         Sin[3*phi + 4*(t0 + Pi/ww)*ww] - (I/384)*H1^3*sy*t0*
         Sin[3*phi + 2*(2*t0 + Pi/ww)*ww] - (I/1536)*H1^3*t0*
         (8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t0*ww] + 
          sx*Cos[3*phi + 4*t0*ww] + 2*sx*Cos[phi + 2*t0*ww - 
             2*(t0 + Pi/ww)*ww] - 6*sx*Cos[3*phi + 2*(t0 + Pi/ww)*ww] + 
          2*sx*Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + 
          sx*Cos[3*phi + 4*(t0 + Pi/ww)*ww] + 
          4*sx*Cos[3*phi + 2*(2*t0 + Pi/ww)*ww] + 8*sy*Sin[phi] - 
          6*sy*Sin[3*phi + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] + 
          2*sy*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - 
          6*sy*Sin[3*phi + 2*(t0 + Pi/ww)*ww] + 
          2*sy*Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - 
          sy*Sin[3*phi + 4*(t0 + Pi/ww)*ww] - 
          4*sy*Sin[3*phi + 2*(2*t0 + Pi/ww)*ww])))/(Pi*ww) + 
     (I*((-I/2048)*H1^4*Pi*sz + (I/1536)*H1^4*Pi*sz*Cos[2*(phi + t0*ww)] + 
        ((5*I)/12288)*H1^4*Pi*sz*Cos[4*(phi + t0*ww)] - 
        (I/6144)*H1^4*Pi*sz*Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        (I/1536)*H1^4*Pi*sz*Cos[2*(phi + (t0 + Pi/ww)*ww)] + 
        ((5*I)/12288)*H1^4*Pi*sz*Cos[4*(phi + (t0 + Pi/ww)*ww)] - 
        (I/6144)*H1^4*Pi*sz*Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/1536)*H1^4*Pi*sz*Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] - 
        (I/768)*H1^4*Pi^2*sz*Cos[phi + t0*ww]^3*Sin[phi + t0*ww] + 
        ((11*I)/8192)*H1^4*sz*Sin[2*(phi + t0*ww)] + ((23*I)/1966080)*H1^6*sz*
         t0^2*Sin[2*(phi + t0*ww)] + ((3*I)/8192)*H1^4*sz*
         Sin[4*(phi + t0*ww)] + (I/122880)*H1^6*sz*t0^2*
         Sin[4*(phi + t0*ww)] + ((7*I)/1966080)*H1^6*sz*t0^2*
         Sin[6*(phi + t0*ww)] - ((7*I)/24576)*H1^4*sz*
         Sin[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/327680)*H1^6*sz*t0^2*
         Sin[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/655360)*H1^6*sz*t0^2*
         Sin[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] - ((13*I)/6144)*H1^4*sz*
         Cos[phi + (t0 + Pi/ww)*ww]^3*Sin[phi + (t0 + Pi/ww)*ww] - 
        ((7*I)/12288)*H1^4*sz*Sin[2*(phi + (t0 + Pi/ww)*ww)] + 
        (I/3072)*H1^4*Pi^2*sz*Sin[2*(phi + (t0 + Pi/ww)*ww)] - 
        ((23*I)/1966080)*H1^6*sz*t0^2*Sin[2*(phi + (t0 + Pi/ww)*ww)] - 
        ((5*I)/49152)*H1^4*sz*Sin[4*(phi + (t0 + Pi/ww)*ww)] + 
        (I/6144)*H1^4*Pi^2*sz*Sin[4*(phi + (t0 + Pi/ww)*ww)] - 
        (I/122880)*H1^6*sz*t0^2*Sin[4*(phi + (t0 + Pi/ww)*ww)] - 
        ((7*I)/1966080)*H1^6*sz*t0^2*Sin[6*(phi + (t0 + Pi/ww)*ww)] + 
        (I/491520)*H1^6*sz*t0^2*Sin[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + 
        (I/24576)*H1^4*sz*Sin[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/327680)*H1^6*sz*t0^2*Sin[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/491520)*H1^6*sz*t0^2*Sin[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/655360)*H1^6*sz*t0^2*Sin[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] + 
        (I/3932160)*H1^6*sz*t0^2*(4*Sin[2*(phi + t0*ww)] - 
          24*Sin[4*(phi + t0*ww)] - 11*Sin[6*(phi + t0*ww)] - 
          2*Sin[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - 
          2*Sin[2*(phi + (t0 + Pi/ww)*ww)] + 
          32*Sin[4*(phi + (t0 + Pi/ww)*ww)] + 
          14*Sin[6*(phi + (t0 + Pi/ww)*ww)] - 
          3*Sin[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
          8*Sin[4*phi + 2*(2*t0 + Pi/ww)*ww])))/(Pi*ww^3) + 
     (I*(((3*I)/262144)*H1^6*Pi*sz + (I/655360)*H1^6*Pi*sz*
         Cos[2*(phi + t0*ww)] + (I/2949120)*H1^6*Pi^3*sz*
         Cos[2*(phi + t0*ww)] + ((43*I)/1966080)*H1^6*Pi*sz*
         Cos[4*(phi + t0*ww)] - (I/1474560)*H1^6*Pi^3*sz*
         Cos[4*(phi + t0*ww)] + (I/196608)*H1^6*Pi*sz*Cos[6*(phi + t0*ww)] - 
        (I/983040)*H1^6*Pi^3*sz*Cos[6*(phi + t0*ww)] + (I/1310720)*H1^6*Pi*sz*
         Cos[2*phi + 6*t0*ww - 4*(t0 + Pi/ww)*ww] - ((9*I)/655360)*H1^6*Pi*sz*
         Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/2949120)*H1^6*Pi^3*sz*
         Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - ((7*I)/1966080)*H1^6*Pi*
         sz*Cos[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/655360)*H1^6*Pi*sz*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + (I/2949120)*H1^6*Pi^3*sz*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + ((43*I)/1966080)*H1^6*Pi*sz*
         Cos[4*(phi + (t0 + Pi/ww)*ww)] - (I/1474560)*H1^6*Pi^3*sz*
         Cos[4*(phi + (t0 + Pi/ww)*ww)] + (I/196608)*H1^6*Pi*sz*
         Cos[6*(phi + (t0 + Pi/ww)*ww)] - (I/983040)*H1^6*Pi^3*sz*
         Cos[6*(phi + (t0 + Pi/ww)*ww)] + (I/786432)*H1^6*Pi*sz*
         Cos[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/983040)*H1^6*Pi^3*sz*
         Cos[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - ((9*I)/655360)*H1^6*Pi*sz*
         Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/2949120)*H1^6*Pi^3*sz*
         Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/786432)*H1^6*Pi*sz*
         Cos[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/983040)*H1^6*Pi^3*sz*
         Cos[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/1310720)*H1^6*Pi*sz*
         Cos[2*phi - 4*t0*ww + 6*(t0 + Pi/ww)*ww] - ((7*I)/1966080)*H1^6*Pi*
         sz*Cos[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] + ((13*I)/327680)*H1^6*
         Pi*sz*Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] + (I/737280)*H1^6*Pi^3*sz*
         Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] - (I/184320)*H1^6*Pi^4*sz*
         Cos[phi + t0*ww]^3*Sin[phi + t0*ww] + ((113*I)/15728640)*H1^6*sz*
         Sin[2*(phi + t0*ww)] - ((23*I)/1966080)*H1^6*Pi^2*sz*
         Sin[2*(phi + t0*ww)] + ((533*I)/11796480)*H1^6*sz*
         Sin[4*(phi + t0*ww)] - (I/122880)*H1^6*Pi^2*sz*
         Sin[4*(phi + t0*ww)] + ((41*I)/23592960)*H1^6*sz*
         Sin[6*(phi + t0*ww)] - ((7*I)/1966080)*H1^6*Pi^2*sz*
         Sin[6*(phi + t0*ww)] + (I/5242880)*H1^6*sz*
         Sin[2*phi + 6*t0*ww - 4*(t0 + Pi/ww)*ww] - ((9*I)/1310720)*H1^6*sz*
         Sin[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/327680)*H1^6*Pi^2*sz*
         Sin[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - ((7*I)/3932160)*H1^6*sz*
         Sin[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/655360)*H1^6*Pi^2*sz*
         Sin[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/1310720)*H1^6*sz*
         Sin[2*(phi + (t0 + Pi/ww)*ww)] + ((23*I)/1966080)*H1^6*Pi^2*sz*
         Sin[2*(phi + (t0 + Pi/ww)*ww)] + (I/737280)*H1^6*Pi^4*sz*
         Sin[2*(phi + (t0 + Pi/ww)*ww)] - ((19*I)/786432)*H1^6*sz*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] + (I/122880)*H1^6*Pi^2*sz*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] + (I/1474560)*H1^6*Pi^4*sz*
         Sin[4*(phi + (t0 + Pi/ww)*ww)] - ((23*I)/9437184)*H1^6*sz*
         Sin[6*(phi + (t0 + Pi/ww)*ww)] + ((7*I)/1966080)*H1^6*Pi^2*sz*
         Sin[6*(phi + (t0 + Pi/ww)*ww)] + (I/983040)*H1^6*sz*
         Sin[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/491520)*H1^6*Pi^2*sz*
         Sin[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/2621440)*H1^6*sz*
         Sin[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/327680)*H1^6*Pi^2*sz*
         Sin[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/3145728)*H1^6*sz*
         Sin[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/491520)*H1^6*Pi^2*sz*
         Sin[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/7864320)*H1^6*sz*
         Sin[2*phi - 4*t0*ww + 6*(t0 + Pi/ww)*ww] + ((7*I)/11796480)*H1^6*sz*
         Sin[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] - (I/655360)*H1^6*Pi^2*sz*
         Sin[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] - ((13*I)/655360)*H1^6*sz*
         Sin[4*phi + 2*(2*t0 + Pi/ww)*ww]))/(Pi*ww^5) + 
     (I*(((3*I)/262144)*H1^6*sz*t0 + (I/184320)*H1^5*Pi*(57 + 2*Pi^2)*sx*
         Cos[phi] + (I/655360)*H1^6*sz*t0*Cos[2*(phi + t0*ww)] + 
        ((43*I)/1966080)*H1^6*sz*t0*Cos[4*(phi + t0*ww)] + 
        (I/196608)*H1^6*sz*t0*Cos[6*(phi + t0*ww)] - (I/98304)*H1^5*Pi*sx*
         Cos[phi + 2*t0*ww] + (I/98304)*H1^5*sy*Cos[phi + 2*t0*ww] - 
        ((7*I)/245760)*H1^5*Pi^2*sy*Cos[phi + 2*t0*ww] - 
        (I/184320)*H1^5*Pi^4*sy*Cos[phi + 2*t0*ww] - ((3*I)/16384)*H1^5*Pi*sx*
         Cos[3*phi + 2*t0*ww] + ((29*I)/131072)*H1^5*sy*
         Cos[3*phi + 2*t0*ww] - ((7*I)/122880)*H1^5*Pi^2*sy*
         Cos[3*phi + 2*t0*ww] - (I/184320)*H1^5*Pi^4*sy*
         Cos[3*phi + 2*t0*ww] + ((31*I)/983040)*H1^5*Pi*sx*
         Cos[3*phi + 4*t0*ww] - (I/368640)*H1^5*Pi^3*sx*
         Cos[3*phi + 4*t0*ww] + ((19*I)/393216)*H1^5*sy*
         Cos[3*phi + 4*t0*ww] - (I/98304)*H1^5*Pi^2*sy*Cos[3*phi + 4*t0*ww] - 
        ((3*I)/65536)*H1^5*Pi*sx*Cos[5*phi + 4*t0*ww] + 
        (I/122880)*H1^5*Pi^3*sx*Cos[5*phi + 4*t0*ww] + ((3*I)/131072)*H1^5*sy*
         Cos[5*phi + 4*t0*ww] - (I/32768)*H1^5*Pi^2*sy*Cos[5*phi + 4*t0*ww] + 
        (I/98304)*H1^5*Pi*sx*Cos[5*phi + 6*t0*ww] + (I/131072)*H1^5*sy*
         Cos[5*phi + 6*t0*ww] - (I/245760)*H1^5*Pi^2*sy*
         Cos[5*phi + 6*t0*ww] - (I/163840)*H1^5*Pi*sx*
         Cos[phi + 4*t0*ww - 4*(t0 + Pi/ww)*ww] + (I/131072)*H1^5*sy*
         Cos[phi + 4*t0*ww - 4*(t0 + Pi/ww)*ww] + (I/983040)*H1^5*sy*
         Cos[phi + 6*t0*ww - 4*(t0 + Pi/ww)*ww] + (I/1310720)*H1^6*sz*t0*
         Cos[2*phi + 6*t0*ww - 4*(t0 + Pi/ww)*ww] + ((31*I)/245760)*H1^5*Pi*
         sx*Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/184320)*H1^5*Pi^3*sx*
         Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - ((5*I)/32768)*H1^5*sy*
         Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/24576)*H1^5*Pi^2*sy*
         Cos[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/98304)*H1^5*Pi*sx*
         Cos[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/196608)*H1^5*sy*
         Cos[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/245760)*H1^5*Pi^2*sy*
         Cos[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - ((9*I)/655360)*H1^6*sz*t0*
         Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/32768)*H1^5*Pi*sx*
         Cos[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - ((3*I)/131072)*H1^5*sy*
         Cos[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/81920)*H1^5*Pi^2*sy*
         Cos[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/245760)*H1^5*Pi*sx*
         Cos[3*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] - (I/196608)*H1^5*sy*
         Cos[3*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] - ((7*I)/1966080)*H1^6*sz*
         t0*Cos[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] + (I/655360)*H1^6*sz*t0*
         Cos[2*(phi + (t0 + Pi/ww)*ww)] + ((43*I)/1966080)*H1^6*sz*t0*
         Cos[4*(phi + (t0 + Pi/ww)*ww)] + (I/196608)*H1^6*sz*t0*
         Cos[6*(phi + (t0 + Pi/ww)*ww)] + (I/1474560)*H1^5*
         (-15*Pi*sx + (-15 + 42*Pi^2 + 8*Pi^4)*sy)*
         Cos[phi + 2*(t0 + Pi/ww)*ww] - ((3*I)/16384)*H1^5*Pi*sx*
         Cos[3*phi + 2*(t0 + Pi/ww)*ww] - ((29*I)/131072)*H1^5*sy*
         Cos[3*phi + 2*(t0 + Pi/ww)*ww] + ((7*I)/122880)*H1^5*Pi^2*sy*
         Cos[3*phi + 2*(t0 + Pi/ww)*ww] + (I/184320)*H1^5*Pi^4*sy*
         Cos[3*phi + 2*(t0 + Pi/ww)*ww] + ((31*I)/245760)*H1^5*Pi*sx*
         Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/184320)*H1^5*Pi^3*sx*
         Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + ((5*I)/32768)*H1^5*sy*
         Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/24576)*H1^5*Pi^2*sy*
         Cos[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/49152)*H1^5*Pi*sx*
         Cos[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/131072)*H1^5*sy*
         Cos[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - (I/122880)*H1^5*Pi^2*sy*
         Cos[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + (I/786432)*H1^6*sz*t0*
         Cos[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] + ((31*I)/983040)*H1^5*Pi*
         sx*Cos[3*phi + 4*(t0 + Pi/ww)*ww] - (I/368640)*H1^5*Pi^3*sx*
         Cos[3*phi + 4*(t0 + Pi/ww)*ww] - ((19*I)/393216)*H1^5*sy*
         Cos[3*phi + 4*(t0 + Pi/ww)*ww] + (I/98304)*H1^5*Pi^2*sy*
         Cos[3*phi + 4*(t0 + Pi/ww)*ww] - ((3*I)/65536)*H1^5*Pi*sx*
         Cos[5*phi + 4*(t0 + Pi/ww)*ww] + (I/122880)*H1^5*Pi^3*sx*
         Cos[5*phi + 4*(t0 + Pi/ww)*ww] - ((3*I)/131072)*H1^5*sy*
         Cos[5*phi + 4*(t0 + Pi/ww)*ww] + (I/32768)*H1^5*Pi^2*sy*
         Cos[5*phi + 4*(t0 + Pi/ww)*ww] - (I/163840)*H1^5*Pi*sx*
         Cos[phi - 4*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/131072)*H1^5*sy*
         Cos[phi - 4*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/98304)*H1^5*Pi*sx*
         Cos[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/196608)*H1^5*sy*
         Cos[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/245760)*H1^5*Pi^2*sy*
         Cos[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - ((9*I)/655360)*H1^6*sz*t0*
         Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/32768)*H1^5*Pi*sx*
         Cos[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + ((3*I)/131072)*H1^5*sy*
         Cos[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/81920)*H1^5*Pi^2*sy*
         Cos[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/49152)*H1^5*Pi*sx*
         Cos[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - (I/131072)*H1^5*sy*
         Cos[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/122880)*H1^5*Pi^2*sy*
         Cos[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/786432)*H1^6*sz*t0*
         Cos[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + (I/98304)*H1^5*Pi*sx*
         Cos[5*phi + 6*(t0 + Pi/ww)*ww] - (I/131072)*H1^5*sy*
         Cos[5*phi + 6*(t0 + Pi/ww)*ww] + (I/245760)*H1^5*Pi^2*sy*
         Cos[5*phi + 6*(t0 + Pi/ww)*ww] - (I/983040)*H1^5*sy*
         Cos[phi - 4*t0*ww + 6*(t0 + Pi/ww)*ww] + (I/1310720)*H1^6*sz*t0*
         Cos[2*phi - 4*t0*ww + 6*(t0 + Pi/ww)*ww] - (I/245760)*H1^5*Pi*sx*
         Cos[3*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] + (I/196608)*H1^5*sy*
         Cos[3*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] - (I/3932160)*H1^6*sz*t0*
         (29 + 2*(8 - 59*Cos[2*(phi + t0*ww)] + 111*Cos[4*(phi + t0*ww)] + 
            17*Cos[6*(phi + t0*ww)] - 6*Cos[2*phi + 4*t0*ww - 2*(t0 + Pi/ww)*
                ww] - 3*Cos[4*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] + 
            23*Cos[2*(phi + (t0 + Pi/ww)*ww)] + 
            43*Cos[4*(phi + (t0 + Pi/ww)*ww)] + 
            10*Cos[6*(phi + (t0 + Pi/ww)*ww)] - 
            4*Cos[6*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - 
            3*Cos[2*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
            2*Cos[6*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
            Cos[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww])) - 
        ((7*I)/1966080)*H1^6*sz*t0*Cos[4*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] + 
        (I/10240)*H1^5*Pi*sx*Cos[3*phi + 2*(2*t0 + Pi/ww)*ww] + 
        (I/184320)*H1^5*Pi^3*sx*Cos[3*phi + 2*(2*t0 + Pi/ww)*ww] + 
        ((13*I)/327680)*H1^6*sz*t0*Cos[4*phi + 2*(2*t0 + Pi/ww)*ww] - 
        (I/61440)*H1^5*Pi^3*sx*Cos[5*phi + 2*(2*t0 + Pi/ww)*ww] + 
        ((19*I)/61440)*H1^5*Pi*sy*Sin[phi] + (I/92160)*H1^5*Pi^3*sy*
         Sin[phi] + (I/98304)*H1^5*sx*Sin[phi + 2*t0*ww] - 
        ((7*I)/245760)*H1^5*Pi^2*sx*Sin[phi + 2*t0*ww] - 
        (I/184320)*H1^5*Pi^4*sx*Sin[phi + 2*t0*ww] + (I/98304)*H1^5*Pi*sy*
         Sin[phi + 2*t0*ww] - ((29*I)/131072)*H1^5*sx*Sin[3*phi + 2*t0*ww] + 
        ((7*I)/122880)*H1^5*Pi^2*sx*Sin[3*phi + 2*t0*ww] + 
        (I/184320)*H1^5*Pi^4*sx*Sin[3*phi + 2*t0*ww] - ((3*I)/16384)*H1^5*Pi*
         sy*Sin[3*phi + 2*t0*ww] + ((19*I)/393216)*H1^5*sx*
         Sin[3*phi + 4*t0*ww] - (I/98304)*H1^5*Pi^2*sx*Sin[3*phi + 4*t0*ww] - 
        ((31*I)/983040)*H1^5*Pi*sy*Sin[3*phi + 4*t0*ww] + 
        (I/368640)*H1^5*Pi^3*sy*Sin[3*phi + 4*t0*ww] - ((3*I)/131072)*H1^5*sx*
         Sin[5*phi + 4*t0*ww] + (I/32768)*H1^5*Pi^2*sx*Sin[5*phi + 4*t0*ww] - 
        ((3*I)/65536)*H1^5*Pi*sy*Sin[5*phi + 4*t0*ww] + 
        (I/122880)*H1^5*Pi^3*sy*Sin[5*phi + 4*t0*ww] + 
        (I/131072)*H1^5*sx*Sin[5*phi + 6*t0*ww] - (I/245760)*H1^5*Pi^2*sx*
         Sin[5*phi + 6*t0*ww] - (I/98304)*H1^5*Pi*sy*Sin[5*phi + 6*t0*ww] - 
        (I/131072)*H1^5*sx*Sin[phi + 4*t0*ww - 4*(t0 + Pi/ww)*ww] - 
        (I/163840)*H1^5*Pi*sy*Sin[phi + 4*t0*ww - 4*(t0 + Pi/ww)*ww] + 
        (I/983040)*H1^5*sx*Sin[phi + 6*t0*ww - 4*(t0 + Pi/ww)*ww] + 
        ((5*I)/32768)*H1^5*sx*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/24576)*H1^5*Pi^2*sx*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        ((31*I)/245760)*H1^5*Pi*sy*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/184320)*H1^5*Pi^3*sy*Sin[phi + 2*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/196608)*H1^5*sx*Sin[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/245760)*H1^5*Pi^2*sx*Sin[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/98304)*H1^5*Pi*sy*Sin[phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        ((3*I)/131072)*H1^5*sx*Sin[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/81920)*H1^5*Pi^2*sx*Sin[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        (I/32768)*H1^5*Pi*sy*Sin[3*phi + 4*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/196608)*H1^5*sx*Sin[3*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] + 
        (I/245760)*H1^5*Pi*sy*Sin[3*phi + 6*t0*ww - 2*(t0 + Pi/ww)*ww] - 
        (I/98304)*H1^5*sx*Sin[phi + 2*(t0 + Pi/ww)*ww] + 
        ((7*I)/245760)*H1^5*Pi^2*sx*Sin[phi + 2*(t0 + Pi/ww)*ww] + 
        (I/184320)*H1^5*Pi^4*sx*Sin[phi + 2*(t0 + Pi/ww)*ww] + 
        (I/98304)*H1^5*Pi*sy*Sin[phi + 2*(t0 + Pi/ww)*ww] + 
        ((29*I)/131072)*H1^5*sx*Sin[3*phi + 2*(t0 + Pi/ww)*ww] - 
        ((7*I)/122880)*H1^5*Pi^2*sx*Sin[3*phi + 2*(t0 + Pi/ww)*ww] - 
        (I/184320)*H1^5*Pi^4*sx*Sin[3*phi + 2*(t0 + Pi/ww)*ww] - 
        ((3*I)/16384)*H1^5*Pi*sy*Sin[3*phi + 2*(t0 + Pi/ww)*ww] - 
        ((5*I)/32768)*H1^5*sx*Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + 
        (I/24576)*H1^5*Pi^2*sx*Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + 
        ((31*I)/245760)*H1^5*Pi*sy*Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] - 
        (I/184320)*H1^5*Pi^3*sy*Sin[phi - 2*t0*ww + 2*(t0 + Pi/ww)*ww] + 
        (I/131072)*H1^5*sx*Sin[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - 
        (I/122880)*H1^5*Pi^2*sx*Sin[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - 
        (I/49152)*H1^5*Pi*sy*Sin[5*phi + 4*t0*ww + 2*(t0 + Pi/ww)*ww] - 
        ((19*I)/393216)*H1^5*sx*Sin[3*phi + 4*(t0 + Pi/ww)*ww] + 
        (I/98304)*H1^5*Pi^2*sx*Sin[3*phi + 4*(t0 + Pi/ww)*ww] - 
        ((31*I)/983040)*H1^5*Pi*sy*Sin[3*phi + 4*(t0 + Pi/ww)*ww] + 
        (I/368640)*H1^5*Pi^3*sy*Sin[3*phi + 4*(t0 + Pi/ww)*ww] + 
        ((3*I)/131072)*H1^5*sx*Sin[5*phi + 4*(t0 + Pi/ww)*ww] - 
        (I/32768)*H1^5*Pi^2*sx*Sin[5*phi + 4*(t0 + Pi/ww)*ww] - 
        ((3*I)/65536)*H1^5*Pi*sy*Sin[5*phi + 4*(t0 + Pi/ww)*ww] + 
        (I/122880)*H1^5*Pi^3*sy*Sin[5*phi + 4*(t0 + Pi/ww)*ww] + 
        (I/131072)*H1^5*sx*Sin[phi - 4*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/163840)*H1^5*Pi*sy*Sin[phi - 4*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/196608)*H1^5*sx*Sin[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/245760)*H1^5*Pi^2*sx*Sin[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/98304)*H1^5*Pi*sy*Sin[phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        ((3*I)/131072)*H1^5*sx*Sin[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/81920)*H1^5*Pi^2*sx*Sin[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/32768)*H1^5*Pi*sy*Sin[3*phi - 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/131072)*H1^5*sx*Sin[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] + 
        (I/122880)*H1^5*Pi^2*sx*Sin[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/49152)*H1^5*Pi*sy*Sin[5*phi + 2*t0*ww + 4*(t0 + Pi/ww)*ww] - 
        (I/131072)*H1^5*sx*Sin[5*phi + 6*(t0 + Pi/ww)*ww] + 
        (I/245760)*H1^5*Pi^2*sx*Sin[5*phi + 6*(t0 + Pi/ww)*ww] - 
        (I/98304)*H1^5*Pi*sy*Sin[5*phi + 6*(t0 + Pi/ww)*ww] - 
        (I/983040)*H1^5*sx*Sin[phi - 4*t0*ww + 6*(t0 + Pi/ww)*ww] + 
        (I/196608)*H1^5*sx*Sin[3*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] + 
        (I/245760)*H1^5*Pi*sy*Sin[3*phi - 2*t0*ww + 6*(t0 + Pi/ww)*ww] - 
        (I/10240)*H1^5*Pi*sy*Sin[3*phi + 2*(2*t0 + Pi/ww)*ww] - 
        (I/184320)*H1^5*Pi^3*sy*Sin[3*phi + 2*(2*t0 + Pi/ww)*ww] - 
        (I/61440)*H1^5*Pi^3*sy*Sin[5*phi + 2*(2*t0 + Pi/ww)*ww]))/(Pi*ww^4)
 
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
 
Subscript[\[CapitalOmega]bscoeff, 1][t_, t0_] = 
    ((-I/4)*H1*(sx*(t - t0)*ww*Cos[phi] + sy*(t - t0)*ww*Sin[phi] + 
       Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww])))/ww
 
Subscript[\[CapitalOmega]bscoeff, 2][t_, t0_] = 
    ((I/64)*H1^2*sz*(-2*t*ww + 2*t*ww*Cos[2*(phi + t*ww)] + 
       2*(t - t0)*ww*Cos[2*(phi + t0*ww)] + Sin[2*(t - t0)*ww] - 
       2*Sin[2*(phi + t*ww)] + 4*t0*ww*Sin[phi + t0*ww]^2 + 
       2*Sin[2*(phi + t0*ww)] - 4*t0*ww*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]bscoeff, 3][t_, t0_] = 
    ((I/1536)*H1^3*(4*t^2*ww^2*(Cos[2*(phi + t*ww)] - Cos[2*(phi + t0*ww)])*
        (sy*Cos[phi] - sx*Sin[phi]) - 8*t*t0*ww^2*(Cos[2*(phi + t*ww)] - 
         Cos[2*(phi + t0*ww)])*(sy*Cos[phi] - sx*Sin[phi]) + 
       8*t0^2*ww^2*(sy*Cos[phi] - sx*Sin[phi])*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww] - Sin[(t - t0)*ww]*
        (6*sx*Cos[phi + t*ww - t0*ww] - sx*Cos[phi + 3*t*ww - t0*ww] + 
         6*sx*Cos[phi - t*ww + t0*ww] + 3*sx*Cos[3*phi + 3*t*ww + t0*ww] - 
         sx*Cos[phi - t*ww + 3*t0*ww] + 3*sx*Cos[3*phi + t*ww + 3*t0*ww] + 
         2*sx*Cos[phi + (t + t0)*ww] - 12*sx*Cos[3*phi + (t + t0)*ww] + 
         6*sy*Sin[phi + t*ww - t0*ww] + sy*Sin[phi + 3*t*ww - t0*ww] + 
         6*sy*Sin[phi - t*ww + t0*ww] - 3*sy*Sin[3*phi + 3*t*ww + t0*ww] + 
         sy*Sin[phi - t*ww + 3*t0*ww] - 3*sy*Sin[3*phi + t*ww + 3*t0*ww] - 
         2*sy*Sin[phi + (t + t0)*ww] - 12*sy*Sin[3*phi + (t + t0)*ww]) + 
       t*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       t0*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
Subscript[\[CapitalOmega]bscoeff, 4][t_, t0_] = 
    ((I/49152)*H1^4*sz*(4*t*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 
         5*Cos[4*(phi + t*ww)] - 2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 
         8*Cos[2*(phi + t0*ww)] + 5*Cos[4*(phi + t0*ww)] - 
         2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 8*Cos[4*phi + 2*(t + t0)*ww]) - 
       4*t0*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 5*Cos[4*(phi + t*ww)] - 
         2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 8*Cos[2*(phi + t0*ww)] + 
         5*Cos[4*(phi + t0*ww)] - 2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         8*Cos[4*phi + 2*(t + t0)*ww]) + 16*t0^2*ww^2*
        (Cos[4*phi + 3*t*ww + t0*ww] + Cos[4*phi + t*ww + 3*t0*ww] + 
         2*Cos[2*phi + (t + t0)*ww])*Sin[(t - t0)*ww] + 
       8*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
       32*Cos[phi + t*ww]^2*Sin[2*(-t + t0)*ww] + 2*Sin[4*(-t + t0)*ww] - 
       104*Cos[phi + t*ww]^3*Sin[phi + t*ww] - 28*Sin[2*(phi + t*ww)] - 
       5*Sin[4*(phi + t*ww)] + 2*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
       8*t^2*ww^2*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 128*t*t0*ww^2*
        (Cos[phi + t*ww]^3*Sin[phi + t*ww] - Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 66*Sin[2*(phi + t0*ww)] + 
       18*Sin[4*(phi + t0*ww)] - 14*Sin[2*phi - 2*t*ww + 4*t0*ww]))/ww^4
 
Subscript[\[CapitalOmega]bscoeff, 5][t_, t0_] = 
    ((I/5898240)*H1^5*(32*sx*(t - t0)*ww*(57 + 2*t^2*ww^2 - 4*t*t0*ww^2 + 
         2*t0^2*ww^2)*Cos[phi] + 4*(15*sx*(-t + t0)*ww + 
         sy*(-15 + 42*t0^2*ww^2 + 8*t^4*ww^4 - 32*t^3*t0*ww^4 + 8*t0^4*ww^4 + 
           6*t^2*ww^2*(7 + 8*t0^2*ww^2) - 4*t*t0*ww^2*(21 + 8*t0^2*ww^2)))*
        Cos[phi + 2*t*ww] - 1305*sy*Cos[3*phi + 2*t*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t*ww] + 1080*sx*t0*ww*Cos[3*phi + 2*t*ww] + 
       336*sy*t^2*ww^2*Cos[3*phi + 2*t*ww] - 672*sy*t*t0*ww^2*
        Cos[3*phi + 2*t*ww] + 336*sy*t0^2*ww^2*Cos[3*phi + 2*t*ww] + 
       32*sy*t^4*ww^4*Cos[3*phi + 2*t*ww] - 128*sy*t^3*t0*ww^4*
        Cos[3*phi + 2*t*ww] + 192*sy*t^2*t0^2*ww^4*Cos[3*phi + 2*t*ww] - 
       128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t*ww] + 32*sy*t0^4*ww^4*
        Cos[3*phi + 2*t*ww] - 285*sy*Cos[3*phi + 4*t*ww] + 
       186*sx*t*ww*Cos[3*phi + 4*t*ww] - 186*sx*t0*ww*Cos[3*phi + 4*t*ww] + 
       60*sy*t^2*ww^2*Cos[3*phi + 4*t*ww] - 120*sy*t*t0*ww^2*
        Cos[3*phi + 4*t*ww] + 60*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww] - 
       16*sx*t^3*ww^3*Cos[3*phi + 4*t*ww] + 48*sx*t^2*t0*ww^3*
        Cos[3*phi + 4*t*ww] - 48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t*ww] + 
       16*sx*t0^3*ww^3*Cos[3*phi + 4*t*ww] - 135*sy*Cos[5*phi + 4*t*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t*ww] + 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t*ww] - 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t*ww] + 180*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t*ww] - 45*sy*Cos[5*phi + 6*t*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t*ww] + 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t*ww] - 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t*ww] + 24*sy*t0^2*ww^2*Cos[5*phi + 6*t*ww] - 
       45*sy*Cos[phi + 4*t*ww - 4*t0*ww] - 36*sx*t*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] - 6*sy*Cos[phi + 6*t*ww - 4*t0*ww] + 
       900*sy*Cos[phi + 2*t*ww - 2*t0*ww] + 744*sx*t*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] + 480*sy*t*t0*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t0^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 30*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
       60*sx*t*ww*Cos[phi + 4*t*ww - 2*t0*ww] - 60*sx*t0*ww*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] - 48*sy*t*t0*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t0^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 135*sy*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sx*t*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       144*sy*t*t0*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sy*Cos[3*phi + 6*t*ww - 2*t0*ww] - 24*sx*t*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 60*sy*Cos[phi + 2*t0*ww] - 
       60*sx*t*ww*Cos[phi + 2*t0*ww] + 60*sx*t0*ww*Cos[phi + 2*t0*ww] - 
       168*sy*t^2*ww^2*Cos[phi + 2*t0*ww] + 336*sy*t*t0*ww^2*
        Cos[phi + 2*t0*ww] - 168*sy*t0^2*ww^2*Cos[phi + 2*t0*ww] - 
       32*sy*t^4*ww^4*Cos[phi + 2*t0*ww] + 128*sy*t^3*t0*ww^4*
        Cos[phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*Cos[phi + 2*t0*ww] + 
       128*sy*t*t0^3*ww^4*Cos[phi + 2*t0*ww] - 32*sy*t0^4*ww^4*
        Cos[phi + 2*t0*ww] + 1305*sy*Cos[3*phi + 2*t0*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t0*ww] + 1080*sx*t0*ww*
        Cos[3*phi + 2*t0*ww] - 336*sy*t^2*ww^2*Cos[3*phi + 2*t0*ww] + 
       672*sy*t*t0*ww^2*Cos[3*phi + 2*t0*ww] - 336*sy*t0^2*ww^2*
        Cos[3*phi + 2*t0*ww] - 32*sy*t^4*ww^4*Cos[3*phi + 2*t0*ww] + 
       128*sy*t^3*t0*ww^4*Cos[3*phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*
        Cos[3*phi + 2*t0*ww] + 128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t0*ww] - 
       32*sy*t0^4*ww^4*Cos[3*phi + 2*t0*ww] - 
       900*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 744*sx*t*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 480*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 45*sy*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sx*t*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sx*t0*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sy*t*t0*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sy*Cos[3*phi + 4*t0*ww] + 186*sx*t*ww*Cos[3*phi + 4*t0*ww] - 
       186*sx*t0*ww*Cos[3*phi + 4*t0*ww] - 60*sy*t^2*ww^2*
        Cos[3*phi + 4*t0*ww] + 120*sy*t*t0*ww^2*Cos[3*phi + 4*t0*ww] - 
       60*sy*t0^2*ww^2*Cos[3*phi + 4*t0*ww] - 16*sx*t^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 48*sx*t^2*t0*ww^3*Cos[3*phi + 4*t0*ww] - 
       48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t0*ww] + 16*sx*t0^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 135*sy*Cos[5*phi + 4*t0*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t0*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t0*ww] - 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t0*ww] + 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t0*ww] - 180*sy*t0^2*ww^2*Cos[5*phi + 4*t0*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t0*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t0*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t0*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t0*ww] + 
       45*sy*Cos[phi - 4*t*ww + 4*t0*ww] - 36*sx*t*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] - 30*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
       60*sx*t*ww*Cos[phi - 2*t*ww + 4*t0*ww] - 60*sx*t0*ww*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 135*sy*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sx*t*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       144*sy*t*t0*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t0^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sy*Cos[5*phi + 2*t*ww + 4*t0*ww] + 120*sx*t*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 120*sx*t0*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 96*sy*t*t0*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t0^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 45*sy*Cos[5*phi + 6*t0*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t0*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t0*ww] - 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t0*ww] - 24*sy*t0^2*ww^2*Cos[5*phi + 6*t0*ww] + 
       6*sy*Cos[phi - 4*t*ww + 6*t0*ww] - 
       30*sy*Cos[3*phi - 2*t*ww + 6*t0*ww] - 24*sx*t*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 576*sx*t*ww*
        Cos[3*phi + 2*(t + t0)*ww] - 576*sx*t0*ww*
        Cos[3*phi + 2*(t + t0)*ww] + 32*sx*t^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^2*t0*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] + 96*sx*t*t0^2*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 32*sx*t0^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 288*sx*t^2*t0*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] - 288*sx*t*t0^2*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 96*sx*t0^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 1824*sy*t*ww*Sin[phi] - 
       1824*sy*t0*ww*Sin[phi] + 64*sy*t^3*ww^3*Sin[phi] - 
       192*sy*t^2*t0*ww^3*Sin[phi] + 192*sy*t*t0^2*ww^3*Sin[phi] - 
       64*sy*t0^3*ww^3*Sin[phi] - 60*sx*Sin[phi + 2*t*ww] + 
       60*sy*t*ww*Sin[phi + 2*t*ww] - 60*sy*t0*ww*Sin[phi + 2*t*ww] + 
       168*sx*t^2*ww^2*Sin[phi + 2*t*ww] - 336*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww] + 168*sx*t0^2*ww^2*Sin[phi + 2*t*ww] + 
       32*sx*t^4*ww^4*Sin[phi + 2*t*ww] - 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t*ww] + 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t*ww] - 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t*ww] + 32*sx*t0^4*ww^4*
        Sin[phi + 2*t*ww] + 1305*sx*Sin[3*phi + 2*t*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t*ww] + 1080*sy*t0*ww*Sin[3*phi + 2*t*ww] - 
       336*sx*t^2*ww^2*Sin[3*phi + 2*t*ww] + 672*sx*t*t0*ww^2*
        Sin[3*phi + 2*t*ww] - 336*sx*t0^2*ww^2*Sin[3*phi + 2*t*ww] - 
       32*sx*t^4*ww^4*Sin[3*phi + 2*t*ww] + 128*sx*t^3*t0*ww^4*
        Sin[3*phi + 2*t*ww] - 192*sx*t^2*t0^2*ww^4*Sin[3*phi + 2*t*ww] + 
       128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t*ww] - 32*sx*t0^4*ww^4*
        Sin[3*phi + 2*t*ww] - 285*sx*Sin[3*phi + 4*t*ww] - 
       186*sy*t*ww*Sin[3*phi + 4*t*ww] + 186*sy*t0*ww*Sin[3*phi + 4*t*ww] + 
       60*sx*t^2*ww^2*Sin[3*phi + 4*t*ww] - 120*sx*t*t0*ww^2*
        Sin[3*phi + 4*t*ww] + 60*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww] + 
       16*sy*t^3*ww^3*Sin[3*phi + 4*t*ww] - 48*sy*t^2*t0*ww^3*
        Sin[3*phi + 4*t*ww] + 48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t*ww] - 
       16*sy*t0^3*ww^3*Sin[3*phi + 4*t*ww] + 135*sx*Sin[5*phi + 4*t*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t*ww] - 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t*ww] + 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t*ww] - 180*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t*ww] - 45*sx*Sin[5*phi + 6*t*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t*ww] + 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t*ww] - 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t*ww] + 24*sx*t0^2*ww^2*Sin[5*phi + 6*t*ww] + 
       45*sx*Sin[phi + 4*t*ww - 4*t0*ww] - 36*sy*t*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] - 6*sx*Sin[phi + 6*t*ww - 4*t0*ww] - 
       900*sx*Sin[phi + 2*t*ww - 2*t0*ww] + 744*sy*t*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 480*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t0^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 30*sx*Sin[phi + 4*t*ww - 2*t0*ww] - 
       60*sy*t*ww*Sin[phi + 4*t*ww - 2*t0*ww] + 60*sy*t0*ww*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 48*sx*t*t0*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t0^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 135*sx*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sy*t*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       144*sx*t*t0*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sx*Sin[3*phi + 6*t*ww - 2*t0*ww] + 24*sy*t*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] + 60*sx*Sin[phi + 2*t0*ww] + 
       60*sy*t*ww*Sin[phi + 2*t0*ww] - 60*sy*t0*ww*Sin[phi + 2*t0*ww] - 
       168*sx*t^2*ww^2*Sin[phi + 2*t0*ww] + 336*sx*t*t0*ww^2*
        Sin[phi + 2*t0*ww] - 168*sx*t0^2*ww^2*Sin[phi + 2*t0*ww] - 
       32*sx*t^4*ww^4*Sin[phi + 2*t0*ww] + 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t0*ww] - 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t0*ww] + 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t0*ww] - 32*sx*t0^4*ww^4*
        Sin[phi + 2*t0*ww] - 1305*sx*Sin[3*phi + 2*t0*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t0*ww] + 1080*sy*t0*ww*
        Sin[3*phi + 2*t0*ww] + 336*sx*t^2*ww^2*Sin[3*phi + 2*t0*ww] - 
       672*sx*t*t0*ww^2*Sin[3*phi + 2*t0*ww] + 336*sx*t0^2*ww^2*
        Sin[3*phi + 2*t0*ww] + 32*sx*t^4*ww^4*Sin[3*phi + 2*t0*ww] - 
       128*sx*t^3*t0*ww^4*Sin[3*phi + 2*t0*ww] + 192*sx*t^2*t0^2*ww^4*
        Sin[3*phi + 2*t0*ww] - 128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t0*ww] + 
       32*sx*t0^4*ww^4*Sin[3*phi + 2*t0*ww] + 
       900*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 744*sy*t*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] + 480*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 45*sx*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sy*t*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sy*t0*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sx*t*t0*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sx*Sin[3*phi + 4*t0*ww] - 186*sy*t*ww*Sin[3*phi + 4*t0*ww] + 
       186*sy*t0*ww*Sin[3*phi + 4*t0*ww] - 60*sx*t^2*ww^2*
        Sin[3*phi + 4*t0*ww] + 120*sx*t*t0*ww^2*Sin[3*phi + 4*t0*ww] - 
       60*sx*t0^2*ww^2*Sin[3*phi + 4*t0*ww] + 16*sy*t^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 48*sy*t^2*t0*ww^3*Sin[3*phi + 4*t0*ww] + 
       48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t0*ww] - 16*sy*t0^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 135*sx*Sin[5*phi + 4*t0*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t0*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t0*ww] + 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t0*ww] - 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t0*ww] + 180*sx*t0^2*ww^2*Sin[5*phi + 4*t0*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t0*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t0*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t0*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t0*ww] - 
       45*sx*Sin[phi - 4*t*ww + 4*t0*ww] - 36*sy*t*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] - 30*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       60*sy*t*ww*Sin[phi - 2*t*ww + 4*t0*ww] + 60*sy*t0*ww*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 135*sx*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sy*t*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       144*sx*t*t0*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t0^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sx*Sin[5*phi + 2*t*ww + 4*t0*ww] - 120*sy*t*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 120*sy*t0*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 96*sx*t*t0*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t0^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 45*sx*Sin[5*phi + 6*t0*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t0*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t0*ww] - 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t0*ww] - 24*sx*t0^2*ww^2*Sin[5*phi + 6*t0*ww] + 
       6*sx*Sin[phi - 4*t*ww + 6*t0*ww] - 
       30*sx*Sin[3*phi - 2*t*ww + 6*t0*ww] + 24*sy*t*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 576*sy*t*ww*
        Sin[3*phi + 2*(t + t0)*ww] + 576*sy*t0*ww*
        Sin[3*phi + 2*(t + t0)*ww] - 32*sy*t^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 96*sy*t^2*t0*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t*t0^2*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 32*sy*t0^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 288*sy*t^2*t0*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] - 288*sy*t*t0^2*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 96*sy*t0^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww]))/ww^5
 
Subscript[\[CapitalOmega]bscoeff, 6][t_, t0_] = 
    ((-I/47185920)*H1^6*sz*(16*t^3*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - 
         Cos[2*(phi + t*ww)] + 2*Cos[4*(phi + t*ww)] + 
         3*Cos[6*(phi + t*ww)] + Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         Cos[2*(phi + t0*ww)] + 2*Cos[4*(phi + t0*ww)] + 
         3*Cos[6*(phi + t0*ww)] - 3*Cos[6*phi + 4*t*ww + 2*t0*ww] + 
         Cos[2*phi - 2*t*ww + 4*t0*ww] - 3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
         4*Cos[4*phi + 2*(t + t0)*ww]) - 48*t^2*t0*ww^3*
        (-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) + 
       48*t*t0^2*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) - 
       12*t*ww*(-25 + 80*Cos[2*(-t + t0)*ww] - 10*Cos[4*(-t + t0)*ww] + 
         6*Cos[2*(phi + t*ww)] + 86*Cos[4*(phi + t*ww)] + 
         20*Cos[6*(phi + t*ww)] + 3*Cos[2*phi + 6*t*ww - 4*t0*ww] - 
         54*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         14*Cos[4*phi + 6*t*ww - 2*t0*ww] + 6*Cos[2*(phi + t0*ww)] + 
         86*Cos[4*(phi + t0*ww)] + 20*Cos[6*(phi + t0*ww)] + 
         5*Cos[6*phi + 4*t*ww + 2*t0*ww] - 54*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         5*Cos[6*phi + 2*t*ww + 4*t0*ww] + 3*Cos[2*phi - 4*t*ww + 6*t0*ww] - 
         14*Cos[4*phi - 2*t*ww + 6*t0*ww] + 156*Cos[4*phi + 2*(t + t0)*ww]) + 
       1002*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       1872*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       72*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       186*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       3378*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
       210*Sin[2*(-t + t0)*ww] + 1614*Cos[2*(phi + t*ww)]*
        Sin[2*(-t + t0)*ww] - 66*Cos[2*phi - 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] + 120*Cos[6*phi + 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] - 72*Cos[2*phi + 3*t*ww - t0*ww]*
        Sin[3*(-t + t0)*ww] + 184*Cos[4*phi + 3*t*ww + t0*ww]*
        Sin[3*(-t + t0)*ww] - 39*Sin[4*(-t + t0)*ww] + 
       6*Sin[6*(-t + t0)*ww] + 36*Sin[2*(phi + t*ww)] + 
       1140*Sin[4*(phi + t*ww)] + 115*Sin[6*(phi + t*ww)] + 
       6*Sin[2*phi + 6*t*ww - 4*t0*ww] - 18*Sin[2*phi + 4*t*ww - 2*t0*ww] - 
       28*Sin[4*phi + 6*t*ww - 2*t0*ww] - 32*t^4*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 128*t^3*t0*ww^4*(2*Sin[2*(phi + t*ww)] + 
         Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 
       192*t^2*t0^2*ww^4*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) + 128*t*t0^3*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) - 339*Sin[2*(phi + t0*ww)] - 
       2132*Sin[4*(phi + t0*ww)] + 32*t0^4*ww^4*
        (4*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - Sin[4*(phi + t*ww)] + 
         Sin[4*(phi + t0*ww)]) - 82*Sin[6*(phi + t0*ww)] + 
       15*Sin[6*phi + 4*t*ww + 2*t0*ww] + 324*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
       48*Sin[6*phi + 2*t*ww + 4*t0*ww] - 9*Sin[2*phi - 4*t*ww + 6*t0*ww] + 
       24*t^2*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) - 
       48*t*t0*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) + 
       84*Sin[4*phi - 2*t*ww + 6*t0*ww] + 16*t0^3*ww^3*
        (8*Cos[2*(phi + t*ww)] - 2*Cos[4*(phi + t*ww)] - 
         3*Cos[6*(phi + t*ww)] - 8*Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] + 
         24*Sin[(-t + t0)*ww]^2 - 2*Sin[2*(-t + t0)*ww]*Sin[2*(phi + t*ww)] + 
         2*Sin[(-t + t0)*ww]*Sin[2*phi - t*ww + 3*t0*ww] + 
         8*Sin[(-t + t0)*ww]*Sin[4*phi + t*ww + 3*t0*ww] + 
         6*Sin[2*(-t + t0)*ww]*Sin[6*phi + 2*t*ww + 4*t0*ww] + 
         6*Sin[(-t + t0)*ww]*Sin[6*phi + t*ww + 5*t0*ww] - 
         14*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       12*t0*ww*(32*Cos[2*(-t + t0)*ww] - 3*Cos[4*(-t + t0)*ww] + 
         2*(8 + 23*Cos[2*(phi + t*ww)] + 43*Cos[4*(phi + t*ww)] + 
           10*Cos[6*(phi + t*ww)] - 3*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
           Cos[4*phi + 6*t*ww - 2*t0*ww] - 59*Cos[2*(phi + t0*ww)] + 
           111*Cos[4*(phi + t0*ww)] + 17*Cos[6*(phi + t0*ww)] + 
           2*Cos[6*phi + 4*t*ww + 2*t0*ww] - 
           6*Cos[2*phi - 2*t*ww + 4*t0*ww] - 
           4*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
           3*Cos[4*phi - 2*t*ww + 6*t0*ww] - 48*Sin[(-t + t0)*ww]^2 + 
           7*Sin[2*(-t + t0)*ww]^2 - 48*Sin[2*(-t + t0)*ww]*
            Sin[2*(phi + t*ww)] + 3*Sin[3*(-t + t0)*ww]*
            Sin[2*phi + 3*t*ww - t0*ww] - 12*Sin[3*(-t + t0)*ww]*
            Sin[4*phi + 3*t*ww + t0*ww] + 42*Sin[(-t + t0)*ww]*
            Sin[2*phi - t*ww + 3*t0*ww] + 156*Sin[(-t + t0)*ww]*
            Sin[4*phi + t*ww + 3*t0*ww] - 3*Sin[2*(-t + t0)*ww]*
            Sin[2*phi - 2*t*ww + 4*t0*ww] + Sin[2*(-t + t0)*ww]*
            Sin[6*phi + 2*t*ww + 4*t0*ww] + 8*Sin[(-t + t0)*ww]*
            Sin[4*phi - t*ww + 5*t0*ww] + 13*Sin[(-t + t0)*ww]*
            Sin[6*phi + t*ww + 5*t0*ww] - 40*Sin[(-t + t0)*ww]*
            Sin[2*phi + (t + t0)*ww])) - 12*t0^2*ww^2*
        (28*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
         16*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
         12*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] + 
         16*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
         96*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
         32*Sin[2*(-t + t0)*ww] + 24*Cos[2*(phi + t*ww)]*
          Sin[2*(-t + t0)*ww] - 22*Cos[6*phi + 2*t*ww + 4*t0*ww]*
          Sin[2*(-t + t0)*ww] + 12*Cos[4*phi + 3*t*ww + t0*ww]*
          Sin[3*(-t + t0)*ww] + 6*Sin[4*(-t + t0)*ww] - 
         2*Sin[2*(phi + t*ww)] + 32*Sin[4*(phi + t*ww)] + 
         14*Sin[6*(phi + t*ww)] + 4*Sin[2*(phi + t0*ww)] - 
         24*Sin[4*(phi + t0*ww)] - 11*Sin[6*(phi + t0*ww)] - 
         3*Sin[6*phi + 4*t*ww + 2*t0*ww] - 2*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
         8*Sin[4*phi + 2*(t + t0)*ww]) + 936*Sin[4*phi + 2*(t + t0)*ww]))/ww^6
 
HoldPattern[CommutativeQ[\[CapitalOmega]bscoeff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
HbscoeffS = (H1*(24576*H1*sz - 49152*H1*sz*Cos[2*(phi + t0*ww)]))/
      (786432*ww) + (H1*(384*H1^3*sz - 768*H1^3*sz*Cos[2*(phi + t0*ww)] - 
        1152*H1^3*sz*Cos[4*(phi + t0*ww)]))/(786432*ww^3) + 
     (H1*(-9*H1^5*sz + 18*H1^5*sz*Cos[2*(phi + t0*ww)] - 
        60*H1^5*sz*Cos[4*(phi + t0*ww)] - 10*H1^5*sz*Cos[6*(phi + t0*ww)]))/
      (786432*ww^5) + (H1*(196608*sx*Cos[phi] + 196608*sy*Sin[phi]))/786432 + 
     (H1*(-6144*H1^2*sx*Cos[phi] + 6144*H1^2*sx*Cos[3*phi + 2*t0*ww] - 
        3072*H1^2*sx*Cos[3*phi + 4*t0*ww] - 6144*H1^2*sy*Sin[phi] + 
        6144*H1^2*sy*Sin[3*phi + 2*t0*ww] + 3072*H1^2*sy*
         Sin[3*phi + 4*t0*ww]))/(786432*ww^2) + 
     (H1*(-432*H1^4*sx*Cos[phi] + 240*H1^4*sx*Cos[3*phi + 2*t0*ww] - 
        120*H1^4*sx*Cos[3*phi + 4*t0*ww] + 72*H1^4*sx*Cos[5*phi + 4*t0*ww] - 
        48*H1^4*sx*Cos[5*phi + 6*t0*ww] - 432*H1^4*sy*Sin[phi] + 
        240*H1^4*sy*Sin[3*phi + 2*t0*ww] + 120*H1^4*sy*Sin[3*phi + 4*t0*ww] + 
        72*H1^4*sy*Sin[5*phi + 4*t0*ww] + 48*H1^4*sy*Sin[5*phi + 6*t0*ww]))/
      (786432*ww^4)
 
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
 
Subscript[\[CapitalOmega]bscoeff, 1][t_, t0_] = 
    ((-I/4)*H1*(sx*(t - t0)*ww*Cos[phi] + sy*(t - t0)*ww*Sin[phi] + 
       Sin[(t - t0)*ww]*(sx*Cos[phi + (t + t0)*ww] - 
         sy*Sin[phi + (t + t0)*ww])))/ww
 
Subscript[\[CapitalOmega]bscoeff, 2][t_, t0_] = 
    ((I/64)*H1^2*sz*(-2*t*ww + 2*t*ww*Cos[2*(phi + t*ww)] + 
       2*(t - t0)*ww*Cos[2*(phi + t0*ww)] + Sin[2*(t - t0)*ww] - 
       2*Sin[2*(phi + t*ww)] + 4*t0*ww*Sin[phi + t0*ww]^2 + 
       2*Sin[2*(phi + t0*ww)] - 4*t0*ww*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]bscoeff, 3][t_, t0_] = 
    ((I/1536)*H1^3*(4*t^2*ww^2*(Cos[2*(phi + t*ww)] - Cos[2*(phi + t0*ww)])*
        (sy*Cos[phi] - sx*Sin[phi]) - 8*t*t0*ww^2*(Cos[2*(phi + t*ww)] - 
         Cos[2*(phi + t0*ww)])*(sy*Cos[phi] - sx*Sin[phi]) + 
       8*t0^2*ww^2*(sy*Cos[phi] - sx*Sin[phi])*Sin[(-t + t0)*ww]*
        Sin[2*phi + (t + t0)*ww] - Sin[(t - t0)*ww]*
        (6*sx*Cos[phi + t*ww - t0*ww] - sx*Cos[phi + 3*t*ww - t0*ww] + 
         6*sx*Cos[phi - t*ww + t0*ww] + 3*sx*Cos[3*phi + 3*t*ww + t0*ww] - 
         sx*Cos[phi - t*ww + 3*t0*ww] + 3*sx*Cos[3*phi + t*ww + 3*t0*ww] + 
         2*sx*Cos[phi + (t + t0)*ww] - 12*sx*Cos[3*phi + (t + t0)*ww] + 
         6*sy*Sin[phi + t*ww - t0*ww] + sy*Sin[phi + 3*t*ww - t0*ww] + 
         6*sy*Sin[phi - t*ww + t0*ww] - 3*sy*Sin[3*phi + 3*t*ww + t0*ww] + 
         sy*Sin[phi - t*ww + 3*t0*ww] - 3*sy*Sin[3*phi + t*ww + 3*t0*ww] - 
         2*sy*Sin[phi + (t + t0)*ww] - 12*sy*Sin[3*phi + (t + t0)*ww]) + 
       t*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww]) - 
       t0*ww*(8*sx*Cos[phi] - 6*sx*Cos[3*phi + 2*t*ww] + 
         sx*Cos[3*phi + 4*t*ww] + 2*sx*Cos[phi + 2*t*ww - 2*t0*ww] - 
         6*sx*Cos[3*phi + 2*t0*ww] + 2*sx*Cos[phi - 2*t*ww + 2*t0*ww] + 
         sx*Cos[3*phi + 4*t0*ww] + 4*sx*Cos[3*phi + 2*(t + t0)*ww] + 
         8*sy*Sin[phi] - 6*sy*Sin[3*phi + 2*t*ww] - sy*Sin[3*phi + 4*t*ww] + 
         2*sy*Sin[phi + 2*t*ww - 2*t0*ww] - 6*sy*Sin[3*phi + 2*t0*ww] + 
         2*sy*Sin[phi - 2*t*ww + 2*t0*ww] - sy*Sin[3*phi + 4*t0*ww] - 
         4*sy*Sin[3*phi + 2*(t + t0)*ww])))/ww^3
 
Subscript[\[CapitalOmega]bscoeff, 4][t_, t0_] = 
    ((I/49152)*H1^4*sz*(4*t*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 
         5*Cos[4*(phi + t*ww)] - 2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 
         8*Cos[2*(phi + t0*ww)] + 5*Cos[4*(phi + t0*ww)] - 
         2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 8*Cos[4*phi + 2*(t + t0)*ww]) - 
       4*t0*ww*(-6 + 8*Cos[2*(phi + t*ww)] + 5*Cos[4*(phi + t*ww)] - 
         2*Cos[2*phi + 4*t*ww - 2*t0*ww] + 8*Cos[2*(phi + t0*ww)] + 
         5*Cos[4*(phi + t0*ww)] - 2*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         8*Cos[4*phi + 2*(t + t0)*ww]) + 16*t0^2*ww^2*
        (Cos[4*phi + 3*t*ww + t0*ww] + Cos[4*phi + t*ww + 3*t0*ww] + 
         2*Cos[2*phi + (t + t0)*ww])*Sin[(t - t0)*ww] + 
       8*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
       32*Cos[phi + t*ww]^2*Sin[2*(-t + t0)*ww] + 2*Sin[4*(-t + t0)*ww] - 
       104*Cos[phi + t*ww]^3*Sin[phi + t*ww] - 28*Sin[2*(phi + t*ww)] - 
       5*Sin[4*(phi + t*ww)] + 2*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
       8*t^2*ww^2*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 128*t*t0*ww^2*
        (Cos[phi + t*ww]^3*Sin[phi + t*ww] - Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 66*Sin[2*(phi + t0*ww)] + 
       18*Sin[4*(phi + t0*ww)] - 14*Sin[2*phi - 2*t*ww + 4*t0*ww]))/ww^4
 
Subscript[\[CapitalOmega]bscoeff, 5][t_, t0_] = 
    ((I/5898240)*H1^5*(32*sx*(t - t0)*ww*(57 + 2*t^2*ww^2 - 4*t*t0*ww^2 + 
         2*t0^2*ww^2)*Cos[phi] + 4*(15*sx*(-t + t0)*ww + 
         sy*(-15 + 42*t0^2*ww^2 + 8*t^4*ww^4 - 32*t^3*t0*ww^4 + 8*t0^4*ww^4 + 
           6*t^2*ww^2*(7 + 8*t0^2*ww^2) - 4*t*t0*ww^2*(21 + 8*t0^2*ww^2)))*
        Cos[phi + 2*t*ww] - 1305*sy*Cos[3*phi + 2*t*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t*ww] + 1080*sx*t0*ww*Cos[3*phi + 2*t*ww] + 
       336*sy*t^2*ww^2*Cos[3*phi + 2*t*ww] - 672*sy*t*t0*ww^2*
        Cos[3*phi + 2*t*ww] + 336*sy*t0^2*ww^2*Cos[3*phi + 2*t*ww] + 
       32*sy*t^4*ww^4*Cos[3*phi + 2*t*ww] - 128*sy*t^3*t0*ww^4*
        Cos[3*phi + 2*t*ww] + 192*sy*t^2*t0^2*ww^4*Cos[3*phi + 2*t*ww] - 
       128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t*ww] + 32*sy*t0^4*ww^4*
        Cos[3*phi + 2*t*ww] - 285*sy*Cos[3*phi + 4*t*ww] + 
       186*sx*t*ww*Cos[3*phi + 4*t*ww] - 186*sx*t0*ww*Cos[3*phi + 4*t*ww] + 
       60*sy*t^2*ww^2*Cos[3*phi + 4*t*ww] - 120*sy*t*t0*ww^2*
        Cos[3*phi + 4*t*ww] + 60*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww] - 
       16*sx*t^3*ww^3*Cos[3*phi + 4*t*ww] + 48*sx*t^2*t0*ww^3*
        Cos[3*phi + 4*t*ww] - 48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t*ww] + 
       16*sx*t0^3*ww^3*Cos[3*phi + 4*t*ww] - 135*sy*Cos[5*phi + 4*t*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t*ww] + 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t*ww] - 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t*ww] + 180*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t*ww] - 45*sy*Cos[5*phi + 6*t*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t*ww] + 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t*ww] - 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t*ww] + 24*sy*t0^2*ww^2*Cos[5*phi + 6*t*ww] - 
       45*sy*Cos[phi + 4*t*ww - 4*t0*ww] - 36*sx*t*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi + 4*t*ww - 4*t0*ww] - 6*sy*Cos[phi + 6*t*ww - 4*t0*ww] + 
       900*sy*Cos[phi + 2*t*ww - 2*t0*ww] + 744*sx*t*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] + 480*sy*t*t0*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 240*sy*t0^2*ww^2*
        Cos[phi + 2*t*ww - 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi + 2*t*ww - 2*t0*ww] + 30*sy*Cos[phi + 4*t*ww - 2*t0*ww] + 
       60*sx*t*ww*Cos[phi + 4*t*ww - 2*t0*ww] - 60*sx*t0*ww*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] - 48*sy*t*t0*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 24*sy*t0^2*ww^2*
        Cos[phi + 4*t*ww - 2*t0*ww] + 135*sy*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sx*t*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       144*sy*t*t0*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] - 
       72*sy*t0^2*ww^2*Cos[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sy*Cos[3*phi + 6*t*ww - 2*t0*ww] - 24*sx*t*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi + 6*t*ww - 2*t0*ww] + 60*sy*Cos[phi + 2*t0*ww] - 
       60*sx*t*ww*Cos[phi + 2*t0*ww] + 60*sx*t0*ww*Cos[phi + 2*t0*ww] - 
       168*sy*t^2*ww^2*Cos[phi + 2*t0*ww] + 336*sy*t*t0*ww^2*
        Cos[phi + 2*t0*ww] - 168*sy*t0^2*ww^2*Cos[phi + 2*t0*ww] - 
       32*sy*t^4*ww^4*Cos[phi + 2*t0*ww] + 128*sy*t^3*t0*ww^4*
        Cos[phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*Cos[phi + 2*t0*ww] + 
       128*sy*t*t0^3*ww^4*Cos[phi + 2*t0*ww] - 32*sy*t0^4*ww^4*
        Cos[phi + 2*t0*ww] + 1305*sy*Cos[3*phi + 2*t0*ww] - 
       1080*sx*t*ww*Cos[3*phi + 2*t0*ww] + 1080*sx*t0*ww*
        Cos[3*phi + 2*t0*ww] - 336*sy*t^2*ww^2*Cos[3*phi + 2*t0*ww] + 
       672*sy*t*t0*ww^2*Cos[3*phi + 2*t0*ww] - 336*sy*t0^2*ww^2*
        Cos[3*phi + 2*t0*ww] - 32*sy*t^4*ww^4*Cos[3*phi + 2*t0*ww] + 
       128*sy*t^3*t0*ww^4*Cos[3*phi + 2*t0*ww] - 192*sy*t^2*t0^2*ww^4*
        Cos[3*phi + 2*t0*ww] + 128*sy*t*t0^3*ww^4*Cos[3*phi + 2*t0*ww] - 
       32*sy*t0^4*ww^4*Cos[3*phi + 2*t0*ww] - 
       900*sy*Cos[phi - 2*t*ww + 2*t0*ww] + 744*sx*t*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] - 744*sx*t0*ww*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 480*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] + 240*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 2*t0*ww] - 32*sx*t^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 96*sx*t^2*t0*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 96*sx*t*t0^2*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] + 32*sx*t0^3*ww^3*
        Cos[phi - 2*t*ww + 2*t0*ww] - 45*sy*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sx*t*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sx*t0*ww*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sy*t*t0*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sy*t0^2*ww^2*Cos[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sy*Cos[3*phi + 4*t0*ww] + 186*sx*t*ww*Cos[3*phi + 4*t0*ww] - 
       186*sx*t0*ww*Cos[3*phi + 4*t0*ww] - 60*sy*t^2*ww^2*
        Cos[3*phi + 4*t0*ww] + 120*sy*t*t0*ww^2*Cos[3*phi + 4*t0*ww] - 
       60*sy*t0^2*ww^2*Cos[3*phi + 4*t0*ww] - 16*sx*t^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 48*sx*t^2*t0*ww^3*Cos[3*phi + 4*t0*ww] - 
       48*sx*t*t0^2*ww^3*Cos[3*phi + 4*t0*ww] + 16*sx*t0^3*ww^3*
        Cos[3*phi + 4*t0*ww] + 135*sy*Cos[5*phi + 4*t0*ww] - 
       270*sx*t*ww*Cos[5*phi + 4*t0*ww] + 270*sx*t0*ww*Cos[5*phi + 4*t0*ww] - 
       180*sy*t^2*ww^2*Cos[5*phi + 4*t0*ww] + 360*sy*t*t0*ww^2*
        Cos[5*phi + 4*t0*ww] - 180*sy*t0^2*ww^2*Cos[5*phi + 4*t0*ww] + 
       48*sx*t^3*ww^3*Cos[5*phi + 4*t0*ww] - 144*sx*t^2*t0*ww^3*
        Cos[5*phi + 4*t0*ww] + 144*sx*t*t0^2*ww^3*Cos[5*phi + 4*t0*ww] - 
       48*sx*t0^3*ww^3*Cos[5*phi + 4*t0*ww] + 
       45*sy*Cos[phi - 4*t*ww + 4*t0*ww] - 36*sx*t*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] + 36*sx*t0*ww*
        Cos[phi - 4*t*ww + 4*t0*ww] - 30*sy*Cos[phi - 2*t*ww + 4*t0*ww] + 
       60*sx*t*ww*Cos[phi - 2*t*ww + 4*t0*ww] - 60*sx*t0*ww*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 24*sy*t0^2*ww^2*
        Cos[phi - 2*t*ww + 4*t0*ww] - 135*sy*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sx*t*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sx*t0*ww*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] - 
       144*sy*t*t0*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       72*sy*t0^2*ww^2*Cos[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sy*Cos[5*phi + 2*t*ww + 4*t0*ww] + 120*sx*t*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 120*sx*t0*ww*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 96*sy*t*t0*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] - 48*sy*t0^2*ww^2*
        Cos[5*phi + 2*t*ww + 4*t0*ww] + 45*sy*Cos[5*phi + 6*t0*ww] + 
       60*sx*t*ww*Cos[5*phi + 6*t0*ww] - 60*sx*t0*ww*Cos[5*phi + 6*t0*ww] - 
       24*sy*t^2*ww^2*Cos[5*phi + 6*t0*ww] + 48*sy*t*t0*ww^2*
        Cos[5*phi + 6*t0*ww] - 24*sy*t0^2*ww^2*Cos[5*phi + 6*t0*ww] + 
       6*sy*Cos[phi - 4*t*ww + 6*t0*ww] - 
       30*sy*Cos[3*phi - 2*t*ww + 6*t0*ww] - 24*sx*t*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 24*sx*t0*ww*
        Cos[3*phi - 2*t*ww + 6*t0*ww] + 576*sx*t*ww*
        Cos[3*phi + 2*(t + t0)*ww] - 576*sx*t0*ww*
        Cos[3*phi + 2*(t + t0)*ww] + 32*sx*t^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^2*t0*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] + 96*sx*t*t0^2*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 32*sx*t0^3*ww^3*
        Cos[3*phi + 2*(t + t0)*ww] - 96*sx*t^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 288*sx*t^2*t0*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] - 288*sx*t*t0^2*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 96*sx*t0^3*ww^3*
        Cos[5*phi + 2*(t + t0)*ww] + 1824*sy*t*ww*Sin[phi] - 
       1824*sy*t0*ww*Sin[phi] + 64*sy*t^3*ww^3*Sin[phi] - 
       192*sy*t^2*t0*ww^3*Sin[phi] + 192*sy*t*t0^2*ww^3*Sin[phi] - 
       64*sy*t0^3*ww^3*Sin[phi] - 60*sx*Sin[phi + 2*t*ww] + 
       60*sy*t*ww*Sin[phi + 2*t*ww] - 60*sy*t0*ww*Sin[phi + 2*t*ww] + 
       168*sx*t^2*ww^2*Sin[phi + 2*t*ww] - 336*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww] + 168*sx*t0^2*ww^2*Sin[phi + 2*t*ww] + 
       32*sx*t^4*ww^4*Sin[phi + 2*t*ww] - 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t*ww] + 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t*ww] - 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t*ww] + 32*sx*t0^4*ww^4*
        Sin[phi + 2*t*ww] + 1305*sx*Sin[3*phi + 2*t*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t*ww] + 1080*sy*t0*ww*Sin[3*phi + 2*t*ww] - 
       336*sx*t^2*ww^2*Sin[3*phi + 2*t*ww] + 672*sx*t*t0*ww^2*
        Sin[3*phi + 2*t*ww] - 336*sx*t0^2*ww^2*Sin[3*phi + 2*t*ww] - 
       32*sx*t^4*ww^4*Sin[3*phi + 2*t*ww] + 128*sx*t^3*t0*ww^4*
        Sin[3*phi + 2*t*ww] - 192*sx*t^2*t0^2*ww^4*Sin[3*phi + 2*t*ww] + 
       128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t*ww] - 32*sx*t0^4*ww^4*
        Sin[3*phi + 2*t*ww] - 285*sx*Sin[3*phi + 4*t*ww] - 
       186*sy*t*ww*Sin[3*phi + 4*t*ww] + 186*sy*t0*ww*Sin[3*phi + 4*t*ww] + 
       60*sx*t^2*ww^2*Sin[3*phi + 4*t*ww] - 120*sx*t*t0*ww^2*
        Sin[3*phi + 4*t*ww] + 60*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww] + 
       16*sy*t^3*ww^3*Sin[3*phi + 4*t*ww] - 48*sy*t^2*t0*ww^3*
        Sin[3*phi + 4*t*ww] + 48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t*ww] - 
       16*sy*t0^3*ww^3*Sin[3*phi + 4*t*ww] + 135*sx*Sin[5*phi + 4*t*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t*ww] - 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t*ww] + 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t*ww] - 180*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t*ww] - 45*sx*Sin[5*phi + 6*t*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t*ww] + 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t*ww] - 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t*ww] + 24*sx*t0^2*ww^2*Sin[5*phi + 6*t*ww] + 
       45*sx*Sin[phi + 4*t*ww - 4*t0*ww] - 36*sy*t*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi + 4*t*ww - 4*t0*ww] - 6*sx*Sin[phi + 6*t*ww - 4*t0*ww] - 
       900*sx*Sin[phi + 2*t*ww - 2*t0*ww] + 744*sy*t*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 480*sx*t*t0*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] + 240*sx*t0^2*ww^2*
        Sin[phi + 2*t*ww - 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi + 2*t*ww - 2*t0*ww] + 30*sx*Sin[phi + 4*t*ww - 2*t0*ww] - 
       60*sy*t*ww*Sin[phi + 4*t*ww - 2*t0*ww] + 60*sy*t0*ww*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 48*sx*t*t0*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] + 24*sx*t0^2*ww^2*
        Sin[phi + 4*t*ww - 2*t0*ww] - 135*sx*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       180*sy*t*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] - 
       144*sx*t*t0*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       72*sx*t0^2*ww^2*Sin[3*phi + 4*t*ww - 2*t0*ww] + 
       30*sx*Sin[3*phi + 6*t*ww - 2*t0*ww] + 24*sy*t*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi + 6*t*ww - 2*t0*ww] + 60*sx*Sin[phi + 2*t0*ww] + 
       60*sy*t*ww*Sin[phi + 2*t0*ww] - 60*sy*t0*ww*Sin[phi + 2*t0*ww] - 
       168*sx*t^2*ww^2*Sin[phi + 2*t0*ww] + 336*sx*t*t0*ww^2*
        Sin[phi + 2*t0*ww] - 168*sx*t0^2*ww^2*Sin[phi + 2*t0*ww] - 
       32*sx*t^4*ww^4*Sin[phi + 2*t0*ww] + 128*sx*t^3*t0*ww^4*
        Sin[phi + 2*t0*ww] - 192*sx*t^2*t0^2*ww^4*Sin[phi + 2*t0*ww] + 
       128*sx*t*t0^3*ww^4*Sin[phi + 2*t0*ww] - 32*sx*t0^4*ww^4*
        Sin[phi + 2*t0*ww] - 1305*sx*Sin[3*phi + 2*t0*ww] - 
       1080*sy*t*ww*Sin[3*phi + 2*t0*ww] + 1080*sy*t0*ww*
        Sin[3*phi + 2*t0*ww] + 336*sx*t^2*ww^2*Sin[3*phi + 2*t0*ww] - 
       672*sx*t*t0*ww^2*Sin[3*phi + 2*t0*ww] + 336*sx*t0^2*ww^2*
        Sin[3*phi + 2*t0*ww] + 32*sx*t^4*ww^4*Sin[3*phi + 2*t0*ww] - 
       128*sx*t^3*t0*ww^4*Sin[3*phi + 2*t0*ww] + 192*sx*t^2*t0^2*ww^4*
        Sin[3*phi + 2*t0*ww] - 128*sx*t*t0^3*ww^4*Sin[3*phi + 2*t0*ww] + 
       32*sx*t0^4*ww^4*Sin[3*phi + 2*t0*ww] + 
       900*sx*Sin[phi - 2*t*ww + 2*t0*ww] + 744*sy*t*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 744*sy*t0*ww*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] + 480*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 240*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 2*t0*ww] - 32*sy*t^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 96*sy*t^2*t0*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 96*sy*t*t0^2*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] + 32*sy*t0^3*ww^3*
        Sin[phi - 2*t*ww + 2*t0*ww] - 45*sx*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       120*sy*t*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       120*sy*t0*ww*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] - 
       96*sx*t*t0*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       48*sx*t0^2*ww^2*Sin[5*phi + 4*t*ww + 2*t0*ww] + 
       285*sx*Sin[3*phi + 4*t0*ww] - 186*sy*t*ww*Sin[3*phi + 4*t0*ww] + 
       186*sy*t0*ww*Sin[3*phi + 4*t0*ww] - 60*sx*t^2*ww^2*
        Sin[3*phi + 4*t0*ww] + 120*sx*t*t0*ww^2*Sin[3*phi + 4*t0*ww] - 
       60*sx*t0^2*ww^2*Sin[3*phi + 4*t0*ww] + 16*sy*t^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 48*sy*t^2*t0*ww^3*Sin[3*phi + 4*t0*ww] + 
       48*sy*t*t0^2*ww^3*Sin[3*phi + 4*t0*ww] - 16*sy*t0^3*ww^3*
        Sin[3*phi + 4*t0*ww] - 135*sx*Sin[5*phi + 4*t0*ww] - 
       270*sy*t*ww*Sin[5*phi + 4*t0*ww] + 270*sy*t0*ww*Sin[5*phi + 4*t0*ww] + 
       180*sx*t^2*ww^2*Sin[5*phi + 4*t0*ww] - 360*sx*t*t0*ww^2*
        Sin[5*phi + 4*t0*ww] + 180*sx*t0^2*ww^2*Sin[5*phi + 4*t0*ww] + 
       48*sy*t^3*ww^3*Sin[5*phi + 4*t0*ww] - 144*sy*t^2*t0*ww^3*
        Sin[5*phi + 4*t0*ww] + 144*sy*t*t0^2*ww^3*Sin[5*phi + 4*t0*ww] - 
       48*sy*t0^3*ww^3*Sin[5*phi + 4*t0*ww] - 
       45*sx*Sin[phi - 4*t*ww + 4*t0*ww] - 36*sy*t*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] + 36*sy*t0*ww*
        Sin[phi - 4*t*ww + 4*t0*ww] - 30*sx*Sin[phi - 2*t*ww + 4*t0*ww] - 
       60*sy*t*ww*Sin[phi - 2*t*ww + 4*t0*ww] + 60*sy*t0*ww*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] - 24*sx*t0^2*ww^2*
        Sin[phi - 2*t*ww + 4*t0*ww] + 135*sx*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       180*sy*t*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       180*sy*t0*ww*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       144*sx*t*t0*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] - 
       72*sx*t0^2*ww^2*Sin[3*phi - 2*t*ww + 4*t0*ww] + 
       45*sx*Sin[5*phi + 2*t*ww + 4*t0*ww] - 120*sy*t*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 120*sy*t0*ww*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 96*sx*t*t0*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] - 48*sx*t0^2*ww^2*
        Sin[5*phi + 2*t*ww + 4*t0*ww] + 45*sx*Sin[5*phi + 6*t0*ww] - 
       60*sy*t*ww*Sin[5*phi + 6*t0*ww] + 60*sy*t0*ww*Sin[5*phi + 6*t0*ww] - 
       24*sx*t^2*ww^2*Sin[5*phi + 6*t0*ww] + 48*sx*t*t0*ww^2*
        Sin[5*phi + 6*t0*ww] - 24*sx*t0^2*ww^2*Sin[5*phi + 6*t0*ww] + 
       6*sx*Sin[phi - 4*t*ww + 6*t0*ww] - 
       30*sx*Sin[3*phi - 2*t*ww + 6*t0*ww] + 24*sy*t*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 24*sy*t0*ww*
        Sin[3*phi - 2*t*ww + 6*t0*ww] - 576*sy*t*ww*
        Sin[3*phi + 2*(t + t0)*ww] + 576*sy*t0*ww*
        Sin[3*phi + 2*(t + t0)*ww] - 32*sy*t^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 96*sy*t^2*t0*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t*t0^2*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] + 32*sy*t0^3*ww^3*
        Sin[3*phi + 2*(t + t0)*ww] - 96*sy*t^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 288*sy*t^2*t0*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] - 288*sy*t*t0^2*ww^3*
        Sin[5*phi + 2*(t + t0)*ww] + 96*sy*t0^3*ww^3*
        Sin[5*phi + 2*(t + t0)*ww]))/ww^5
 
Subscript[\[CapitalOmega]bscoeff, 6][t_, t0_] = 
    ((-I/47185920)*H1^6*sz*(16*t^3*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - 
         Cos[2*(phi + t*ww)] + 2*Cos[4*(phi + t*ww)] + 
         3*Cos[6*(phi + t*ww)] + Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         Cos[2*(phi + t0*ww)] + 2*Cos[4*(phi + t0*ww)] + 
         3*Cos[6*(phi + t0*ww)] - 3*Cos[6*phi + 4*t*ww + 2*t0*ww] + 
         Cos[2*phi - 2*t*ww + 4*t0*ww] - 3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
         4*Cos[4*phi + 2*(t + t0)*ww]) - 48*t^2*t0*ww^3*
        (-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) + 
       48*t*t0^2*ww^3*(-12 + 12*Cos[2*(-t + t0)*ww] - Cos[2*(phi + t*ww)] + 
         2*Cos[4*(phi + t*ww)] + 3*Cos[6*(phi + t*ww)] + 
         Cos[2*phi + 4*t*ww - 2*t0*ww] - Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] - 
         3*Cos[6*phi + 4*t*ww + 2*t0*ww] + Cos[2*phi - 2*t*ww + 4*t0*ww] - 
         3*Cos[6*phi + 2*t*ww + 4*t0*ww] - 4*Cos[4*phi + 2*(t + t0)*ww]) - 
       12*t*ww*(-25 + 80*Cos[2*(-t + t0)*ww] - 10*Cos[4*(-t + t0)*ww] + 
         6*Cos[2*(phi + t*ww)] + 86*Cos[4*(phi + t*ww)] + 
         20*Cos[6*(phi + t*ww)] + 3*Cos[2*phi + 6*t*ww - 4*t0*ww] - 
         54*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
         14*Cos[4*phi + 6*t*ww - 2*t0*ww] + 6*Cos[2*(phi + t0*ww)] + 
         86*Cos[4*(phi + t0*ww)] + 20*Cos[6*(phi + t0*ww)] + 
         5*Cos[6*phi + 4*t*ww + 2*t0*ww] - 54*Cos[2*phi - 2*t*ww + 4*t0*ww] + 
         5*Cos[6*phi + 2*t*ww + 4*t0*ww] + 3*Cos[2*phi - 4*t*ww + 6*t0*ww] - 
         14*Cos[4*phi - 2*t*ww + 6*t0*ww] + 156*Cos[4*phi + 2*(t + t0)*ww]) + 
       1002*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       1872*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
       72*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       186*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
       3378*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
       210*Sin[2*(-t + t0)*ww] + 1614*Cos[2*(phi + t*ww)]*
        Sin[2*(-t + t0)*ww] - 66*Cos[2*phi - 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] + 120*Cos[6*phi + 2*t*ww + 4*t0*ww]*
        Sin[2*(-t + t0)*ww] - 72*Cos[2*phi + 3*t*ww - t0*ww]*
        Sin[3*(-t + t0)*ww] + 184*Cos[4*phi + 3*t*ww + t0*ww]*
        Sin[3*(-t + t0)*ww] - 39*Sin[4*(-t + t0)*ww] + 
       6*Sin[6*(-t + t0)*ww] + 36*Sin[2*(phi + t*ww)] + 
       1140*Sin[4*(phi + t*ww)] + 115*Sin[6*(phi + t*ww)] + 
       6*Sin[2*phi + 6*t*ww - 4*t0*ww] - 18*Sin[2*phi + 4*t*ww - 2*t0*ww] - 
       28*Sin[4*phi + 6*t*ww - 2*t0*ww] - 32*t^4*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) + 128*t^3*t0*ww^4*(2*Sin[2*(phi + t*ww)] + 
         Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) - 
       192*t^2*t0^2*ww^4*(2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 
         8*Cos[phi + t0*ww]^3*Sin[phi + t0*ww]) + 128*t*t0^3*ww^4*
        (2*Sin[2*(phi + t*ww)] + Sin[4*(phi + t*ww)] - 8*Cos[phi + t0*ww]^3*
          Sin[phi + t0*ww]) - 339*Sin[2*(phi + t0*ww)] - 
       2132*Sin[4*(phi + t0*ww)] + 32*t0^4*ww^4*
        (4*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - Sin[4*(phi + t*ww)] + 
         Sin[4*(phi + t0*ww)]) - 82*Sin[6*(phi + t0*ww)] + 
       15*Sin[6*phi + 4*t*ww + 2*t0*ww] + 324*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
       48*Sin[6*phi + 2*t*ww + 4*t0*ww] - 9*Sin[2*phi - 4*t*ww + 6*t0*ww] + 
       24*t^2*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) - 
       48*t*t0*ww^2*(16*Sin[2*(-t + t0)*ww] - 3*Sin[4*(-t + t0)*ww] - 
         23*Sin[2*(phi + t*ww)] - 16*Sin[4*(phi + t*ww)] - 
         7*Sin[6*(phi + t*ww)] + 6*Sin[2*phi + 4*t*ww - 2*t0*ww] + 
         3*Sin[4*phi + 6*t*ww - 2*t0*ww] + 23*Sin[2*(phi + t0*ww)] + 
         16*Sin[4*(phi + t0*ww)] + 7*Sin[6*(phi + t0*ww)] - 
         4*Sin[6*phi + 4*t*ww + 2*t0*ww] - 6*Sin[2*phi - 2*t*ww + 4*t0*ww] + 
         4*Sin[6*phi + 2*t*ww + 4*t0*ww] - 3*Sin[4*phi - 2*t*ww + 6*t0*ww]) + 
       84*Sin[4*phi - 2*t*ww + 6*t0*ww] + 16*t0^3*ww^3*
        (8*Cos[2*(phi + t*ww)] - 2*Cos[4*(phi + t*ww)] - 
         3*Cos[6*(phi + t*ww)] - 8*Cos[2*(phi + t0*ww)] + 
         2*Cos[4*(phi + t0*ww)] + 3*Cos[6*(phi + t0*ww)] + 
         24*Sin[(-t + t0)*ww]^2 - 2*Sin[2*(-t + t0)*ww]*Sin[2*(phi + t*ww)] + 
         2*Sin[(-t + t0)*ww]*Sin[2*phi - t*ww + 3*t0*ww] + 
         8*Sin[(-t + t0)*ww]*Sin[4*phi + t*ww + 3*t0*ww] + 
         6*Sin[2*(-t + t0)*ww]*Sin[6*phi + 2*t*ww + 4*t0*ww] + 
         6*Sin[(-t + t0)*ww]*Sin[6*phi + t*ww + 5*t0*ww] - 
         14*Sin[(-t + t0)*ww]*Sin[2*phi + (t + t0)*ww]) + 
       12*t0*ww*(32*Cos[2*(-t + t0)*ww] - 3*Cos[4*(-t + t0)*ww] + 
         2*(8 + 23*Cos[2*(phi + t*ww)] + 43*Cos[4*(phi + t*ww)] + 
           10*Cos[6*(phi + t*ww)] - 3*Cos[2*phi + 4*t*ww - 2*t0*ww] - 
           Cos[4*phi + 6*t*ww - 2*t0*ww] - 59*Cos[2*(phi + t0*ww)] + 
           111*Cos[4*(phi + t0*ww)] + 17*Cos[6*(phi + t0*ww)] + 
           2*Cos[6*phi + 4*t*ww + 2*t0*ww] - 
           6*Cos[2*phi - 2*t*ww + 4*t0*ww] - 
           4*Cos[6*phi + 2*t*ww + 4*t0*ww] - 
           3*Cos[4*phi - 2*t*ww + 6*t0*ww] - 48*Sin[(-t + t0)*ww]^2 + 
           7*Sin[2*(-t + t0)*ww]^2 - 48*Sin[2*(-t + t0)*ww]*
            Sin[2*(phi + t*ww)] + 3*Sin[3*(-t + t0)*ww]*
            Sin[2*phi + 3*t*ww - t0*ww] - 12*Sin[3*(-t + t0)*ww]*
            Sin[4*phi + 3*t*ww + t0*ww] + 42*Sin[(-t + t0)*ww]*
            Sin[2*phi - t*ww + 3*t0*ww] + 156*Sin[(-t + t0)*ww]*
            Sin[4*phi + t*ww + 3*t0*ww] - 3*Sin[2*(-t + t0)*ww]*
            Sin[2*phi - 2*t*ww + 4*t0*ww] + Sin[2*(-t + t0)*ww]*
            Sin[6*phi + 2*t*ww + 4*t0*ww] + 8*Sin[(-t + t0)*ww]*
            Sin[4*phi - t*ww + 5*t0*ww] + 13*Sin[(-t + t0)*ww]*
            Sin[6*phi + t*ww + 5*t0*ww] - 40*Sin[(-t + t0)*ww]*
            Sin[2*phi + (t + t0)*ww])) - 12*t0^2*ww^2*
        (28*Cos[2*phi - t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] - 
         16*Cos[4*phi + t*ww + 3*t0*ww]*Sin[(-t + t0)*ww] + 
         12*Cos[4*phi - t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] + 
         16*Cos[6*phi + t*ww + 5*t0*ww]*Sin[(-t + t0)*ww] - 
         96*Cos[2*phi + (t + t0)*ww]*Sin[(-t + t0)*ww] - 
         32*Sin[2*(-t + t0)*ww] + 24*Cos[2*(phi + t*ww)]*
          Sin[2*(-t + t0)*ww] - 22*Cos[6*phi + 2*t*ww + 4*t0*ww]*
          Sin[2*(-t + t0)*ww] + 12*Cos[4*phi + 3*t*ww + t0*ww]*
          Sin[3*(-t + t0)*ww] + 6*Sin[4*(-t + t0)*ww] - 
         2*Sin[2*(phi + t*ww)] + 32*Sin[4*(phi + t*ww)] + 
         14*Sin[6*(phi + t*ww)] + 4*Sin[2*(phi + t0*ww)] - 
         24*Sin[4*(phi + t0*ww)] - 11*Sin[6*(phi + t0*ww)] - 
         3*Sin[6*phi + 4*t*ww + 2*t0*ww] - 2*Sin[2*phi - 2*t*ww + 4*t0*ww] - 
         8*Sin[4*phi + 2*(t + t0)*ww]) + 936*Sin[4*phi + 2*(t + t0)*ww]))/ww^6
 
HoldPattern[CommutativeQ[\[CapitalOmega]bscoeff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
