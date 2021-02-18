






















 Program Calculo;
 Uses Crt;
 Var
  N,T:Integer;
  SIG,X,U:Real;
Begin
CLRSCR;
Write('Meta X:');  Readln(X);
Write('Meta el # de terminos a sumar :');  Readln(T);
X:=X*PI/180;
SIG:=X;  U:=X;  N:=0;
Repeat
 N:=N+1;
 If N MOD 2=0 Then
  SIG:=SIG+(U/(2*N))*(SQR(X)/(2*N+1))
  ELSE
  SIG:=SIG-(U/(2*N))*(SQR(X)/(2*N+1));
  U:=(U/(2*N))*(SQR(X)/(2*N+1));
UNTIL
  N=T;

  Writeln('El Seno de',X:4:3,' es:',SIG:4:3);
  Writeln;
  Writeln('El Seno teorico es:',SIN(X):4:3);
 Repeat
 UNTIL Keypressed
end.