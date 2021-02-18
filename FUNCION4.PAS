Program funciones03;
Var
  x: Real;

Function Seno(Alfa: Real): Real;
Var
  X: Real;
Begin
  X:= Alfa * PI / 180;
  seno:= Sin(X);
End;

Begin
  X:= 45;
  WriteLn( Seno(X):0:2 );
  readln;
End.