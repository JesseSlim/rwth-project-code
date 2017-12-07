

Hefflinbar[tb_, ta_] = S[(I*(JesseDoMagnusIntegration[3, 3] + 
        JesseDoMagnusIntegration[WWeff, 3] + JesseDoMagnusIntegration[
         Heff[tb], 3]))/(-ta + tb)]
HoldPattern[CommutativeQ[WWeff]] ^= False
 
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
 
Subscript[WWeff, 1][t_, t0_] = 
    ((I/1536)*(t - t0)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         (3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww - 
         48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(t + t0)) - 
         32*(2*Hd0 + Hd1*(t + t0))*ww^2)*Cos[phi] - 
       16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         2*(3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww)*
        Cos[2*(phi + \[Alpha]0)] + 
       3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(t + t0)) - 
           4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(t + t0))*ww)*
          Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(t + t0))*
          Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
         3*Hd0^2*Hd1*sx*t*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*t0*
          Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
         6*Hd0^2*Hd1*sy*t*Sin[phi] + 6*Hd0^2*Hd1*sy*t0*Sin[phi] - 
         128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*t*ww^2*Sin[phi] - 
         64*Hd1*sy*t0*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*t*Sin[2*(phi + \[Alpha]0)] - 
         24*Hd1^2*sz*t0*Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
          Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 
         16*Delta^2*Hd1*sy*t*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*t0*
          Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
         64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t*ww*
          Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t0*ww*
          Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
         6*Hd0^2*Hd1*sy*t*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*t0*
          Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(t + t0))*
          Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[WWeff, 2][t_, t0_] = ((-I/768)*Hd1*(t - t0)^3*
      (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 
       4*Hd1*sz*Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
        Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
       8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/
     ww
 
Subscript[WWeff, 3][t_, t0_] = ((1 + t + t^2 + t^3 + t^4)*
      (1 + t0 + t0^2 + t0^3 + t0^4)*(1 + ww + ww^2 + ww^3 + ww^4)*
      MapThread[If[#1, S[#2], If[#2 =!= 0, trimmedCoeffs$60047++]; 0] & , 
       {{{{True, True, True, True, True}, {True, True, True, True, False}, 
          {True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}}, 
         {{True, True, True, True, False}, {True, True, True, False, False}, 
          {True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}}, 
         {{True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, False, False, False, False}, {False, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}}, {}}, 3])/ww^4
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
S = Simplify
 
Attributes[trimmedCoeffs$60047] = {Temporary}
 
trimmedCoeffs$60047 = 58
Hefflinbar[tb_, ta_] = 
    (I*(((1 + ta + ta^2 + ta^3 + ta^4)*(1 + tb + tb^2 + tb^3 + tb^4)*
         (1 + ww + ww^2 + ww^3 + ww^4)*MapThread[
          If[#1, S[#2], If[#2 =!= 0, trimmedCoeffs$60047++]; 0] & , 
          {{{{True, True, True, True, True}, {True, True, True, True, False}, 
             {True, True, True, False, False}, {True, True, False, False, 
              False}, {True, False, False, False, False}}, 
            {{True, True, True, True, False}, {True, True, True, False, 
              False}, {True, True, False, False, False}, {True, False, False, 
              False, False}, {False, False, False, False, False}}, 
            {{True, True, True, False, False}, {True, True, False, False, 
              False}, {True, False, False, False, False}, {False, False, 
              False, False, False}, {False, False, False, False, False}}, 
            {{True, True, False, False, False}, {True, False, False, False, 
              False}, {False, False, False, False, False}, {False, False, 
              False, False, False}, {False, False, False, False, False}}, 
            {{True, False, False, False, False}, {False, False, False, False, 
              False}, {False, False, False, False, False}, {False, False, 
              False, False, False}, {False, False, False, False, False}}}, 
           {}}, 3])/ww^4 - ((I/768)*Hd1*(-ta + tb)^3*
         (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 4*Hd1*sz*
           Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
           Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
          Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
          8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - Hd0^2*sx*
           Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/ww + 
       ((I/1536)*(-ta + tb)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(ta + tb)) - 
            (3*Hd0^2 + 3*Hd0*Hd1*(ta + tb) + Hd1^2*(ta^2 + ta*tb + tb^2))*
             ww - 48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(ta + tb)) - 
            32*(2*Hd0 + Hd1*(ta + tb))*ww^2)*Cos[phi] - 
          16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(ta + tb)) - 
            2*(3*Hd0^2 + 3*Hd0*Hd1*(ta + tb) + Hd1^2*(ta^2 + ta*tb + tb^2))*
             ww)*Cos[2*(phi + \[Alpha]0)] + 
          3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(ta + tb)) - 
              4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(ta + tb))*ww)*
             Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(ta + tb))*
             Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
            3*Hd0^2*Hd1*sx*ta*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*tb*
             Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
            6*Hd0^2*Hd1*sy*ta*Sin[phi] + 6*Hd0^2*Hd1*sy*tb*Sin[phi] - 
            128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*ta*ww^2*Sin[phi] - 
            64*Hd1*sy*tb*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
             Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*ta*
             Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*tb*
             Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
             Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*
             Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*ta*
             Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*tb*
             Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
            64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*ta*ww*
             Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*tb*ww*
             Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
            6*Hd0^2*Hd1*sy*ta*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*tb*
             Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(ta + tb))*
             Sin[3*phi + 4*\[Alpha]0])))/ww^2))/(-ta + tb)
 
