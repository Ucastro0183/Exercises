program Lanzamiento_de_proyectiles;
Uses Crt;
Var
  Vo,alfa,t,rad,x,y:real;
Const
  g=9.81;
  pi=3.14159265359;
Begin
  clrscr;
  Writeln('indicar el valor de Vo en m/s');
  readln(Vo);
  Writeln('indicar el valor de alfa');
  readln(alfa);
  Writeln('indicar el valor de t en s');
  readln(t);
  clrscr;
  rad:=(alfa*pi)/180;
  x:=Vo*cos(rad)*t;
  y:=Vo*sin(rad)*t-g*t*t/2;
  Writeln('la posicion en el eje x para un t=',t:0:3,'s es ',x:0:3,'m');
  Writeln('la posicion en el eje y para un t=',t:0:3,'s es ',y:0:3,'m');
  Readln;
End.
