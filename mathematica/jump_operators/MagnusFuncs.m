(* ::Package:: *)

(* ::Text:: *)
(*General definitions*)


S=Simplify;
FS=FullSimplify;
MF=MatrixForm;
<<NC`;
<<NCAlgebra`;

Off[General::spell1];
Off[MatrixExp::eivn]

tc=Pi/ww;


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


(* ::Text:: *)
(*Magnus functions*)


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
		pickedCoeffs = MapThread[If[#1,#2 // S,If[#2=!=0,trimmedCoeffs++]; 0]&,{desiredCoeffs,cl},numsym];
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
		


(* Determine the terms in the Magnus expansion recursively, based on equation (21) from  *)
JesseGetMagnusIntegrands[Ham_,METerms_,order_] := 
	Module[{\[Lambda], HH, ME, nestedCommutators, magnusDECoeff, magnusDETerms, magnusDE},
	SetNonCommutative[HH,ME];
	SetNonCommutative[Ham, METerms];
	SetCommutative[\[Lambda]];
	
	(* create a list of (order) nested commutators, including the first separate Hamiltonian term *)
	(* i.e. {H, [\[CapitalOmega],H], [\[CapitalOmega],[\[CapitalOmega],H]], [\[CapitalOmega],[\[CapitalOmega],[\[CapitalOmega],H]]]} *)
	nestedCommutators = FoldList[ Commutator[#2,#1]& , Join[{HH},ConstantArray[ME,order-1]]];
	(* specify coefficients in the Magnus \[CapitalOmega] differential equation (eq. 21 in the pedadagogical paper)*)
	magnusDECoeff[k_] := (*((-1)^k)**)BernoulliB[k]/Factorial[k];
	(* write down the Magnus \[CapitalOmega] DE terms and plug in the Magnus expansion in \[Lambda] *)
	magnusDETerms = Array[magnusDECoeff,order,0]*nestedCommutators /. {HH -> -I*Ham, ME -> \!\(
\*UnderoverscriptBox[\(\[Sum]\), \(s = 1\), \(order\)]\(
\*SuperscriptBox[\(\[Lambda]\), \(s\)] 
\(\*SubscriptBox[\(METerms\), \(s\)]\)[t, t0]\)\)};
	(* sum the terms, collect coefficients in \[Lambda] up to (order) and return *)
	magnusDE = Apply[Plus,magnusDETerms] // NCE;
	Return[CoefficientList[magnusDE, \[Lambda], order]];
];


JesseDoMagnusIntegration[MEIntegrand_,maxOrder_] := 
	Module[{workpiece},
	Print["\n* Begin integrating the next Magnus integrand, at date and time ", Date[][[1 ;; 5]]];
	workpiece = MEIntegrand //. SigmaComRules;
	Print["SigmaComRules Done:  ", Date[][[4 ;; 5]]];
	workpiece = JesseGrim[workpiece, {1/ww, t, t0}, maxOrder];
	Print["Trimming Done:  ", Date[][[4 ;; 5]]];

	workpiece = workpiece /. t->tt;
	workpiece = Integrate[workpiece, {tt, t0, t}];
	Print["Integration from `t0' to `t' done:  ", Date[][[4 ;; 5]]];   
	workpiece = JesseGrim[workpiece, {1/ww, t, t0}, maxOrder + 1];
	Print["Post-integration trim done:  ", Date[][[4 ;; 5]]];
	Return[workpiece];
];


(* Get \[CapitalOmega]\[CapitalOmega](t,t0) may output (depending on \
lastTrue/False)
Subscript[\[CapitalOmega]\[CapitalOmega], order](t,t0) 
or
Subscript[Omega, order](t0)
(maximal coefficient ~ 1/ww^maxOmega)
 *)

GetOOnope[order_, maxOmega_, MEterms_] := Module[{fn, Omega, OO},
  Print["\n Begin calculating \!\(\*SubscriptBox[\(\[CapitalOmega]\
\[CapitalOmega]\), \(k\)]\)[t,t0] of Magnus Expansion \
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