S = Simplify
 
Attributes[trimmedCoeffs$60047] = {Temporary}
 
trimmedCoeffs$60047 = 58
 
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
 
Subscript[WWeff, 1][t_, t0_] = 
    ((I/1536)*(t - t0)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         (3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww - 
         48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(t + t0)) - 
         32*(2*Hd0 + Hd1*(t + t0))*ww^2)*Cos[phi] - 
       16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         2*(3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww)*
        Cos[2*(phi + \[Alpha]0)] + 
       3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(t + t0)) - 
           4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(t + t0))*ww)*
          Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(t + t0))*
          Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
         3*Hd0^2*Hd1*sx*t*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*t0*
          Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
         6*Hd0^2*Hd1*sy*t*Sin[phi] + 6*Hd0^2*Hd1*sy*t0*Sin[phi] - 
         128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*t*ww^2*Sin[phi] - 
         64*Hd1*sy*t0*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*t*Sin[2*(phi + \[Alpha]0)] - 
         24*Hd1^2*sz*t0*Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
          Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 
         16*Delta^2*Hd1*sy*t*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*t0*
          Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
         64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t*ww*
          Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t0*ww*
          Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
         6*Hd0^2*Hd1*sy*t*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*t0*
          Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(t + t0))*
          Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[WWeff, 2][t_, t0_] = ((-I/768)*Hd1*(t - t0)^3*
      (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 
       4*Hd1*sz*Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
        Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
       8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/
     ww
 
Subscript[WWeff, 3][t_, t0_] = ((1 + t + t^2 + t^3 + t^4)*
      (1 + t0 + t0^2 + t0^3 + t0^4)*(1 + ww + ww^2 + ww^3 + ww^4)*
      MapThread[If[#1, S[#2], If[#2 =!= 0, trimmedCoeffs$60047++]; 0] & , 
       {{{{True, True, True, True, True}, {True, True, True, True, False}, 
          {True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}}, 
         {{True, True, True, True, False}, {True, True, True, False, False}, 
          {True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}}, 
         {{True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, False, False, False, False}, {False, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}}, {}}, 3])/ww^4
 
HoldPattern[CommutativeQ[WWeff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
HoldPattern[CommutativeQ[WWeff]] ^= False
 
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
 
Subscript[WWeff, 1][t_, t0_] = 
    ((I/1536)*(t - t0)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         (3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww - 
         48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(t + t0)) - 
         32*(2*Hd0 + Hd1*(t + t0))*ww^2)*Cos[phi] - 
       16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         2*(3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww)*
        Cos[2*(phi + \[Alpha]0)] + 
       3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(t + t0)) - 
           4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(t + t0))*ww)*
          Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(t + t0))*
          Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
         3*Hd0^2*Hd1*sx*t*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*t0*
          Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
         6*Hd0^2*Hd1*sy*t*Sin[phi] + 6*Hd0^2*Hd1*sy*t0*Sin[phi] - 
         128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*t*ww^2*Sin[phi] - 
         64*Hd1*sy*t0*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*t*Sin[2*(phi + \[Alpha]0)] - 
         24*Hd1^2*sz*t0*Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
          Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 
         16*Delta^2*Hd1*sy*t*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*t0*
          Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
         64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t*ww*
          Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t0*ww*
          Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
         6*Hd0^2*Hd1*sy*t*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*t0*
          Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(t + t0))*
          Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[WWeff, 2][t_, t0_] = ((-I/768)*Hd1*(t - t0)^3*
      (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 
       4*Hd1*sz*Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
        Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
       8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/
     ww
 
Subscript[WWeff, 3][t_, t0_] = ((1 + t + t^2 + t^3 + t^4)*
      (1 + t0 + t0^2 + t0^3 + t0^4)*(1 + ww + ww^2 + ww^3 + ww^4)*
      MapThread[If[#1, S[#2], If[#2 =!= 0, trimmedCoeffs$60047++]; 0] & , 
       {{{{True, True, True, True, True}, {True, True, True, True, False}, 
          {True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}}, 
         {{True, True, True, True, False}, {True, True, True, False, False}, 
          {True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}}, 
         {{True, True, True, False, False}, {True, True, False, False, 
           False}, {True, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, True, False, False, False}, {True, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}, 
         {{True, False, False, False, False}, {False, False, False, False, 
           False}, {False, False, False, False, False}, {False, False, False, 
           False, False}, {False, False, False, False, False}}}, {}}, 3])/ww^4
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
S = Simplify
 
Attributes[trimmedCoeffs$60047] = {Temporary}
 
trimmedCoeffs$60047 = 58

Hefflinbar[tb_, ta_] = (I*(JesseDoMagnusIntegration[3, 3] + 
       JesseDoMagnusIntegration[WWeff, 3] + JesseDoMagnusIntegration[
        (64*(2*Delta*sz + (Hd0 + Hd1*tb)*(sx*Cos[phi] + sy*Sin[phi])) + 
          (8*(sz*(Hd0 + Hd1*tb)^2 - 2*sz*(Hd0 + Hd1*tb)^2*
              Cos[2*(phi + \[Alpha]0)] + 4*(Hd1*sy + Delta*sx*(Hd0 + Hd1*tb))*
              Cos[phi + 2*\[Alpha]0] + 4*(Hd1*sx - Delta*sy*(Hd0 + Hd1*tb))*
              Sin[phi + 2*\[Alpha]0]))/ww + (-8*Delta*sz*(Hd0 + Hd1*tb)^2 - 
            2*sx*(Hd0 + Hd1*tb)^3*Cos[phi] + 8*Delta*sz*(Hd0 + Hd1*tb)^2*
             Cos[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sy*
             Cos[phi + 2*\[Alpha]0] - 16*Delta^2*sx*(Hd0 + Hd1*tb)*
             Cos[phi + 2*\[Alpha]0] + 2*sx*(Hd0 + Hd1*tb)^3*
             Cos[3*phi + 2*\[Alpha]0] - sx*(Hd0 + Hd1*tb)^3*
             Cos[3*phi + 4*\[Alpha]0] - 2*sy*(Hd0 + Hd1*tb)^3*Sin[phi] + 
            24*Hd1*sz*(Hd0 + Hd1*tb)*Sin[2*(phi + \[Alpha]0)] - 
            32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*sy*
             (Hd0 + Hd1*tb)*Sin[phi + 2*\[Alpha]0] + 2*sy*(Hd0 + Hd1*tb)^3*
             Sin[3*phi + 2*\[Alpha]0] + sy*(Hd0 + Hd1*tb)^3*
             Sin[3*phi + 4*\[Alpha]0])/ww^2)/256, 3]))/(-ta + tb)
 
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
 
Subscript[WWeff, 1][t_, t0_] = JesseDoMagnusIntegration[
     (64*(2*Delta*sz + (Hd0 + Hd1*t)*(sx*Cos[phi] + sy*Sin[phi])) + 
       (8*(sz*(Hd0 + Hd1*t)^2 - 2*sz*(Hd0 + Hd1*t)^2*
           Cos[2*(phi + \[Alpha]0)] + 4*(Hd1*sy + Delta*sx*(Hd0 + Hd1*t))*
           Cos[phi + 2*\[Alpha]0] + 4*(Hd1*sx - Delta*sy*(Hd0 + Hd1*t))*
           Sin[phi + 2*\[Alpha]0]))/ww + (-8*Delta*sz*(Hd0 + Hd1*t)^2 - 
         2*sx*(Hd0 + Hd1*t)^3*Cos[phi] + 8*Delta*sz*(Hd0 + Hd1*t)^2*
          Cos[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] - 
         16*Delta^2*sx*(Hd0 + Hd1*t)*Cos[phi + 2*\[Alpha]0] + 
         2*sx*(Hd0 + Hd1*t)^3*Cos[3*phi + 2*\[Alpha]0] - 
         sx*(Hd0 + Hd1*t)^3*Cos[3*phi + 4*\[Alpha]0] - 2*sy*(Hd0 + Hd1*t)^3*
          Sin[phi] + 24*Hd1*sz*(Hd0 + Hd1*t)*Sin[2*(phi + \[Alpha]0)] - 
         32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*sy*(Hd0 + Hd1*t)*
          Sin[phi + 2*\[Alpha]0] + 2*sy*(Hd0 + Hd1*t)^3*
          Sin[3*phi + 2*\[Alpha]0] + sy*(Hd0 + Hd1*t)^3*
          Sin[3*phi + 4*\[Alpha]0])/ww^2)/256, 3]
 
Subscript[WWeff, 2][t_, t0_] = JesseDoMagnusIntegration[WWeff, 3]
 
Subscript[WWeff, 3][t_, t0_] = JesseDoMagnusIntegration[3, 3]
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False

Hefflinbar[tb_, ta_] = (I*(JesseDoMagnusIntegration[3, 3] + 
       JesseDoMagnusIntegration[WWeff, 3] + JesseDoMagnusIntegration[
        (64*(2*Delta*sz + (Hd0 + Hd1*tb)*(sx*Cos[phi] + sy*Sin[phi])) + 
          (8*(sz*(Hd0 + Hd1*tb)^2 - 2*sz*(Hd0 + Hd1*tb)^2*
              Cos[2*(phi + \[Alpha]0)] + 4*(Hd1*sy + Delta*sx*(Hd0 + Hd1*tb))*
              Cos[phi + 2*\[Alpha]0] + 4*(Hd1*sx - Delta*sy*(Hd0 + Hd1*tb))*
              Sin[phi + 2*\[Alpha]0]))/ww + (-8*Delta*sz*(Hd0 + Hd1*tb)^2 - 
            2*sx*(Hd0 + Hd1*tb)^3*Cos[phi] + 8*Delta*sz*(Hd0 + Hd1*tb)^2*
             Cos[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sy*
             Cos[phi + 2*\[Alpha]0] - 16*Delta^2*sx*(Hd0 + Hd1*tb)*
             Cos[phi + 2*\[Alpha]0] + 2*sx*(Hd0 + Hd1*tb)^3*
             Cos[3*phi + 2*\[Alpha]0] - sx*(Hd0 + Hd1*tb)^3*
             Cos[3*phi + 4*\[Alpha]0] - 2*sy*(Hd0 + Hd1*tb)^3*Sin[phi] + 
            24*Hd1*sz*(Hd0 + Hd1*tb)*Sin[2*(phi + \[Alpha]0)] - 
            32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*sy*
             (Hd0 + Hd1*tb)*Sin[phi + 2*\[Alpha]0] + 2*sy*(Hd0 + Hd1*tb)^3*
             Sin[3*phi + 2*\[Alpha]0] + sy*(Hd0 + Hd1*tb)^3*
             Sin[3*phi + 4*\[Alpha]0])/ww^2)/256, 3]))/(-ta + tb)
 
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
 
Subscript[WWeff, 1][t_, t0_] = JesseDoMagnusIntegration[
     (64*(2*Delta*sz + (Hd0 + Hd1*t)*(sx*Cos[phi] + sy*Sin[phi])) + 
       (8*(sz*(Hd0 + Hd1*t)^2 - 2*sz*(Hd0 + Hd1*t)^2*
           Cos[2*(phi + \[Alpha]0)] + 4*(Hd1*sy + Delta*sx*(Hd0 + Hd1*t))*
           Cos[phi + 2*\[Alpha]0] + 4*(Hd1*sx - Delta*sy*(Hd0 + Hd1*t))*
           Sin[phi + 2*\[Alpha]0]))/ww + (-8*Delta*sz*(Hd0 + Hd1*t)^2 - 
         2*sx*(Hd0 + Hd1*t)^3*Cos[phi] + 8*Delta*sz*(Hd0 + Hd1*t)^2*
          Cos[2*(phi + \[Alpha]0)] - 32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] - 
         16*Delta^2*sx*(Hd0 + Hd1*t)*Cos[phi + 2*\[Alpha]0] + 
         2*sx*(Hd0 + Hd1*t)^3*Cos[3*phi + 2*\[Alpha]0] - 
         sx*(Hd0 + Hd1*t)^3*Cos[3*phi + 4*\[Alpha]0] - 2*sy*(Hd0 + Hd1*t)^3*
          Sin[phi] + 24*Hd1*sz*(Hd0 + Hd1*t)*Sin[2*(phi + \[Alpha]0)] - 
         32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*sy*(Hd0 + Hd1*t)*
          Sin[phi + 2*\[Alpha]0] + 2*sy*(Hd0 + Hd1*t)^3*
          Sin[3*phi + 2*\[Alpha]0] + sy*(Hd0 + Hd1*t)^3*
          Sin[3*phi + 4*\[Alpha]0])/ww^2)/256, 3]
 
Subscript[WWeff, 2][t_, t0_] = JesseDoMagnusIntegration[WWeff, 3]
 
Subscript[WWeff, 3][t_, t0_] = JesseDoMagnusIntegration[3, 3]
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
HoldPattern[CommutativeQ[WWeff]] ^= False
 
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
 
Subscript[WWeff, 1][t_, t0_] = 
    ((I/1536)*(t - t0)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         (3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww - 
         48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(t + t0)) - 
         32*(2*Hd0 + Hd1*(t + t0))*ww^2)*Cos[phi] - 
       16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         2*(3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww)*
        Cos[2*(phi + \[Alpha]0)] + 
       3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(t + t0)) - 
           4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(t + t0))*ww)*
          Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(t + t0))*
          Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
         3*Hd0^2*Hd1*sx*t*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*t0*
          Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
         6*Hd0^2*Hd1*sy*t*Sin[phi] + 6*Hd0^2*Hd1*sy*t0*Sin[phi] - 
         128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*t*ww^2*Sin[phi] - 
         64*Hd1*sy*t0*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*t*Sin[2*(phi + \[Alpha]0)] - 
         24*Hd1^2*sz*t0*Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
          Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 
         16*Delta^2*Hd1*sy*t*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*t0*
          Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
         64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t*ww*
          Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t0*ww*
          Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
         6*Hd0^2*Hd1*sy*t*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*t0*
          Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(t + t0))*
          Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[WWeff, 2][t_, t0_] = ((-I/768)*Hd1*(t - t0)^3*
      (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 
       4*Hd1*sz*Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
        Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
       8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/
     ww
 
Subscript[WWeff, 3][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Hefflinbar[tb_, ta_] = (-16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(ta + tb)) - 
        (3*Hd0^2 + 3*Hd0*Hd1*(ta + tb) + Hd1^2*(ta^2 + ta*tb + tb^2))*ww - 
        48*Delta*ww^2) - 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(ta + tb)) - 
        32*(2*Hd0 + Hd1*(ta + tb))*ww^2)*Cos[phi] + 
      16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(ta + tb)) - 
        2*(3*Hd0^2 + 3*Hd0*Hd1*(ta + tb) + Hd1^2*(ta^2 + ta*tb + tb^2))*ww)*
       Cos[2*(phi + \[Alpha]0)] + 2*Hd1*(ta - tb)^2*ww*
       (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 4*Hd1*sz*
         Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
         Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
        Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
        8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
        Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*
         Sin[3*phi + 2*\[Alpha]0]) - 
      3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(ta + tb)) - 
          4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(ta + tb))*ww)*
         Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(ta + tb))*
         Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
        3*Hd0^2*Hd1*sx*ta*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*tb*
         Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
        6*Hd0^2*Hd1*sy*ta*Sin[phi] + 6*Hd0^2*Hd1*sy*tb*Sin[phi] - 
        128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*ta*ww^2*Sin[phi] - 
        64*Hd1*sy*tb*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
        24*Hd1^2*sz*ta*Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*tb*
         Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] - 
        32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*ta*
         Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*tb*
         Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
        64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*ta*ww*
         Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*tb*ww*
         Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
        6*Hd0^2*Hd1*sy*ta*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*tb*
         Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(ta + tb))*
         Sin[3*phi + 4*\[Alpha]0]))/(1536*ww^2)
 
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
 
