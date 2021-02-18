Program funciones07;
Var
  x: Real;

Function Seno(VAR Alpha: Real): Real;
Begin
  Alpha:= Alpha * PI / 180;
  seno:= Sin(Alpha);
  X:= 8.9;
End;

Begin
  X:= 45;
  WriteLn( Seno(X):0:2 );
  WriteLn( X:0:4 );
End.