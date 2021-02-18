Program Restaurante;
Uses
  Crt;

Const
  Nmax = 20;

Type
  cal=array [1..Nmax] of Real;
Procedure Generar(Var a: cal; Var n : Byte);
Var
  I:Byte;
Begin
  n:=random(Nmax)+1;
  For i:=1 to n do
    A[i]:=Random*1000;
End;

Procedure Leer(Var Max:Real);
Begin
  Write('Introduzca el maximo de calorias: ');
  Readln(Max);
End;

Procedure Combinar(  Plato1, plato2, postre : Cal;  N1, n2, np : Byte;  Maxcal:real);
Var
  i, j, k : Byte;
Begin
  For I:=1 to n1 do
    For j:=1 to n2 do
      For k:=1 to np do
       If (plato1[i]+plato2[j]+Postre[k]<=Maxcal) then
         Writeln('plato1 # ',i,'; plato2 # ',j,'; Postre # ',k);
End;


Var
  Plato1, plato2, postre : Cal;
  N1, n2, np : Byte;
  Maxcal:real;

Begin
  Clrscr;
  Randomize;
  Generar(plato1,n1);
  Generar(plato2,n2);
  Generar(postre,np);
  Leer(maxcal);
  Combinar(Plato1, plato2, postre, N1, n2, np, Maxcal);
  Readln
End.
