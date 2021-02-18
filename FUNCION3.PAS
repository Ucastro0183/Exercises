Program funciones03;
Var
  x: Real;

Function Seno(Alfa: Real): Real;
Var
  r: Real;
Begin
  r:= Alfa * PI / 180;
  seno:= Sin(r);
End;

Begin
  X:= 45;
  WriteLn( Seno(X):0:2 );
  readln;
End.