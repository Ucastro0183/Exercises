program integrales_por_trapecios;
Uses
  crt;
Var
  n:Integer;
  a,b,area:real;

procedure lectura(var N:integer; var a,b: real);
begin
  clrscr;
  textcolor(white);
  repeat
   writeln('introduzca el lmite inferior del intervalo : ');
   readln(a);
   writeln('introduzca el lmite superior del intervalo : ');
   readln(b);
   If a>=b then
     begin
       textcolor(red+blink);
       writeln('error!!!');
       textcolor(white);
     end;
  until(a<B);
  writeln('introduzca el numero de diviciones que se desea : ');
  readln(n);
end;

procedure salida(resultado : real);
begin
  clrscr;
  gotoxy(1,12);
  write('el area bajo la curva es : ');
  textcolor(white+blink);
  writeln(resultado:0:2);
  readln;
end;

function f(x:real):real;
begin
  f:=4-sqr(x-2)
end;

function trapecio(n:integer; a,b: real) : real;
var
  At,Ai,dx,x1,x2,y1,y2:real;
  i:integer;
begin
  At:=0;
  dx:=(b-a)/n;
  x1 := A ;
  for i:=1 to n do
    begin
      x2 := x1 + dx;
      y1:= f(x1); y2:=f(x2);
      ai:=(y1+y2)*dx/2;
      At:=At+Ai;
      X1:=x2;
    end;
  trapecio:=At;
end;

begin
  lectura(N,a,b);
  area:=trapecio(n,a,b);
  salida(area);
end.