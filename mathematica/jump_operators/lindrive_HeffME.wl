

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
    ((-I/256)*(t - t0)*(-8*Delta*H1^2*sz + 8*H1^2*sz*ww + 128*Delta*sz*ww^2 - 
       2*H1*sx*(H1^2 - 32*ww^2)*Cos[phi] + 8*H1^2*sz*(Delta - 2*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*H1*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*H1D*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*H1*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*H1D*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       2*H1^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       H1^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*H1^3*sy*Sin[phi] + 
       64*H1*sy*ww^2*Sin[phi] + 24*H1*H1D*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*H1D*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*H1*sy*
        Sin[phi + 2*\[Alpha]0] + 32*H1D*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*H1*sy*ww*Sin[phi + 2*\[Alpha]0] + 
       2*H1^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       H1^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    ((t - t0)*(6 + 3*(2 + t + 3*t0)*ww + (6 + 2*t^2 + 9*t0 + 11*t0^2 + 
         t*(3 + 5*t0))*ww^2)*MapThread[
       If[#1, S[#2], If[#2 != 0, trimmedCoeffs$3117++]; 0] & , 
       {{{{True, True, True}, {True, True, False}, {True, False, False}}, 
         {{True, True, False}, {True, False, False}, {False, False, False}}, 
         {{True, False, False}, {False, False, False}, {False, False, 
           False}}}, {}}, 3])/(6*ww^2)
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
S = Simplify
 
Attributes[trimmedCoeffs$3117] = {Temporary}
 
trimmedCoeffs$3117 = 66
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
    ((-I/256)*(t - t0)*(-8*Delta*H1^2*sz + 8*H1^2*sz*ww + 128*Delta*sz*ww^2 - 
       2*H1*sx*(H1^2 - 32*ww^2)*Cos[phi] + 8*H1^2*sz*(Delta - 2*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*H1*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*H1D*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*H1*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*H1D*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       2*H1^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       H1^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*H1^3*sy*Sin[phi] + 
       64*H1*sy*ww^2*Sin[phi] + 24*H1*H1D*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*H1D*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*H1*sy*
        Sin[phi + 2*\[Alpha]0] + 32*H1D*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*H1*sy*ww*Sin[phi + 2*\[Alpha]0] + 
       2*H1^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       H1^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    ((t - t0)*(6 + 3*(2 + t + 3*t0)*ww + (6 + 2*t^2 + 9*t0 + 11*t0^2 + 
         t*(3 + 5*t0))*ww^2)*MapThread[
       If[#1, S[#2], If[#2 != 0, trimmedCoeffs$3117++]; 0] & , 
       {{{{True, True, True}, {True, True, False}, {True, False, False}}, 
         {{True, True, False}, {True, False, False}, {False, False, False}}, 
         {{True, False, False}, {False, False, False}, {False, False, 
           False}}}, {}}, 3])/(6*ww^2)
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
 
S = Simplify
 
Attributes[trimmedCoeffs$3117] = {Temporary}
 
trimmedCoeffs$3117 = 66
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
    ((-I/256)*(t - t0)*(-8*Delta*Hd0^2*sz + 8*Hd0^2*sz*ww + 
       8*Hd0*Hd1*sz*t*ww + 8*Hd0*Hd1*sz*t0*ww + 128*Delta*sz*ww^2 - 
       2*sx*(Hd0^3 - 32*Hd0*ww^2 - 16*Hd1*(t + t0)*ww^2)*Cos[phi] + 
       8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(t + t0))*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] + 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
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
    ((-I/256)*(t - t0)*(-8*Delta*Hd0^2*sz + 8*Hd0^2*sz*ww + 
       8*Hd0*Hd1*sz*t*ww + 8*Hd0*Hd1*sz*t0*ww + 128*Delta*sz*ww^2 - 
       2*sx*(Hd0^3 - 32*Hd0*ww^2 - 16*Hd1*(t + t0)*ww^2)*Cos[phi] + 
       8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(t + t0))*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] + 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
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
    ((-I/256)*(t - t0)*(-8*Delta*Hd0^2*sz + 8*Hd0^2*sz*ww + 
       8*Hd0*Hd1*sz*t*ww + 8*Hd0*Hd1*sz*t0*ww + 128*Delta*sz*ww^2 - 
       2*sx*(Hd0^3 - 32*Hd0*ww^2 - 16*Hd1*(t + t0)*ww^2)*Cos[phi] + 
       8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(t + t0))*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] + 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
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
    ((-I/256)*(t - t0)*(-8*Delta*Hd0^2*sz + 8*Hd0^2*sz*ww + 
       8*Hd0*Hd1*sz*t*ww + 8*Hd0*Hd1*sz*t0*ww + 128*Delta*sz*ww^2 - 
       2*sx*(Hd0^3 - 32*Hd0*ww^2 - 16*Hd1*(t + t0)*ww^2)*Cos[phi] + 
       8*Hd0*sz*(Delta*Hd0 - 2*(Hd0 + Hd1*(t + t0))*ww)*
        Cos[2*(phi + \[Alpha]0)] - 16*Delta^2*Hd0*sx*Cos[phi + 2*\[Alpha]0] - 
       32*Delta*Hd1*sy*Cos[phi + 2*\[Alpha]0] + 32*Delta*Hd0*sx*ww*
        Cos[phi + 2*\[Alpha]0] + 32*Hd1*sy*ww*Cos[phi + 2*\[Alpha]0] + 
       16*Delta*Hd1*sx*t*ww*Cos[phi + 2*\[Alpha]0] + 16*Delta*Hd1*sx*t0*ww*
        Cos[phi + 2*\[Alpha]0] + 2*Hd0^3*sx*Cos[3*phi + 2*\[Alpha]0] - 
       Hd0^3*sx*Cos[3*phi + 4*\[Alpha]0] - 2*Hd0^3*sy*Sin[phi] + 
       64*Hd0*sy*ww^2*Sin[phi] + 32*Hd1*sy*t*ww^2*Sin[phi] + 
       32*Hd1*sy*t0*ww^2*Sin[phi] + 24*Hd0*Hd1*sz*Sin[2*(phi + \[Alpha]0)] - 
       32*Delta*Hd1*sx*Sin[phi + 2*\[Alpha]0] + 16*Delta^2*Hd0*sy*
        Sin[phi + 2*\[Alpha]0] + 32*Hd1*sx*ww*Sin[phi + 2*\[Alpha]0] - 
       32*Delta*Hd0*sy*ww*Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t*ww*
        Sin[phi + 2*\[Alpha]0] - 16*Delta*Hd1*sy*t0*ww*
        Sin[phi + 2*\[Alpha]0] + 2*Hd0^3*sy*Sin[3*phi + 2*\[Alpha]0] + 
       Hd0^3*sy*Sin[3*phi + 4*\[Alpha]0]))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 
    (I/48)*Delta*Hd1*(t - t0)^3*(sy*Cos[phi] - sx*Sin[phi])
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