Subscript[WWeff, 1][t_, t0_] = 
    ((I/1536)*(t - t0)*(16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         (3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww - 
         48*Delta*ww^2) + 6*sx*(Hd0^2*(2*Hd0 + 3*Hd1*(t + t0)) - 
         32*(2*Hd0 + Hd1*(t + t0))*ww^2)*Cos[phi] - 
       16*sz*(3*Delta*Hd0*(Hd0 + Hd1*(t + t0)) - 
         2*(3*Hd0^2 + 3*Hd0*Hd1*(t + t0) + Hd1^2*(t^2 + t*t0 + t0^2))*ww)*
        Cos[2*(phi + \[Alpha]0)] + 
       3*(16*(4*Delta*Hd1*sy + Delta^2*sx*(2*Hd0 + Hd1*(t + t0)) - 
           4*Hd1*sy*ww - 2*Delta*sx*(2*Hd0 + Hd1*(t + t0))*ww)*
          Cos[phi + 2*\[Alpha]0] - 2*Hd0^2*sx*(2*Hd0 + 3*Hd1*(t + t0))*
          Cos[3*phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] + 
         3*Hd0^2*Hd1*sx*t*Cos[3*phi + 4*\[Alpha]0] + 3*Hd0^2*Hd1*sx*t0*
          Cos[3*phi + 4*\[Alpha]0] + 4*Hd0^3*sy*Sin[phi] + 
         6*Hd0^2*Hd1*sy*t*Sin[phi] + 6*Hd0^2*Hd1*sy*t0*Sin[phi] - 
         128*Hd0*sy*ww^2*Sin[phi] - 64*Hd1*sy*t*ww^2*Sin[phi] - 
         64*Hd1*sy*t0*ww^2*Sin[phi] - 48*Hd0*Hd1*sz*
          Sin[2*(phi + \[Alpha]0)] - 24*Hd1^2*sz*t*Sin[2*(phi + \[Alpha]0)] - 
         24*Hd1^2*sz*t0*Sin[2*(phi + \[Alpha]0)] + 64*Delta*Hd1*sx*
          Sin[phi + 2*\[Alpha]0] - 32*Delta^2*Hd0*sy*Sin[phi + 2*\[Alpha]0] - 
         16*Delta^2*Hd1*sy*t*Sin[phi + 2*\[Alpha]0] - 16*Delta^2*Hd1*sy*t0*
          Sin[phi + 2*\[Alpha]0] - 64*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] + 
         64*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t*ww*
          Sin[phi + 2*\[Alpha]0] + 32*Delta*Hd1*sy*t0*ww*
          Sin[phi + 2*\[Alpha]0] - 4*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] - 
         6*Hd0^2*Hd1*sy*t*Sin[3*phi + 2*\[Alpha]0] - 6*Hd0^2*Hd1*sy*t0*
          Sin[3*phi + 2*\[Alpha]0] - Hd0^2*sy*(2*Hd0 + 3*Hd1*(t + t0))*
          Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[WWeff, 2][t_, t0_] = ((-I/768)*Hd1*(t - t0)^3*
      (sy*(Hd0^2 - 16*Delta*ww)*Cos[phi] + 
       4*Hd1*sz*Cos[2*(phi + \[Alpha]0)] - (8*Delta^2 + Hd0^2)*sy*
        Cos[phi + 2*\[Alpha]0] - Hd0^2*sy*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi] + 16*Delta*sx*ww*Sin[phi] - 
       8*Delta^2*sx*Sin[phi + 2*\[Alpha]0] - 
       Hd0^2*sx*Sin[phi + 2*\[Alpha]0] + Hd0^2*sx*Sin[3*phi + 2*\[Alpha]0]))/
     ww
 
