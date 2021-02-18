Program funciones05;
USES CRT;
Var
  x: Real;

Function Seno(VAR X: Real): Real;
Begin
  X:= X * PI / 180;
  seno:= Sin(X);
End;

Begin
  CLRSCR;
  X:= 90;
  WriteLn( Seno(X):0:2 );
  WriteLn( X:0:4 );
  readln;
End.