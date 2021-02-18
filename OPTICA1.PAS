Program Optica;
Uses
  Crt;
var
  Po,alfa,h,L,Tol,f : Real;
  sale,desvanece:Boolean;
  cont:Integer;
  P,dl:Real;
Procedure Lectura(var Po,alfa,h,L,Tol,f : Real);
Begin
  ClrScr;
  Write('IntroduZca la potencia inicial : '); Readln(Po);
  Write('IntroduZca el angulo de salida : '); Readln(alfa);
  Write('IntroduZca la separacion entre las placas : '); Readln(h);
  Write('IntroduZca la longitud de las placas : '); Readln(L);
  Write('IntroduZca el factor de perdida : '); Readln(f);
  Write('IntroduZca la tolerancia : '); Readln(Tol);
  alfa := alfa*Pi/180;
End;

Procedure Calculo(Po,alfa,h,L,Tol,f:Real; var P,dl:Real; var cont:Integer; var sale,desvanece: Boolean);
Var
  dx : Real;
Begin
  dx:=h*Cos(alfa)/Sin(alfa);
  cont:=0;
  P:=Po;
  Repeat
    inc(cont);
    dl:=dl+dx;
    P:=P*(1-f);
    sale:=dl>L;
    desvanece:=P<Tol;
  Until sale or desvanece;
End;

Procedure Salida(sale,desvanece:Boolean; cont:Integer; P,dl:Real);
Begin
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


Begin
  Lectura(Po,alfa,h,L,Tol,f);
  If alfa=0 then
    Writeln('No hay reflejos!!!')
  Else If Po<Tol then
    Writeln('No hay haz de luz!!!')
  Else Begin
    Calculo(Po,alfa,h,L,Tol,f,P,dl,cont,sale,desvanece);
    Salida(sale,desvanece,cont,P,dl);
  End;
  writeln('press any key to exit':140);
  Repeat until keypressed;
End.