Subscript[WWeff, 3][t_, t0_] = 0
 
HoldPattern[CommutativeQ[WWeff]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False

Hefflinbar[tb_, ta_] = (I*Subscript[WWeff, 1][tb, ta])/(-ta + tb)
 
Attributes[Subscript] = {NHoldRest}
 
Subscript[WWsimple, 1][t_, t0_] = 
    ((I/32)*Null*(2*inv[sx*Cos[t*ww] - sy*Sin[t*ww]]*
        (sy**sy*Sin[t*ww]*(2*(Hd0 + Hd1*t)*ww*Cos[2*t*ww] - 
           Hd1*Sin[2*t*ww]) - Cos[t*ww]*sx**sx*(Hd1*Cos[2*t*ww] + 
           2*ww*(t*(2*Hd0 + Hd1*t)*ww + (Hd0 + Hd1*t)*Sin[2*t*ww])) + 
         sx*sy*(-2*(Hd0 + Hd1*t)*ww*Cos[3*t*ww] + 2*t*(2*Hd0 + Hd1*t)*ww^2*
            Sin[t*ww] + Hd1*Sin[3*t*ww])) + 
       inv[sx*Cos[t0*ww] - sy*Sin[t0*ww]]*
        (4*sx*sy*ww*((Hd0 + Hd1*t0)*Cos[3*t0*ww] - t0*(2*Hd0 + Hd1*t0)*ww*
            Sin[t0*ww]) + 2*sy**sy*Sin[t0*ww]*(-2*(Hd0 + Hd1*t0)*ww*
            Cos[2*t0*ww] + Hd1*Sin[2*t0*ww]) + 2*Cos[t0*ww]*sx**sx*
          (Hd1*Cos[2*t0*ww] + 2*ww*(t0*(2*Hd0 + Hd1*t0)*ww + 
             (Hd0 + Hd1*t0)*Sin[2*t0*ww])) - 2*Hd1*sx*sy*Sin[3*t0*ww])))/ww^2
 
HoldPattern[CommutativeQ[WWsimple]] ^= False
 
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
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[inv]] ^= False
 
