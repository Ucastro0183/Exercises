Program Interpolacion_Lineal;
uses
  crt;
 Var
   x1,x2,y1,y2,x,y:Real;
   m,b:Real;
Begin
  clrscr;
  writeln('meta x1 : ');Readln(x1);
  writeln('meta y1 : ');Readln(y1);
  writeln('meta x2 : ');Readln(x2);
  writeln('meta y2 : ');Readln(y2);
  clrscr;
  m:=(y2-y1)/(x2-x1);
  b:=y2-m*x2;
  writeln('donde esta x : ');Readln(x);
  y:=m*x+b;
  writeln('F(',x:0:2,') = ',y:0:2);
  Readln;
End.