Program funciones08;
Var
  x: Real;

Function Seno(VAR Alpha: Real): Real;
Var x: Char;
Begin
  X:='&';
  Alpha:= Alpha * PI / 180;
  seno:= Sin(Alpha);
End;

Begin
  X:= 45;
  WriteLn( Seno(X):0:2 );
  WriteLn( X:0:4 );
End.