(NonCommutativeMultiply`Private`b___)**(NonCommutativeMultiply`Private`a_)**
     inv[NonCommutativeMultiply`Private`a_]**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**
     inv[NonCommutativeMultiply`Private`a_]**
     (NonCommutativeMultiply`Private`a_)**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**(NonCommutativeMultiply`Private`a__)**
     inv[NonCommutativeMultiply[NonCommutativeMultiply`Private`a__]]**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**inv[NonCommutativeMultiply[
       NonCommutativeMultiply`Private`a__]]**
     (NonCommutativeMultiply`Private`a__)**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
SetOptions[inv, OptionsPattern[NonCommutativeMultiply`Private`$inv]] ^:= 
    If[OptionValue[Distribute], 
     inv /: inv[(NonCommutativeMultiply`Private`a_)**
          (NonCommutativeMultiply`Private`b_)**
          (NonCommutativeMultiply`Private`c___)] := 
        inv[NonCommutativeMultiply`Private`b**
           NonCommutativeMultiply`Private`c]**
         inv[NonCommutativeMultiply`Private`a]; 
      SetOptions[NonCommutativeMultiply`Private`$inv, Distribute -> True]; , 
     Quiet[TagUnset[inv, inv[(NonCommutativeMultiply`Private`a_)**
           (NonCommutativeMultiply`Private`b_)**
           (NonCommutativeMultiply`Private`c___)]]; 
        SetOptions[NonCommutativeMultiply`Private`$inv, 
         Distribute -> False]; , {TagUnset::norep, Unset::norep}]; ]
 
