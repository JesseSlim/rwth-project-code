(* ::Package:: *)

S=Simplify;
FS=FullSimplify;
MF=MatrixForm;
<<NC`;
<<NCAlgebra`;

Off[General::spell1];
Off[MatrixExp::eivn]

tc=Pi/ww;

(* Trims polynomials (in x1, x2, x3) in a smart way.  
Keep terms up to maximum power of "tot", that is, terms of the form
x1^p1x2^p2x3^p3
s.t. p1 + p2 + p3 \[LessEqual] tot
 *)
JesseGrim[input_,symbols_,tot_]:=
	Module[{numsym, cl, desiredCoeffs, pickedCoeffs, factors, result, trimmedCoeffs},
		numsym = Length[symbols];
		cl = CoefficientList[input, symbols, ConstantArray[tot+1, numsym]];
		(* create a nested array of the same form as the CoefficientList that specifies whether each coefficient is 'desired',
		i.e that it satisfies the maximum power constraint *)
		desiredCoeffs = Table[
			Apply[Plus,Array[coeff,numsym]] <= tot,
			Evaluate[Sequence@@Table[{coeff[iii],0,tot},{iii,numsym}]]
		];
		trimmedCoeffs = 0;
		(* now we actually pick the desired coefficients, and replace the undesired ones by zero *)
		(* let's do some simplification on the coefficients for good measure *)
		pickedCoeffs = MapThread[If[#1,#2 // S,If[#2!=0,trimmedCoeffs++]; 0]&,{desiredCoeffs,cl},numsym];
		Print["    > picking and simplifying done:  ", Date[][[4;;5]], "  trimmed coeffs:  ", trimmedCoeffs];

		(* create a nested array of the same form as the CoefficientList that contains the corresponding factors *)
		factors = Table[
			Apply[Times,MapThread[#1^#2&, {symbols,Array[coeff,numsym]} ]],
			Evaluate[Sequence@@Table[{coeff[iii],0,tot},{iii,numsym}]]
		];
		(* assemble the trimmed polynomial *)
		result = Apply[Plus,Flatten[factors*pickedCoeffs]] // S;
		Print["    > assembling and simplifying done: ", Date[][[4;;5]]];
		Return[result];
	];
		


(*Third MagnusM3 for the case that the initial time Subscript[t, 0] \
is not equal to 0, and using commutators properly.*)
(* Assuming NCi \
are already Non-Commutative variables in the Hamiltonian [e.g., sx, \
sy, sz] *)
MagnusM3[Ht_, k_] := Module[{HH, temp, result0, result1},
   (* In: Ht (NC object), k = 1,2,
   3... (order of Magnus Expansion) *)
   (* Out: Coefficient[
   result, \[Lambda]^k] (k-
   th Magnus term Subscript[\[CapitalOmega]\[CapitalOmega], k] (anti-
   Hermitian) as a function of Hamiltonian Ht -- to get Subscript[H, 
   k]*Subscript[t, c], multiply by +\[ImaginaryI]) *)
   
   Clear[x, y, cc, please];
   (* use ``Com'' as commutator *)
   
   SetNonCommutative[HH, please, \[CapitalOmega]\[CapitalOmega], x, y];
   SetCommutative[\[Lambda]];
   (* This should not be needed:  cc[x,y] *)
   (*cc[x_,y_]=x**y-y**
   x;*)
   
   HH = please;
   result0 = \[Lambda] HH;
   
   For[i = 1; temp = HH, i < k, i++,
    (*Print["in the for-loop .."];*)
    
    temp = Commutator[\[CapitalOmega]\[CapitalOmega], temp];
    result0 = result0 + BernoulliB[i]/Factorial[i] \[Lambda]*temp;
    (*Print["in MagnusM3, during the fo-loop.  result0 = ",result0];*)
    ];
   (*result1[\[Lambda]_]:=
   result0/.comm\[Rule]cc/.{\[CapitalOmega]\[CapitalOmega]\[Rule]\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(s = 1\), \(k\)]\(
\*SuperscriptBox[\(\[Lambda]\), \(s\)]
\(\*SubscriptBox[\(\[CapitalOmega]\[CapitalOmega]\), \(s\)]\)[t, t0]\)\)};*)
   (*Print["in MagnusM3, before doom.  result0 = ",
   result0];*)
   
   result1[\[Lambda]_] := 
    result0 /. {\[CapitalOmega]\[CapitalOmega] -> \!\(
\*UnderoverscriptBox[\(\[Sum]\), \(s = 1\), \(k\)]\(
\*SuperscriptBox[\(\[Lambda]\), \(s\)] 
\(\*SubscriptBox[\(\[CapitalOmega]\[CapitalOmega]\), \(s\)]\)[t, t0]\)\)};
   (*Print["in MagnusM3, we are doomed.  result1[\[Lambda]] = ",
   result1[\[Lambda]]];*)
   
   result1 = 
    Series[result1[\[Lambda]] // NCE, {\[Lambda], 0, 
        k}] /. {please -> -I Ht} // Normal;
   (* If you want to double-check the first few terms, realize that, 
   for instance, Subscript[\[CapitalOmega]\[CapitalOmega], 
   1] = -\[ImaginaryI]\[Integral]H (and not +\[ImaginaryI]). *)
   
   
   
   Coefficient[result1 // NCE // Expand, \[Lambda]^k]];


(* ::Text:: *)
(*Definitions regarding non-commutative matrix operations and commutators*)


(* Idea from here (second answer by `evanb')
https://mathematica.stackexchange.com/questions/63811/pull-out-scalars-from-noncommutativemultiply-in-commutator-of-su2-spin-algebra *)

(* lower-case:  (usually) operator,
upper-case:  scalar *)
MatM[a_,a_]:=a.a;
MatM[a_,C_]:=C a /; CommutativeQ[C];
MatM[C_,a_]:=C a /; CommutativeQ[C];

MatM[Plus[a_,addends__],b_]:=MatM[a,b]+MatM[Plus[addends],b];
MatM[a_,Plus[b_,baddends_]]:=MatM[a,b]+MatM[a,Plus[baddends]];
MatM[Times[C_,factors__],b_]:=C MatM[Times[factors],b] /; CommutativeQ[C];
MatM[a_,Times[C_,factors__]]:=C MatM[a,Times[factors]] /; CommutativeQ[C];

(* rules for multiplying sigma-matrices *)
sigma[ii_]:=KroneckerDelta[ii,1]sx+KroneckerDelta[ii,2]sy+KroneckerDelta[ii,3]sz;

SetNonCommutative[sx,sy,sz];
SigmaRules={MatM[sx,sy]->I sz,MatM[sy,sx]->-I sz,MatM[sy,sz]->I sx,MatM[sz,sy]->-I sx,MatM[sz,sx]->I sy,MatM[sx,sz]->-I sy};
SigmaMRules={sx->{{0,1},{1,0}},sy->{{0,-I},{I,0}},sz->{{1,0},{0,-1}}};
SigmaComRules={Commutator[sx,sy]->2I sz,Commutator[sy,sx]->-2I sz,Commutator[sy,sz]->2I sx,Commutator[sz,sy]->-2I sx,Commutator[sz,sx]->2I sy,Commutator[sx,sz]->-2I sy};

SigmaRules={MatM[sx,sy]->I sz,MatM[sy,sx]->-I sz,MatM[sy,sz]->I sx,MatM[sz,sy]->-I sx,MatM[sz,sx]->I sy,MatM[sx,sz]->-I sy};

(* obviously trivial commutators *)
Commutator[xx_,xx_]:=0 ;
Commutator /: Plus[Commutator[xx_,yy_],Commutator[yy_,xx_]] :=0;
(* below: scalars always commute *)
Commutator[xx_,yy_]:=0 /; CommutativeQ[xx];
Commutator[xx_,yy_]:=0 /; CommutativeQ[yy];

(* Linearity *)
Commutator[Plus[a_,addends__],B_]:=Commutator[a,B]+Commutator[Plus[addends],B];
Commutator[A_,Plus[b_,baddends__]]:=Commutator[A,b]+Commutator[A,Plus[baddends]];
Commutator[Times[c_,factors__],B_]:=c Commutator[Times[factors],B] /; CommutativeQ[c];
Commutator[A_,Times[c_,factors__]]:=c Commutator[A,Times[factors]] /; CommutativeQ[c];
(*  *)

(* pull integrals out of the commutator (only works for "definite integrals" I think) *)
Commutator[Integrate[A_,x_],B_]:=Integrate[Commutator[A,B],x];
Commutator[A_,Integrate[B_,x_]]:=Integrate[Commutator[A,B],x];


(* Get \[CapitalOmega]\[CapitalOmega](t,t0) may output (depending on \
lastTrue/False)
Subscript[\[CapitalOmega]\[CapitalOmega], order](t,t0) 
or
Subscript[Omega, order](t0)
(maximal coefficient ~ 1/ww^maxOmega)
 *)

GetOO[order_, maxOmega_, lastTF_] := Module[{fn, Omega, OO},
  Print["\n Begin calculating \!\(\*SubscriptBox[\(\[CapitalOmega]\
\[CapitalOmega]\), \(k\)]\)[t,t0] (or Omega[t0]) of Magnus Expansion \
order k = ", order, ", at date and time ", Date[][[1 ;; 5]]];
  fn[t_] = fxn[t, order] //. SigmaComRules;
  Print["SigmaComRules Done:  ", Date[][[4 ;; 5]]];
  (*Print["fn[t] = ", fn[t]];*)
  
  
  (* this one worked well:
  fn[t_]=Grim[fn[t],1/ww,t,t0,maxOmega]//S;
  *)
  (*Print["fn before grim:  ",fn[t]];*)
  tempo = JesseGrim[fn[t], {1/ww, t, t0}, maxOmega];
  fn[t_] = tempo;
  
  
  Print["Trimming Done:  ", Date[][[4 ;; 5]]];
  fn[t_] = fn[t];
  Print["Simplify of fn OMITTED:  ", Date[][[4 ;; 5]]];
  
  
  If[lastTF == True,
   (* Calculate the actual Magnus Term for a period tc *)
   (*Print[
   "GetOO:  True"];*)
   
   Omega[t0_] = Integrate[fn[tt], {tt, t0, t0 + tc}];
   Print["Integration from `t0' to `t0 + tc' done:  ", 
    Date[][[4 ;; 5]]];
   (*Print[
   "After integration (and before applying 'Grim') we have Omega[t0] \
= ",Omega[t0]];*)
   
   Omega[t0_] = JesseGrim[Omega[t0], {1/ww, tc, t0}, maxOmega + 1];
   Return[Omega[t0]],
   
   
   (* Otherwise Calculate the "intermediate Magnus Term" from time t0 \
to t *)
   (*Print["GetOO:  False"];*)
   
   OO[t_, t0_] = Integrate[fn[tt], {tt, t0, t}];
   Print["Integration from `t0' to `t' done:  ", Date[][[4 ;; 5]]];
   (*this one worked well:
   OO[t_,t0_]=Grim[OO[t,t0],1/ww,t,t0,maxOmega+1]//FS;*)
   
   tempo = JesseGrim[OO[t, t0], {1/ww, t, t0}, maxOmega + 1];
   Print["Post-integration trim done:  ", Date[][[4 ;; 5]]];
   (*Print["(2) After applying Grim, tempo = ",tempo];*)
   
   OO[t_, t0_] = tempo;
   Print["Final Simplify OMITTED:  ", Date[][[4 ;; 5]]];
   Return[OO[t, t0]];
   ];
  Print["Error in GetOO:  Not returning a value."]
  ];
