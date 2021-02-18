Program Interpolacion_Lineal;
uses
  crt;
Var
  x1,x2,y1,y2,x,y:Real;
  m,b:Real;
  arch,ARCH1:text;
Begin
  clrscr;
  assign(arch,'DATO.dat');
  reset(arch);
  Readln(arch,X1,Y1);
  Readln(arch,X2,Y2);
  clrscr;
  m:=(y2-y1)/(x2-x1);
  b:=y2-m*x2;
  Readln(arch,x);
  close(arch);
  y:=m*x+b;
  assign(arch1,'salida.out');
  rewrite(arch1);
  writeln(arch1,'F(',x:0:2,') = ',y:0:2);
  close(arch1);
End.