inv[(NonCommutativeMultiply`Private`a_)?CommutativeQ] := 
    NonCommutativeMultiply`Private`a^(-1)
 
inv[(NonCommutativeMultiply`Private`a_)?NumberQ] := 
    1/NonCommutativeMultiply`Private`a
 
inv[inv[NonCommutativeMultiply`Private`a_]] := 
    NonCommutativeMultiply`Private`a
 
inv[NonCommutativeMultiply`Private`a_Times] := 
    inv /@ NonCommutativeMultiply`Private`a
 
MakeBoxes[inv[a_], fmt_] ^:= SuperscriptBox[Parenthesize[a, fmt, Power, 
      Left], -1]
 
Options[inv] := Options[NonCommutativeMultiply`Private`$inv]
 
inv /: inv::usage = "inv[expr] is the 2-sided inverse of expression \
expr.\n\nIf Options[inv, Distrubute] is False (the default) then\n\n    \
inv[a**b]\n\nreturns inv[a**a]. Conversely, if Options[inv, Distrubute] is \
True then it returns inv[b]**inv[a]."
 
HoldPattern[CommutativeQ[NonCommutativeMultiply]] ^= False
 
NonCommutativeMultiply[] := 1
 
(NonCommutativeMultiply`Private`a___)**(NonCommutativeMultiply[
      NonCommutativeMultiply`Private`b__])**
     (NonCommutativeMultiply`Private`c___) := 
    NonCommutativeMultiply`Private`a**NonCommutativeMultiply`Private`b**
     NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`a___)**((NonCommutativeMultiply`Private`c_)*
      (NonCommutativeMultiply`Private`b_)?CommutativeQ)**
     (NonCommutativeMultiply`Private`d___) := 
    NonCommutativeMultiply`Private`b*NonCommutativeMultiply`Private`a**
      NonCommutativeMultiply`Private`c**NonCommutativeMultiply`Private`d
 
(NonCommutativeMultiply`Private`a___)**(NonCommutativeMultiply`Private`b_)?
      CommutativeQ**(NonCommutativeMultiply`Private`c___) := 
    NonCommutativeMultiply`Private`b*NonCommutativeMultiply`Private`a**
      NonCommutativeMultiply`Private`c
 
NonCommutativeMultiply[(NonCommutativeMultiply`Private`f_)[
       NonCommutativeMultiply`Private`a__]] /; 
      !NonCommutativeMultiply`Private`NCPatternQ[
       NonCommutativeMultiply`Private`f] := NonCommutativeMultiply`Private`f[
     NonCommutativeMultiply`Private`a]
 
NonCommutativeMultiply[NonCommutativeMultiply`Private`a_Symbol] := 
    NonCommutativeMultiply`Private`a
 
(NonCommutativeMultiply`Private`n___)**rt[NonCommutativeMultiply`Private`m_]**
     rt[NonCommutativeMultiply`Private`m_]**
     (NonCommutativeMultiply`Private`l___) := 
    NonCommutativeMultiply`Private`n**NonCommutativeMultiply`Private`m**
     NonCommutativeMultiply`Private`l
 
NonCommutativeMultiply`Private`NCPatternQ[Blank] = True
 
NonCommutativeMultiply`Private`NCPatternQ[BlankNullSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[BlankSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[Pattern] = True
 
NonCommutativeMultiply`Private`NCPatternQ[Slot] = True
 
NonCommutativeMultiply`Private`NCPatternQ[SlotSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[_] = False
 
HoldPattern[CommutativeQ[rt]] ^= False
 
rt[(NonCommutativeMultiply`Private`c_)?NumberQ] := 
    Sqrt[NonCommutativeMultiply`Private`c]
 
rt[(NonCommutativeMultiply`Private`a_)?CommutativeQ] := 
    Sqrt[NonCommutativeMultiply`Private`a]
 
rt[NonCommutativeMultiply`Private`a_Times] := 
    rt /@ NonCommutativeMultiply`Private`a
 
MakeBoxes[rt[a_], fmt_] ^:= SuperscriptBox[Parenthesize[a, fmt, Superscript, 
      Left], MakeBoxes[1/2, fmt]]
 
rt /: rt::usage = "rt[expr] is the root of expression expr."
 
Attributes[MakeBoxes] = {HoldAllComplete}
 
MakeBoxes[Notation`Private`expr_, Notation`Private`form_] := 
    With[{Notation`Private`boxes = NotationMakeBoxes[Notation`Private`expr, 
        Notation`Private`form]}, Notation`Private`boxes /; 
      Head[Notation`Private`boxes] =!= NotationMakeBoxes]
 
Attributes[NotationMakeBoxes] = {HoldAllComplete}
 
NotationMakeBoxes[HoldPattern[ParsedBoxWrapper][Notation`Private`boxes__], 
     Notation`Private`anyForm_] := TemplateBox[{Notation`Private`boxes}, 
     "NotationTemplateTag"]
 
NotationMakeBoxes /: NotationMakeBoxes::usage = 
     "NotationMakeBoxes is a private version of MakeBoxes."
 
HoldPattern[CommutativeQ[a]] ^= False
 
Attributes[Superscript] = {NHoldRest, ReadProtected}
 
Options[NonCommutativeMultiply`Private`$inv] = {Distribute -> False}
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False

Hefflinbar[tb_, ta_] = (I*Subscript[WWeff, 1][tb, ta])/(-ta + tb)
 
Attributes[Subscript] = {NHoldRest}
 
Subscript[WWsimple, 1][t_, t0_] = 
    ((I/32)*Null*(2*inv[sx*Cos[t*ww] - sy*Sin[t*ww]]*
        (sy**sy*Sin[t*ww]*(2*(Hd0 + Hd1*t)*ww*Cos[2*t*ww] - 
           Hd1*Sin[2*t*ww]) - Cos[t*ww]*sx**sx*(Hd1*Cos[2*t*ww] + 
           2*ww*(t*(2*Hd0 + Hd1*t)*ww + (Hd0 + Hd1*t)*Sin[2*t*ww])) + 
         sx*sy*(-2*(Hd0 + Hd1*t)*ww*Cos[3*t*ww] + 2*t*(2*Hd0 + Hd1*t)*ww^2*
            Sin[t*ww] + Hd1*Sin[3*t*ww])) + 
       inv[sx*Cos[t0*ww] - sy*Sin[t0*ww]]*
        (4*sx*sy*ww*((Hd0 + Hd1*t0)*Cos[3*t0*ww] - t0*(2*Hd0 + Hd1*t0)*ww*
            Sin[t0*ww]) + 2*sy**sy*Sin[t0*ww]*(-2*(Hd0 + Hd1*t0)*ww*
            Cos[2*t0*ww] + Hd1*Sin[2*t0*ww]) + 2*Cos[t0*ww]*sx**sx*
          (Hd1*Cos[2*t0*ww] + 2*ww*(t0*(2*Hd0 + Hd1*t0)*ww + 
             (Hd0 + Hd1*t0)*Sin[2*t0*ww])) - 2*Hd1*sx*sy*Sin[3*t0*ww])))/ww^2
 
HoldPattern[CommutativeQ[WWsimple]] ^= False
 
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
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[inv]] ^= False
 
(NonCommutativeMultiply`Private`b___)**(NonCommutativeMultiply`Private`a_)**
     inv[NonCommutativeMultiply`Private`a_]**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**
     inv[NonCommutativeMultiply`Private`a_]**
     (NonCommutativeMultiply`Private`a_)**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**(NonCommutativeMultiply`Private`a__)**
     inv[NonCommutativeMultiply[NonCommutativeMultiply`Private`a__]]**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`b___)**inv[NonCommutativeMultiply[
       NonCommutativeMultiply`Private`a__]]**
     (NonCommutativeMultiply`Private`a__)**
     (NonCommutativeMultiply`Private`c___) ^:= 
    NonCommutativeMultiply`Private`b**NonCommutativeMultiply`Private`c
 
