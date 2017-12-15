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
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 1][t_, t0_] = 
    Integrate[(-I)*Hsimple[tt], {tt, t0, t}]
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 2][t_, t0_] = 0
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*((t - t0)*ww*(sx*(2*Hd0 + Hd1*(t - t0))*ww + Hd1*sy*Cos[2*t*ww] + 
         Hd1*sx*Sin[2*t*ww]) + (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(t + t0)*ww]*
        Sin[(t - t0)*ww] - (Hd1*sx + 2*Hd0*sy*ww)*Sin[(t - t0)*ww]*
        Sin[(t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    ((I/64)*Hd0*sz*((-3*Hd1 + (2*Hd0 + 3*Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t*ww] + (3*Hd1 + (2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t0*ww] + ww*((-2*Hd0 - 5*Hd1*t + 5*Hd1*t0)*Sin[2*t*ww] - 
         (Hd0 + Hd1*t - Hd1*t0)*(2*t*ww - 2*t0*ww - Sin[2*(t - t0)*ww])) + 
       (2*Hd0 + Hd1*(-t + t0))*ww*Sin[2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((I/3072)*Hd0^3*((12*sx*(-t + t0)*ww + sy*(-15 + 8*(t - t0)^2*ww^2))*
        Cos[2*t*ww] + (-3*sy + 2*sx*(t - t0)*ww)*Cos[4*t*ww] - 
       sy*Cos[2*(t - 2*t0)*ww] + 8*sx*(t - t0)*ww*(2 + Cos[2*(t - t0)*ww]) + 
       15*sy*Cos[2*t0*ww] - 12*sx*t*ww*Cos[2*t0*ww] + 
       12*sx*t0*ww*Cos[2*t0*ww] - 8*sy*t^2*ww^2*Cos[2*t0*ww] + 
       16*sy*t*t0*ww^2*Cos[2*t0*ww] - 8*sy*t0^2*ww^2*Cos[2*t0*ww] + 
       3*sy*Cos[4*t0*ww] + 2*sx*t*ww*Cos[4*t0*ww] - 2*sx*t0*ww*Cos[4*t0*ww] + 
       8*sx*(t - t0)*ww*Cos[2*(t + t0)*ww] + sy*Cos[4*t*ww - 2*t0*ww] + 
       9*sx*Sin[2*t*ww] - 12*sy*t*ww*Sin[2*t*ww] + 12*sy*t0*ww*Sin[2*t*ww] - 
       3*sx*Sin[4*t*ww] - 2*sy*t*ww*Sin[4*t*ww] + 2*sy*t0*ww*Sin[4*t*ww] + 
       sx*Sin[2*(t - 2*t0)*ww] - 12*sx*Sin[2*(t - t0)*ww] - 
       9*sx*Sin[2*t0*ww] - 12*sy*t*ww*Sin[2*t0*ww] + 
       12*sy*t0*ww*Sin[2*t0*ww] + 3*sx*Sin[4*t0*ww] - 
       2*sy*t*ww*Sin[4*t0*ww] + 2*sy*t0*ww*Sin[4*t0*ww] + 
       8*sy*(-t + t0)*ww*Sin[2*(t + t0)*ww] + sx*Sin[4*t*ww - 2*t0*ww]))/ww^3
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[Hsimple]] ^= False
 
Hsimple[t_] = ((Hd0 + Hd1*(t - t0))*(sx + sx*Cos[2*t*ww] - sy*Sin[2*t*ww]))/4
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
Hlinbar[tb_, ta_] = 
    -(48*Hd0*sz*((3*Hd1 + (-ta + tb)*(2*Hd0 + Hd1*(-ta + tb))*ww^2)*
          Cos[2*ta*ww] + (-3*Hd1 + (-ta + tb)*(2*Hd0 + 3*Hd1*(-ta + tb))*
            ww^2)*Cos[2*tb*ww] + (2*Hd0 + Hd1*(ta - tb))*ww*Sin[2*ta*ww] + 
         ww*((-2*Hd0 + 5*Hd1*(ta - tb))*Sin[2*tb*ww] + (Hd0 + Hd1*(-ta + tb))*
            (2*(ta - tb)*ww + Sin[2*(-ta + tb)*ww]))) - 
       384*ww*((-ta + tb)*ww*(sx*(2*Hd0 + Hd1*(-ta + tb))*ww + 
           Hd1*sy*Cos[2*tb*ww] + Hd1*sx*Sin[2*tb*ww]) + 
         (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(ta + tb)*ww]*Sin[(-ta + tb)*ww] - 
         (Hd1*sx + 2*Hd0*sy*ww)*Sin[(-ta + tb)*ww]*Sin[(ta + tb)*ww]) + 
       Hd0^3*(15*sy*Cos[2*ta*ww] + 12*sx*ta*ww*Cos[2*ta*ww] - 
         12*sx*tb*ww*Cos[2*ta*ww] - 8*sy*ta^2*ww^2*Cos[2*ta*ww] + 
         16*sy*ta*tb*ww^2*Cos[2*ta*ww] - 8*sy*tb^2*ww^2*Cos[2*ta*ww] + 
         3*sy*Cos[4*ta*ww] - 2*sx*ta*ww*Cos[4*ta*ww] + 
         2*sx*tb*ww*Cos[4*ta*ww] + sy*Cos[2*(ta - 2*tb)*ww] + 
         (12*sx*(ta - tb)*ww + sy*(-15 + 8*(ta - tb)^2*ww^2))*Cos[2*tb*ww] + 
         (-3*sy + 2*sx*(-ta + tb)*ww)*Cos[4*tb*ww] - 
         sy*Cos[2*(-2*ta + tb)*ww] + 8*sx*(-ta + tb)*ww*
          (2 + Cos[2*(-ta + tb)*ww]) + 8*sx*(-ta + tb)*ww*
          Cos[2*(ta + tb)*ww] - 9*sx*Sin[2*ta*ww] + 12*sy*ta*ww*
          Sin[2*ta*ww] - 12*sy*tb*ww*Sin[2*ta*ww] + 3*sx*Sin[4*ta*ww] + 
         2*sy*ta*ww*Sin[4*ta*ww] - 2*sy*tb*ww*Sin[4*ta*ww] - 
         sx*Sin[2*(ta - 2*tb)*ww] + 9*sx*Sin[2*tb*ww] + 
         12*sy*ta*ww*Sin[2*tb*ww] - 12*sy*tb*ww*Sin[2*tb*ww] - 
         3*sx*Sin[4*tb*ww] + 2*sy*ta*ww*Sin[4*tb*ww] - 
         2*sy*tb*ww*Sin[4*tb*ww] + sx*Sin[2*(-2*ta + tb)*ww] - 
         12*sx*Sin[2*(-ta + tb)*ww] + 8*sy*(ta - tb)*ww*Sin[2*(ta + tb)*ww]))/
     (3072*(-ta + tb)*ww^3)
 
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
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 1][t_, t0_] = 
    Integrate[(-I)*Hsimple[tt], {tt, t0, t}]
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 2][t_, t0_] = 0
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*((t - t0)*ww*(sx*(2*Hd0 + Hd1*(t - t0))*ww + Hd1*sy*Cos[2*t*ww] + 
         Hd1*sx*Sin[2*t*ww]) + (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(t + t0)*ww]*
        Sin[(t - t0)*ww] - (Hd1*sx + 2*Hd0*sy*ww)*Sin[(t - t0)*ww]*
        Sin[(t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    ((I/64)*Hd0*sz*((-3*Hd1 + (2*Hd0 + 3*Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t*ww] + (3*Hd1 + (2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t0*ww] + ww*((-2*Hd0 - 5*Hd1*t + 5*Hd1*t0)*Sin[2*t*ww] - 
         (Hd0 + Hd1*t - Hd1*t0)*(2*t*ww - 2*t0*ww - Sin[2*(t - t0)*ww])) + 
       (2*Hd0 + Hd1*(-t + t0))*ww*Sin[2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((I/3072)*Hd0^3*((12*sx*(-t + t0)*ww + sy*(-15 + 8*(t - t0)^2*ww^2))*
        Cos[2*t*ww] + (-3*sy + 2*sx*(t - t0)*ww)*Cos[4*t*ww] - 
       sy*Cos[2*(t - 2*t0)*ww] + 8*sx*(t - t0)*ww*(2 + Cos[2*(t - t0)*ww]) + 
       15*sy*Cos[2*t0*ww] - 12*sx*t*ww*Cos[2*t0*ww] + 
       12*sx*t0*ww*Cos[2*t0*ww] - 8*sy*t^2*ww^2*Cos[2*t0*ww] + 
       16*sy*t*t0*ww^2*Cos[2*t0*ww] - 8*sy*t0^2*ww^2*Cos[2*t0*ww] + 
       3*sy*Cos[4*t0*ww] + 2*sx*t*ww*Cos[4*t0*ww] - 2*sx*t0*ww*Cos[4*t0*ww] + 
       8*sx*(t - t0)*ww*Cos[2*(t + t0)*ww] + sy*Cos[4*t*ww - 2*t0*ww] + 
       9*sx*Sin[2*t*ww] - 12*sy*t*ww*Sin[2*t*ww] + 12*sy*t0*ww*Sin[2*t*ww] - 
       3*sx*Sin[4*t*ww] - 2*sy*t*ww*Sin[4*t*ww] + 2*sy*t0*ww*Sin[4*t*ww] + 
       sx*Sin[2*(t - 2*t0)*ww] - 12*sx*Sin[2*(t - t0)*ww] - 
       9*sx*Sin[2*t0*ww] - 12*sy*t*ww*Sin[2*t0*ww] + 
       12*sy*t0*ww*Sin[2*t0*ww] + 3*sx*Sin[4*t0*ww] - 
       2*sy*t*ww*Sin[4*t0*ww] + 2*sy*t0*ww*Sin[4*t0*ww] + 
       8*sy*(-t + t0)*ww*Sin[2*(t + t0)*ww] + sx*Sin[4*t*ww - 2*t0*ww]))/ww^3
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[Hsimple]] ^= False
 
Hsimple[t_] = ((Hd0 + Hd1*(t - t0))*(sx + sx*Cos[2*t*ww] - sy*Sin[2*t*ww]))/4
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
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
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 1][t_, t0_] = 
    Integrate[(-I)*Hsimple[tt], {tt, t0, t}]
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 2][t_, t0_] = 0
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*((t - t0)*ww*(sx*(2*Hd0 + Hd1*(t - t0))*ww + Hd1*sy*Cos[2*t*ww] + 
         Hd1*sx*Sin[2*t*ww]) + (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(t + t0)*ww]*
        Sin[(t - t0)*ww] - (Hd1*sx + 2*Hd0*sy*ww)*Sin[(t - t0)*ww]*
        Sin[(t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    ((I/64)*Hd0*sz*((-3*Hd1 + (2*Hd0 + 3*Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t*ww] + (3*Hd1 + (2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t0*ww] + ww*((-2*Hd0 - 5*Hd1*t + 5*Hd1*t0)*Sin[2*t*ww] - 
         (Hd0 + Hd1*t - Hd1*t0)*(2*t*ww - 2*t0*ww - Sin[2*(t - t0)*ww])) + 
       (2*Hd0 + Hd1*(-t + t0))*ww*Sin[2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((I/3072)*Hd0^3*((12*sx*(-t + t0)*ww + sy*(-15 + 8*(t - t0)^2*ww^2))*
        Cos[2*t*ww] + (-3*sy + 2*sx*(t - t0)*ww)*Cos[4*t*ww] - 
       sy*Cos[2*(t - 2*t0)*ww] + 8*sx*(t - t0)*ww*(2 + Cos[2*(t - t0)*ww]) + 
       15*sy*Cos[2*t0*ww] - 12*sx*t*ww*Cos[2*t0*ww] + 
       12*sx*t0*ww*Cos[2*t0*ww] - 8*sy*t^2*ww^2*Cos[2*t0*ww] + 
       16*sy*t*t0*ww^2*Cos[2*t0*ww] - 8*sy*t0^2*ww^2*Cos[2*t0*ww] + 
       3*sy*Cos[4*t0*ww] + 2*sx*t*ww*Cos[4*t0*ww] - 2*sx*t0*ww*Cos[4*t0*ww] + 
       8*sx*(t - t0)*ww*Cos[2*(t + t0)*ww] + sy*Cos[4*t*ww - 2*t0*ww] + 
       9*sx*Sin[2*t*ww] - 12*sy*t*ww*Sin[2*t*ww] + 12*sy*t0*ww*Sin[2*t*ww] - 
       3*sx*Sin[4*t*ww] - 2*sy*t*ww*Sin[4*t*ww] + 2*sy*t0*ww*Sin[4*t*ww] + 
       sx*Sin[2*(t - 2*t0)*ww] - 12*sx*Sin[2*(t - t0)*ww] - 
       9*sx*Sin[2*t0*ww] - 12*sy*t*ww*Sin[2*t0*ww] + 
       12*sy*t0*ww*Sin[2*t0*ww] + 3*sx*Sin[4*t0*ww] - 
       2*sy*t*ww*Sin[4*t0*ww] + 2*sy*t0*ww*Sin[4*t0*ww] + 
       8*sy*(-t + t0)*ww*Sin[2*(t + t0)*ww] + sx*Sin[4*t*ww - 2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(-2*Hd0^3*sx + 8*Hd0*sz*(Hd0 + Hd1*t - Hd1*t0)*ww + 
       32*sx*(2*Hd0 + Hd1*t - Hd1*t0)*ww^2 + 
       2*(Hd0^3*sx + 16*Hd1*sy*ww - 8*Hd0*sz*(Hd0 + Hd1*(t - t0))*ww)*
        Cos[2*\[Alpha]0] - Hd0^3*sx*Cos[4*\[Alpha]0] + 
       2*(Hd0^3*sy + 12*Hd0*Hd1*sz + 16*Hd1*sx*ww)*Sin[2*\[Alpha]0] + 
       Hd0^3*sy*Sin[4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[Hsimple]] ^= False
 
Hsimple[t_] = ((Hd0 + Hd1*(t - t0))*(sx + sx*Cos[2*t*ww] - sy*Sin[2*t*ww]))/4
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
Hlineffbar[tb_, ta_] = (-2*Hd0^3*sx + 8*Hd0*sz*(Hd0 + Hd1*(-ta + tb))*ww + 
      32*sx*(2*Hd0 + Hd1*(-ta + tb))*ww^2 + 
      2*(Hd0^3*sx + 16*Hd1*sy*ww - 8*Hd0*sz*(Hd0 + Hd1*(-ta + tb))*ww)*
       Cos[2*\[Alpha]0] - Hd0^3*sx*Cos[4*\[Alpha]0] + 
      2*(Hd0^3*sy + 12*Hd0*Hd1*sz + 16*Hd1*sx*ww)*Sin[2*\[Alpha]0] + 
      Hd0^3*sy*Sin[4*\[Alpha]0])/(256*ww^2)
 
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
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 1][t_, t0_] = 
    Integrate[(-I)*Hsimple[tt], {tt, t0, t}]
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 2][t_, t0_] = 0
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*((t - t0)*ww*(sx*(2*Hd0 + Hd1*(t - t0))*ww + Hd1*sy*Cos[2*t*ww] + 
         Hd1*sx*Sin[2*t*ww]) + (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(t + t0)*ww]*
        Sin[(t - t0)*ww] - (Hd1*sx + 2*Hd0*sy*ww)*Sin[(t - t0)*ww]*
        Sin[(t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    ((I/64)*Hd0*sz*((-3*Hd1 + (2*Hd0 + 3*Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t*ww] + (3*Hd1 + (2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t0*ww] + ww*((-2*Hd0 - 5*Hd1*t + 5*Hd1*t0)*Sin[2*t*ww] - 
         (Hd0 + Hd1*t - Hd1*t0)*(2*t*ww - 2*t0*ww - Sin[2*(t - t0)*ww])) + 
       (2*Hd0 + Hd1*(-t + t0))*ww*Sin[2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((I/3072)*Hd0^3*((12*sx*(-t + t0)*ww + sy*(-15 + 8*(t - t0)^2*ww^2))*
        Cos[2*t*ww] + (-3*sy + 2*sx*(t - t0)*ww)*Cos[4*t*ww] - 
       sy*Cos[2*(t - 2*t0)*ww] + 8*sx*(t - t0)*ww*(2 + Cos[2*(t - t0)*ww]) + 
       15*sy*Cos[2*t0*ww] - 12*sx*t*ww*Cos[2*t0*ww] + 
       12*sx*t0*ww*Cos[2*t0*ww] - 8*sy*t^2*ww^2*Cos[2*t0*ww] + 
       16*sy*t*t0*ww^2*Cos[2*t0*ww] - 8*sy*t0^2*ww^2*Cos[2*t0*ww] + 
       3*sy*Cos[4*t0*ww] + 2*sx*t*ww*Cos[4*t0*ww] - 2*sx*t0*ww*Cos[4*t0*ww] + 
       8*sx*(t - t0)*ww*Cos[2*(t + t0)*ww] + sy*Cos[4*t*ww - 2*t0*ww] + 
       9*sx*Sin[2*t*ww] - 12*sy*t*ww*Sin[2*t*ww] + 12*sy*t0*ww*Sin[2*t*ww] - 
       3*sx*Sin[4*t*ww] - 2*sy*t*ww*Sin[4*t*ww] + 2*sy*t0*ww*Sin[4*t*ww] + 
       sx*Sin[2*(t - 2*t0)*ww] - 12*sx*Sin[2*(t - t0)*ww] - 
       9*sx*Sin[2*t0*ww] - 12*sy*t*ww*Sin[2*t0*ww] + 
       12*sy*t0*ww*Sin[2*t0*ww] + 3*sx*Sin[4*t0*ww] - 
       2*sy*t*ww*Sin[4*t0*ww] + 2*sy*t0*ww*Sin[4*t0*ww] + 
       8*sy*(-t + t0)*ww*Sin[2*(t + t0)*ww] + sx*Sin[4*t*ww - 2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(-2*Hd0^3*sx + 8*Hd0*sz*(Hd0 + Hd1*t - Hd1*t0)*ww + 
       32*sx*(2*Hd0 + Hd1*t - Hd1*t0)*ww^2 + 
       2*(Hd0^3*sx + 16*Hd1*sy*ww - 8*Hd0*sz*(Hd0 + Hd1*(t - t0))*ww)*
        Cos[2*\[Alpha]0] - Hd0^3*sx*Cos[4*\[Alpha]0] + 
       2*(Hd0^3*sy + 12*Hd0*Hd1*sz + 16*Hd1*sx*ww)*Sin[2*\[Alpha]0] + 
       Hd0^3*sy*Sin[4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[Hsimple]] ^= False
 
Hsimple[t_] = ((Hd0 + Hd1*(t - t0))*(sx + sx*Cos[2*t*ww] - sy*Sin[2*t*ww]))/4
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
Hlineffbar[tb_, ta_] = (-2*Hd0^3*sx + 8*Hd0*sz*(Hd0 + Hd1*(-ta + tb))*ww + 
      32*sx*(2*Hd0 + Hd1*(-ta + tb))*ww^2 + 
      2*(Hd0^3*sx + 16*Hd1*sy*ww - 8*Hd0*sz*(Hd0 + Hd1*(-ta + tb))*ww)*
       Cos[2*\[Alpha]0] - Hd0^3*sx*Cos[4*\[Alpha]0] + 
      2*(Hd0^3*sy + 12*Hd0*Hd1*sz + 16*Hd1*sx*ww)*Sin[2*\[Alpha]0] + 
      Hd0^3*sy*Sin[4*\[Alpha]0])/(256*ww^2)
 
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
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 1][t_, t0_] = 
    Integrate[(-I)*Hsimple[tt], {tt, t0, t}]
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 2][t_, t0_] = 0
 
Subscript[Removed["\[CapitalOmega]\[CapitalOmega]simple"], 3][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 1][t_, t0_] = 
    ((-I/8)*((t - t0)*ww*(sx*(2*Hd0 + Hd1*(t - t0))*ww + Hd1*sy*Cos[2*t*ww] + 
         Hd1*sx*Sin[2*t*ww]) + (-(Hd1*sy) + 2*Hd0*sx*ww)*Cos[(t + t0)*ww]*
        Sin[(t - t0)*ww] - (Hd1*sx + 2*Hd0*sy*ww)*Sin[(t - t0)*ww]*
        Sin[(t + t0)*ww]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 2][t_, t0_] = 
    ((I/64)*Hd0*sz*((-3*Hd1 + (2*Hd0 + 3*Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t*ww] + (3*Hd1 + (2*Hd0 + Hd1*(t - t0))*(t - t0)*ww^2)*
        Cos[2*t0*ww] + ww*((-2*Hd0 - 5*Hd1*t + 5*Hd1*t0)*Sin[2*t*ww] - 
         (Hd0 + Hd1*t - Hd1*t0)*(2*t*ww - 2*t0*ww - Sin[2*(t - t0)*ww])) + 
       (2*Hd0 + Hd1*(-t + t0))*ww*Sin[2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]simple, 3][t_, t0_] = 
    ((I/3072)*Hd0^3*((12*sx*(-t + t0)*ww + sy*(-15 + 8*(t - t0)^2*ww^2))*
        Cos[2*t*ww] + (-3*sy + 2*sx*(t - t0)*ww)*Cos[4*t*ww] - 
       sy*Cos[2*(t - 2*t0)*ww] + 8*sx*(t - t0)*ww*(2 + Cos[2*(t - t0)*ww]) + 
       15*sy*Cos[2*t0*ww] - 12*sx*t*ww*Cos[2*t0*ww] + 
       12*sx*t0*ww*Cos[2*t0*ww] - 8*sy*t^2*ww^2*Cos[2*t0*ww] + 
       16*sy*t*t0*ww^2*Cos[2*t0*ww] - 8*sy*t0^2*ww^2*Cos[2*t0*ww] + 
       3*sy*Cos[4*t0*ww] + 2*sx*t*ww*Cos[4*t0*ww] - 2*sx*t0*ww*Cos[4*t0*ww] + 
       8*sx*(t - t0)*ww*Cos[2*(t + t0)*ww] + sy*Cos[4*t*ww - 2*t0*ww] + 
       9*sx*Sin[2*t*ww] - 12*sy*t*ww*Sin[2*t*ww] + 12*sy*t0*ww*Sin[2*t*ww] - 
       3*sx*Sin[4*t*ww] - 2*sy*t*ww*Sin[4*t*ww] + 2*sy*t0*ww*Sin[4*t*ww] + 
       sx*Sin[2*(t - 2*t0)*ww] - 12*sx*Sin[2*(t - t0)*ww] - 
       9*sx*Sin[2*t0*ww] - 12*sy*t*ww*Sin[2*t0*ww] + 
       12*sy*t0*ww*Sin[2*t0*ww] + 3*sx*Sin[4*t0*ww] - 
       2*sy*t*ww*Sin[4*t0*ww] + 2*sy*t0*ww*Sin[4*t0*ww] + 
       8*sy*(-t + t0)*ww*Sin[2*(t + t0)*ww] + sx*Sin[4*t*ww - 2*t0*ww]))/ww^3
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(-2*Hd0^3*sx + 8*Hd0*sz*(Hd0 + Hd1*t - Hd1*t0)*ww + 
       32*sx*(2*Hd0 + Hd1*t - Hd1*t0)*ww^2 + 
       2*(Hd0^3*sx + 16*Hd1*sy*ww - 8*Hd0*sz*(Hd0 + Hd1*(t - t0))*ww)*
        Cos[2*\[Alpha]0] - Hd0^3*sx*Cos[4*\[Alpha]0] + 
       2*(Hd0^3*sy + 12*Hd0*Hd1*sz + 16*Hd1*sx*ww)*Sin[2*\[Alpha]0] + 
       Hd0^3*sy*Sin[4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 2][t_, t0_] = 0
 
Subscript[\[CapitalOmega]\[CapitalOmega]eff, 3][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[Hsimple]] ^= False
 
Hsimple[t_] = ((Hd0 + Hd1*(t - t0))*(sx + sx*Cos[2*t*ww] - sy*Sin[2*t*ww]))/4
 
HoldPattern[CommutativeQ[sy]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]simple]] ^= False
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]eff]] ^= False
