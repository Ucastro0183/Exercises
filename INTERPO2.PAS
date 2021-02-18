Program Interpolacion_Lineal;
uses
  crt;
Var
  x1,x2,y1,y2,x,y:Real;
  m,b:Real;
  arch:text;
Begin
  clrscr;
  assign(arch,'A:\DATO.dat');
  reset(arch);
  Read(arch,x1);
  Readln(arch,x2);
  Read(arch,y1);
  Readln(arch,y2);
  clrscr;
  m:=(y2-y1)/(x2-x1);
  b:=y2-m*x2;
  Readln(arch,x);
  close(arch);
  y:=m*x+b;
  writeln('F(',x:0:2,') = ',y:0:2);
  Readln;
End.