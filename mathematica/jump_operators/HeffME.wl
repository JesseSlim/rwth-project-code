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
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*H1^2) + H1^2*ww + 16*Delta*ww^2) - 
       2*H1*sx*(H1^2 - 32*ww^2)*Cos[phi] + 8*H1^2*sz*(Delta - 2*ww)*
        Cos[2*(phi + \[Alpha]0)] + H1*(-16*Delta*sx*(Delta - 2*ww)*
          Cos[phi + 2*\[Alpha]0] + 2*H1^2*sx*Cos[3*phi + 2*\[Alpha]0] - 
         H1^2*sx*Cos[3*phi + 4*\[Alpha]0] - 2*H1^2*sy*Sin[phi] + 
         64*sy*ww^2*Sin[phi] + 16*Delta^2*sy*Sin[phi + 2*\[Alpha]0] - 
         32*Delta*sy*ww*Sin[phi + 2*\[Alpha]0] + 2*H1^2*sy*
          Sin[3*phi + 2*\[Alpha]0] + H1^2*sy*Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Heffbarconst[tb_, ta_] = (8*sz*(-(Delta*H1^2) + H1^2*ww + 16*Delta*ww^2) - 
      2*H1*sx*(H1^2 - 32*ww^2)*Cos[phi] + 8*H1^2*sz*(Delta - 2*ww)*
       Cos[2*(phi + \[Alpha]0)] + H1*(-16*Delta*sx*(Delta - 2*ww)*
         Cos[phi + 2*\[Alpha]0] + 2*H1^2*sx*Cos[3*phi + 2*\[Alpha]0] - 
        H1^2*sx*Cos[3*phi + 4*\[Alpha]0] - 2*H1^2*sy*Sin[phi] + 
        64*sy*ww^2*Sin[phi] + 16*Delta^2*sy*Sin[phi + 2*\[Alpha]0] - 
        32*Delta*sy*ww*Sin[phi + 2*\[Alpha]0] + 
        2*H1^2*sy*Sin[3*phi + 2*\[Alpha]0] + 
        H1^2*sy*Sin[3*phi + 4*\[Alpha]0]))/(256*ww^2)
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega], 1][t_, t0_] = 
    ((-I/256)*(t - t0)*(8*sz*(-(Delta*H1^2) + H1^2*ww + 16*Delta*ww^2) - 
       2*H1*sx*(H1^2 - 32*ww^2)*Cos[phi] + 8*H1^2*sz*(Delta - 2*ww)*
        Cos[2*(phi + \[Alpha]0)] + H1*(-16*Delta*sx*(Delta - 2*ww)*
          Cos[phi + 2*\[Alpha]0] + 2*H1^2*sx*Cos[3*phi + 2*\[Alpha]0] - 
         H1^2*sx*Cos[3*phi + 4*\[Alpha]0] - 2*H1^2*sy*Sin[phi] + 
         64*sy*ww^2*Sin[phi] + 16*Delta^2*sy*Sin[phi + 2*\[Alpha]0] - 
         32*Delta*sy*ww*Sin[phi + 2*\[Alpha]0] + 2*H1^2*sy*
          Sin[3*phi + 2*\[Alpha]0] + H1^2*sy*Sin[3*phi + 4*\[Alpha]0])))/ww^2
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 0
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]]] ^= False
 
CommutativeQ[t] ^= True
 
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
    ((-I/32)*(t - t0)*(sz*(H1^2 + 16*Delta*ww) + 
       2*H1*(4*sx*ww*Cos[phi] - H1*sz*Cos[2*(phi + \[Alpha]0)] + 
         2*Delta*sx*Cos[phi + 2*\[Alpha]0] + 4*sy*ww*Sin[phi] - 
         2*Delta*sy*Sin[phi + 2*\[Alpha]0])))/ww
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 0
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sz]] ^= False
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Heffbarconst[tb_, ta_] = (sz*(H1^2 + 16*Delta*ww) + 
      2*H1*(4*sx*ww*Cos[phi] - H1*sz*Cos[2*(phi + \[Alpha]0)] + 
        2*Delta*sx*Cos[phi + 2*\[Alpha]0] + 4*sy*ww*Sin[phi] - 
        2*Delta*sy*Sin[phi + 2*\[Alpha]0]))/(32*ww)
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega], 1][t_, t0_] = 
    ((-I/32)*(t - t0)*(sz*(H1^2 + 16*Delta*ww) + 
       2*H1*(4*sx*ww*Cos[phi] - H1*sz*Cos[2*(phi + \[Alpha]0)] + 
         2*Delta*sx*Cos[phi + 2*\[Alpha]0] + 4*sy*ww*Sin[phi] - 
         2*Delta*sy*Sin[phi + 2*\[Alpha]0])))/ww
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 0
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
Heffbarconst[tb_, ta_] = (sz*(H1^2 + 16*Delta*ww) + 
      2*H1*(4*sx*ww*Cos[phi] - H1*sz*Cos[2*(phi + t0*ww)] + 
        2*Delta*sx*Cos[phi + 2*t0*ww] + 4*sy*ww*Sin[phi] - 
        2*Delta*sy*Sin[phi + 2*t0*ww]))/(32*ww)
 
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
 
Subscript[\[CapitalOmega]\[CapitalOmega], 1][t_, t0_] = 
    ((-I/32)*(t - t0)*(sz*(H1^2 + 16*Delta*ww) + 
       2*H1*(4*sx*ww*Cos[phi] - H1*sz*Cos[2*(phi + \[Alpha]0)] + 
         2*Delta*sx*Cos[phi + 2*\[Alpha]0] + 4*sy*ww*Sin[phi] - 
         2*Delta*sy*Sin[phi + 2*\[Alpha]0])))/ww
 
Subscript[\[CapitalOmega]\[CapitalOmega], 2][t_, t0_] = 0
 
HoldPattern[CommutativeQ[\[CapitalOmega]\[CapitalOmega]]] ^= False
 
CommutativeQ[t] ^= True
 
HoldPattern[CommutativeQ[sx]] ^= False
 
HoldPattern[CommutativeQ[sy]] ^= False
