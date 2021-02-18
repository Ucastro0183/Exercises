program sexto_Parcial;
Uses
  Crt;
{-- 1 --}
Const
  Max=1000;
Type
  tpoly = Array [0..max] of Real;

{-- 2 --}
Function Grado(P : Tpoly): Word;
Var
  i: Word;
Begin
  i:=0;
  For i:=max downto 0 do
    If p[i]<>0 then
      Grado:=i;
End;

{-- 3 --}
Function Px(P : Tpoly; x: Real) : Real;
Var
  i : word;
  m: Real;
Begin
  m:=0;
  For i := 0 to Grado(P) do
    m:=m+P[i]*exp(i*ln(x));
  Px:=m;
End;

{-- 4 --}
Function MaxCoef(p:Tpoly):Real;
Var
  Mayor : Real;
  I     : Word;
Begin
  Mayor := Abs(p[1]);
  for i:=0 to Grado(p) do
    If Abs(p[i]) > Mayor then
      Mayor := Abs(p[i]);
End;

{-- 5 --}
procedure SumaPoli(p1,p2 : Tpoly;Var p3: Tpoly);
Var
  I, Gm : Word;
Begin
  If Grado(p1) > Grado(p2) then
    Gm:= Grado(p1)
  Else
    Gm:= Grado(p2);
  for i:=0 to Gm do
    p3[i] := p1[i] + p2[i];
End;

{-- 6 --}
procedure dPdx(P : Tpoly ; Var dP : Tpoly);
Var
  I:Word;
Begin
  for i:=0 to Grado(P) do
    dP[i] := P[i+1] * (i+1);
End;

Begin


End.