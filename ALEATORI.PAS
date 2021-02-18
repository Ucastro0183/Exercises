Program Crea_n_puntos_aleatorios_y_ve_si_pertenecen;
Uses Crt;
Var
  Dentro, n : Integer;

Procedure Lee(var n:integer);
Begin
  Repeat
     Write('N: '); Readln(n);
  Until n>0;
End;

Procedure Calculo(n:integer;
                  Var a:integer);
Var
  x, y : Real;
  Cont : Integer;
Begin
  Cont:=0;
  a:=0;
  Repeat
    inc(cont);
    x:=2*Random-1;
    y:=2*random-1;
    If sqr(x)+sqr(y)<=1 then
      a:=a+1
  Until Cont=N;
End;

Begin
  Randomize;
  Clrscr;
  Lee(n);
  calculo(n,dentro);
  Writeln('De los ',n:0,' puntos, ',dentro:0,' se encuentran dentro de la circunferencia');
  Writeln('La relaci¢n es R=',n/dentro:0:4);
  readln;
End.