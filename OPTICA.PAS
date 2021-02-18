Program Optica;
Uses
 Crt;
Var
  Po, alfa, h, L, f, Tol : Real; {Datos de Entrada}
  cont : Integer;
  P,dx,dl : Real;
  sale,desvanece : Boolean;
Begin
  ClrScr;
  Write('IntroduZca la potencia inicial : ');
  Readln(Po);
  Write('IntroduZca el angulo de salida : ');
  Readln(alfa);
  Write('IntroduZca la separacion entre las placas : ');
  Readln(h);
  Write('IntroduZca la longitud de las placas : ');
  Readln(L);
  Write('IntroduZca el factor de perdida : ');
  Readln(f);
  Write('IntroduZca la tolerancia : ');
  Readln(Tol);

  alfa := alfa*Pi/180;

  If alfa=0 then
    Writeln('No hay reflejos!!!')
  Else If Po<Tol then
    Writeln('No hay haz de luz!!!')
  Else Begin
    dx:=h*Cos(alfa)/Sin(alfa);
    cont:=0;
    P:=Po;
    dl:=0;
    Repeat
      inc(cont);
      dl:=dl+dx;
      P:=P*(1-f);
      sale:=dl>L;
      desvanece:=P<Tol;
    Until sale or desvanece;
    Writeln;
    If sale then begin
      Writeln('El haz de luz sale de las placas.');
      Writeln('N§ de Reflejos : ', cont);
      Writeln('Potencia Final : ', P:0:2);
    end;
    If desvanece then begin
      Writeln('El haz de luz no sale de las placas, se desvanece.');
      Writeln('N§ de Reflejos : ', cont);
      Writeln('Longitud Recorrida : ', dl:0:2);
    end;
  End;
  Repeat
  Until Keypressed;
End.










