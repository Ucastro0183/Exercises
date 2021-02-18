program reflexion_de_un_haz_de_luz;
Uses
  Crt;
Var
  alfa, M, n, f, l, h, Po, P, P1, T, Cr, Cr2, Cr3, Cr4, rad: Real;
Begin
  Clrscr;
  writeln('ingrese el valor del angulo de reflexion');
  Readln(alfa);
  writeln('ingrese el valor de la potencia inicial');
  Readln(Po);
  writeln('ingrese el valor de la longitud de las placas');
  Readln(l);
  writeln('ingrese el valor de la distancia entre las placas');
  Readln(h);
  writeln('ingrese el valor del factor de perdida de potencia');
  Readln(f);
  writeln('ingrese el valor de la tolerancia o aproximacion a cero (entre 0 y 1): ');
  Readln(T);
  Clrscr;
  Cr:= 0;
  P1:= Po;
  Repeat
     P:= P1*(1-f);
     P1:= P;
     Cr:= Cr + 1;
  Until P <= T;
  Rad:= (alfa*pi)/180;
  M:= h*(cos(rad)/sin(rad));
  Cr2:= 1;
  n:=M;
  Repeat
    Cr2:= Cr2 + 1;
    M:=M+n;
  Until M >= l;
  If Cr > Cr2 then
     Begin
       Writeln(' el haz de luz se ha salido de las placas' );
       Writeln;
       Writeln('el numero de reflejos fue: ',Cr2:0:2);
       Cr3:= 0;
       Repeat
          P:= Po*(1-f);
          Po:= P;
          Cr3:= Cr3 + 1;
       Until Cr3 = Cr2;
       Writeln('el valor de la potencia de salida es ', P:0:2)
     End;
  If Cr < Cr2 then
     Begin
       Writeln(' el haz de luz se ha desvanecido entre las placas' );
       Writeln;
       Writeln('el numero de reflejos fue: ',Cr:0:2);
       M:=0;
       Repeat
         Cr4:= Cr4 + 1;
         M:=M+n;
       Until Cr4  = Cr;
       Writeln('el valor de la distancia que recorrio es: ', M:0:2);
     End;
  if Cr =  Cr2 then

End.