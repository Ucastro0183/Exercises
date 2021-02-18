Program funciones01;

Function Seno(Alfa: Real): Real;
Var
  X: REAL;
Begin
  X:= Alfa * PI / 180 ;
  seno:= Sin(X);
End;

Begin
  WriteLn( Seno(45):0:2 );
  readln;
End.