SetOptions[inv, OptionsPattern[NonCommutativeMultiply`Private`$inv]] ^:= 
    If[OptionValue[Distribute], 
     inv /: inv[(NonCommutativeMultiply`Private`a_)**
          (NonCommutativeMultiply`Private`b_)**
          (NonCommutativeMultiply`Private`c___)] := 
        inv[NonCommutativeMultiply`Private`b**
           NonCommutativeMultiply`Private`c]**
         inv[NonCommutativeMultiply`Private`a]; 
      SetOptions[NonCommutativeMultiply`Private`$inv, Distribute -> True]; , 
     Quiet[TagUnset[inv, inv[(NonCommutativeMultiply`Private`a_)**
           (NonCommutativeMultiply`Private`b_)**
           (NonCommutativeMultiply`Private`c___)]]; 
        SetOptions[NonCommutativeMultiply`Private`$inv, 
         Distribute -> False]; , {TagUnset::norep, Unset::norep}]; ]
 
inv[(NonCommutativeMultiply`Private`a_)?CommutativeQ] := 
    NonCommutativeMultiply`Private`a^(-1)
 
inv[(NonCommutativeMultiply`Private`a_)?NumberQ] := 
    1/NonCommutativeMultiply`Private`a
 
inv[inv[NonCommutativeMultiply`Private`a_]] := 
    NonCommutativeMultiply`Private`a
 
