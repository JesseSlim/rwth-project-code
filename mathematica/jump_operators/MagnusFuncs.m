(* ::Package:: *)

(* ::Text:: *)
(*General definitions*)


S=Simplify;
FS=FullSimplify;
MF=MatrixForm;
<<NC`;
<<NCAlgebra`;

suspSigmaNC = {sx->sxx,sy->syy,sz->szz};
restSigmaNC = {sxx->sx,syy->sy,szz->sz};

factorOut[expr_, factor_,sf_:Cancel] := (sf[(expr/.suspSigmaNC)/(factor/.suspSigmaNC)]/.restSigmaNC)*factor

(*Off[General::spell1];
Off[MatrixExp::eivn]*)

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
(*Commutator[Plus[a_,addends__],B_]:=Commutator[a,B]+Commutator[Plus[addends],B];
Commutator[A_,Plus[b_,baddends__]]:=Commutator[A,b]+Commutator[A,Plus[baddends]];*)
Commutator[Plus[a_,addends__],B_]:=Plus @@ (Commutator[#,B]& /@ {a,addends});
Commutator[A_,Plus[b_,addends__]]:=Plus @@ (Commutator[A,#]& /@ {b,addends});
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
JesseGrim[input_,symbols_,tot_,termwiseSF_:Simplify,totalSF_:FullSimplify]:=
	Module[{numsym, cl, desiredCoeffs, pickedCoeffs, factors, result, trimmedCoeffs},
		numsym = Length[symbols];
		cl = CoefficientList[input, symbols, ConstantArray[tot+1, numsym]];
		(* CoefficientList annoyingly returns an empty list if none of the requested powers can be found,
		causing the rest of the function, which expects in that case a (tot+1)^numsym numsym-D matrix
		filled with zeroes, to throw up *)
		If[cl === {}, 
			cl = ConstantArray[0, ConstantArray[tot+1, numsym]]; 
			Print["    > starting trim with empty coefficient list"];
		];
		(* create a nested array of the same form as the CoefficientList that specifies whether each coefficient is 'desired',
		i.e that it satisfies the maximum power constraint *)
		desiredCoeffs = Table[
			Apply[Plus,Array[coeff,numsym]] <= tot,
			Evaluate[Sequence@@Table[{coeff[iii],0,tot},{iii,numsym}]]
		];
		trimmedCoeffs = 0;
		(* now we actually pick the desired coefficients, and replace the undesired ones by zero *)
		(* let's do some simplification on the coefficients for good measure *)
		pickedCoeffs = MapThread[If[#1,#2 // termwiseSF,If[#2=!=0,trimmedCoeffs++]; 0]&,{desiredCoeffs,cl},numsym];
		Print["    > picking and simplifying done:  ", Date[][[4;;5]], "  trimmed coeffs:  ", trimmedCoeffs];

		(* create a nested array of the same form as the CoefficientList that contains the corresponding factors *)
		factors = Table[
			Apply[Times,MapThread[#1^#2&, {symbols,Array[coeff,numsym]} ]],
			Evaluate[Sequence@@Table[{coeff[iii],0,tot},{iii,numsym}]]
		];
		(* assemble the trimmed polynomial *)
		result = Apply[Plus,Flatten[factors*pickedCoeffs]] // totalSF;
		Print["    > assembling and simplifying done: ", Date[][[4;;5]]];
		Return[result];
	];
		


(* Determine the terms in the Magnus expansion recursively, based on equation (21) from  *)
JesseGetMagnusIntegrands[Ham_,METerms_,order_,printStatusUpdates_:False] := 
	Module[{
		\[Lambda], HH, ME, nestedCommutators, magnusDECoeff, magnusDETerms, magnusDE, result,
		bilinearRulesA, bilinearRulesB, maxLambdaRules
	},
	bilinearRulesA={
		CMTR[A_Plus,B_]:>(CMTR[#,B]&/@A),
		CMTR[A_,B_Plus]:>(CMTR[A,#]&/@B)
	};
	bilinearRulesB={
		CMTR[Times[a_,rest__],B_]:>a CMTR[Times[rest],B]/;CommutativeQ[a],
		CMTR[A_,Times[b_,rest__]]:>b CMTR[A,Times[rest]]/;CommutativeQ[b]
	};
	maxLambdaRules={\[Lambda]^p_ :> 0 /; p > order};

	SetNonCommutative[HH,ME];
	SetNonCommutative[Ham, METerms];
	SetCommutative[\[Lambda]];
	
	If[printStatusUpdates,Print["Starting the calculation of Magnus integrands at ", Date[][[1;;5]]]];
	
	(* create a list of (order) nested commutators, including the first separate Hamiltonian term *)
	(* i.e. {H, [\[CapitalOmega],H], [\[CapitalOmega],[\[CapitalOmega],H]], [\[CapitalOmega],[\[CapitalOmega],[\[CapitalOmega],H]]]} *)
	nestedCommutators = FoldList[ CMTR[#2,#1]& , Join[{HH},ConstantArray[ME,order-1]]];
	If[printStatusUpdates,Print["    > assembling nested commutators done: ", Date[][[4;;5]]]];
	(* specify coefficients in the Magnus \[CapitalOmega] differential equation (eq. 21 in the pedadagogical paper)*)
	magnusDECoeff[k_] := (*((-1)^k)**)BernoulliB[k]/Factorial[k];

	(* write down the Magnus \[CapitalOmega] DE terms and plug in the Magnus expansion in \[Lambda] *)
	magnusDETerms = Array[magnusDECoeff,order,0]*nestedCommutators;
	If[printStatusUpdates,Print["    > assembling terms done: ", Date[][[4;;5]]]];
	magnusDETerms = magnusDETerms /. {HH -> -I*Ham, ME -> \!\(
\*UnderoverscriptBox[\(\[Sum]\), \(s = 1\), \(order\)]\(
\*SuperscriptBox[\(\[Lambda]\), \(s\)] 
\(\*SubscriptBox[\(METerms\), \(s\)]\)[t, t0]\)\)};
	If[printStatusUpdates,Print["    > substituting series done: ", Date[][[4;;5]]]];

	magnusDETerms = magnusDETerms //. bilinearRulesA;
	If[printStatusUpdates,Print["    > A+B bilinearity done: ", Date[][[4;;5]]]];
	magnusDETerms = magnusDETerms //. Join[bilinearRulesB,maxLambdaRules];
	If[printStatusUpdates,Print["    > c*A bilinearity done: ", Date[][[4;;5]]]];
	(*magnusDETerms = magnusDETerms /. {\[Lambda]^p_ :> 0 /; p > order};*)

	(* sum the terms, collect coefficients in \[Lambda] up to (order) and return *)
	magnusDE = Apply[Plus,magnusDETerms];
	If[printStatusUpdates,Print["    > adding terms w/o NCE done: ", Date[][[4;;5]]]];
	result = CoefficientList[magnusDE, \[Lambda], order] /. CMTR -> Commutator;
	If[printStatusUpdates,Print["    > picking coefficients done: ", Date[][[4;;5]]]];
	Return[result];
];


JesseDoMagnusIntegration[MEIntegrand_,maxOrder_,doGrim_:True,itgStartTime_:t0] := 
	Module[{workpiece},
	Print["\n* Begin integrating the next Magnus integrand, at date and time ", Date[][[1 ;; 5]]];
	workpiece = MEIntegrand //. SigmaComRules;
	(*Print[workpiece//FullForm];*)
	Print["SigmaComRules Done:  ", Date[][[4 ;; 5]]];
	(*Print[workpiece];*)
	If[doGrim,
		workpiece = JesseGrim[workpiece, {1/ww, t, t0}, maxOrder];
		(*Print[workpiece];*)
		Print["Trimming Done:  ", Date[][[4 ;; 5]]];
	,
		Print["Skipping trim"];
	];

	workpiece = workpiece /. {t->tt};
	(*Print[workpiece//FullForm];*)
	workpiece = (Integrate[workpiece, {tt, itgStartTime, tf}]) /. tf->t;
	(*Print[workpiece//FullForm];*)
	Print["Integration from `t0' to `t' done:  ", Date[][[4 ;; 5]]];   
	If[doGrim,
		workpiece = JesseGrim[workpiece, {1/ww, t, t0}, maxOrder];
		(*Print[workpiece];*)
		Print["Post-integration trim done:  ", Date[][[4 ;; 5]]];
	,
		Print["Skipping trim, simplifying instead"];
		workpiece = workpiece // S;
		Print["Simplifying done:  ", Date[][[4 ;; 5]]];
	];
	(*Print[workpiece];*)
	Return[workpiece];
];


BCHFormula[A_,B_,2]:=(
	A + B
	+1/2 Commutator[A,B]
)//.SigmaComRules;
BCHFormula[A_,B_,3]:=(
	A + B
	+1/2 Commutator[A,B]
	+1/12 (Commutator[A,Commutator[A,B]]+Commutator[B,Commutator[B,A]])
)//.SigmaComRules;
BCHFormula[A_,B_,4]:=(
	A + B
	+1/2 Commutator[A,B]
	+1/12 (Commutator[A,Commutator[A,B]]+Commutator[B,Commutator[B,A]])
	-1/24 Commutator[B,Commutator[A,Commutator[A,B]]]
)//.SigmaComRules;


SetCommutative[t,td0];
$Assumptions={ww>0,phi1>0,t>0,t0>0,H1>0,phi10>0,tp>0,xz>0,t>t0};
CWW=Collect[#,ww]&;


(* ::Text:: *)
(*asdfqdfvsadfv*)