inv[NonCommutativeMultiply`Private`a_Times] := 
    inv /@ NonCommutativeMultiply`Private`a
 
MakeBoxes[inv[a_], fmt_] ^:= SuperscriptBox[Parenthesize[a, fmt, Power, 
      Left], -1]
 
Options[inv] := Options[NonCommutativeMultiply`Private`$inv]
 
inv /: inv::usage = "inv[expr] is the 2-sided inverse of expression \
expr.\n\nIf Options[inv, Distrubute] is False (the default) then\n\n    \
inv[a**b]\n\nreturns inv[a**a]. Conversely, if Options[inv, Distrubute] is \
True then it returns inv[b]**inv[a]."
 
HoldPattern[CommutativeQ[NonCommutativeMultiply]] ^= False
 
NonCommutativeMultiply[] := 1
 
(NonCommutativeMultiply`Private`a___)**(NonCommutativeMultiply[
      NonCommutativeMultiply`Private`b__])**
     (NonCommutativeMultiply`Private`c___) := 
    NonCommutativeMultiply`Private`a**NonCommutativeMultiply`Private`b**
     NonCommutativeMultiply`Private`c
 
(NonCommutativeMultiply`Private`a___)**((NonCommutativeMultiply`Private`c_)*
      (NonCommutativeMultiply`Private`b_)?CommutativeQ)**
     (NonCommutativeMultiply`Private`d___) := 
    NonCommutativeMultiply`Private`b*NonCommutativeMultiply`Private`a**
      NonCommutativeMultiply`Private`c**NonCommutativeMultiply`Private`d
 
(NonCommutativeMultiply`Private`a___)**(NonCommutativeMultiply`Private`b_)?
      CommutativeQ**(NonCommutativeMultiply`Private`c___) := 
    NonCommutativeMultiply`Private`b*NonCommutativeMultiply`Private`a**
      NonCommutativeMultiply`Private`c
 
NonCommutativeMultiply[(NonCommutativeMultiply`Private`f_)[
       NonCommutativeMultiply`Private`a__]] /; 
      !NonCommutativeMultiply`Private`NCPatternQ[
       NonCommutativeMultiply`Private`f] := NonCommutativeMultiply`Private`f[
     NonCommutativeMultiply`Private`a]
 
NonCommutativeMultiply[NonCommutativeMultiply`Private`a_Symbol] := 
    NonCommutativeMultiply`Private`a
 
(NonCommutativeMultiply`Private`n___)**rt[NonCommutativeMultiply`Private`m_]**
     rt[NonCommutativeMultiply`Private`m_]**
     (NonCommutativeMultiply`Private`l___) := 
    NonCommutativeMultiply`Private`n**NonCommutativeMultiply`Private`m**
     NonCommutativeMultiply`Private`l
 
NonCommutativeMultiply`Private`NCPatternQ[Blank] = True
 
NonCommutativeMultiply`Private`NCPatternQ[BlankNullSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[BlankSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[Pattern] = True
 
NonCommutativeMultiply`Private`NCPatternQ[Slot] = True
 
NonCommutativeMultiply`Private`NCPatternQ[SlotSequence] = True
 
NonCommutativeMultiply`Private`NCPatternQ[_] = False
 
HoldPattern[CommutativeQ[rt]] ^= False
 
rt[(NonCommutativeMultiply`Private`c_)?NumberQ] := 
    Sqrt[NonCommutativeMultiply`Private`c]
 
rt[(NonCommutativeMultiply`Private`a_)?CommutativeQ] := 
    Sqrt[NonCommutativeMultiply`Private`a]
 
rt[NonCommutativeMultiply`Private`a_Times] := 
    rt /@ NonCommutativeMultiply`Private`a
 
MakeBoxes[rt[a_], fmt_] ^:= SuperscriptBox[Parenthesize[a, fmt, Superscript, 
      Left], MakeBoxes[1/2, fmt]]
 
rt /: rt::usage = "rt[expr] is the root of expression expr."
 
Attributes[MakeBoxes] = {HoldAllComplete}
 
MakeBoxes[Notation`Private`expr_, Notation`Private`form_] := 
    With[{Notation`Private`boxes = NotationMakeBoxes[Notation`Private`expr, 
        Notation`Private`form]}, Notation`Private`boxes /; 
      Head[Notation`Private`boxes] =!= NotationMakeBoxes]
 
Attributes[NotationMakeBoxes] = {HoldAllComplete}
 
NotationMakeBoxes[HoldPattern[ParsedBoxWrapper][Notation`Private`boxes__], 
     Notation`Private`anyForm_] := TemplateBox[{Notation`Private`boxes}, 
     "NotationTemplateTag"]
 
NotationMakeBoxes /: NotationMakeBoxes::usage = 
     "NotationMakeBoxes is a private version of MakeBoxes."
 
HoldPattern[CommutativeQ[a]] ^= False
 
Attributes[Superscript] = {NHoldRest, ReadProtected}
 
Options[NonCommutativeMultiply`Private`$inv] = {Distribute -> False}
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
