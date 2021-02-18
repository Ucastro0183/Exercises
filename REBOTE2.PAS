Program Lanzamiento;
Uses
 Crt;
Const
 g=9.8;
Var
  Vo, alfa, h, L, f, Tol: Real; {Datos de Entrada}
  cont : Integer;
  V,Alcance,A,B,Tr,Y : Real;
  Sale,Desvanece,Choca : Boolean;
Begin
  ClrScr;
  Write('IntroduZca la velocidad inicial : ');
  Readln(Vo);
  Write('IntroduZca el angulo de salida : ');
  Readln(alfa);
  Write('IntroduZca la altura de la pared : ');
  Readln(h);
  Write('IntroduZca la distancia de recorrido : ');
  Readln(L);
  Write('IntroduZca el factor de perdida : ');
  Readln(f);
  Write('IntroduZca la tolerancia : ');
  Readln(Tol);

  alfa := alfa*Pi/180;

  If alfa<=tol then
    Writeln('No hay rebote!!!')
  Else If Vo<=Tol then
    Writeln('No hay movimiento!!!')
  Else Begin
          Alcance:=0;
          Cont:=0;

          Repeat
              Cont:=Cont + 1;
              Alfa:=Alfa*(1-f);
              Vo:=Vo*(1-f);
              A:=Sin(alfa);
              B:=Cos(alfa);
              Alcance:=Alcance + (2*A*B*SQR(Vo))/g;
              Tr:=Tr + (L-Alcance)/(Vo*B);
              Y:=Y + (Vo*A)*Tr+(g*SQR(Tr))/2;
              Sale:=(Alcance>=L)    AND (Y=h);
              Desvanece:=(Alfa<Tol) AND (Vo<Tol);
              Choca:=(Alcance>=L)   AND (Y<>h);

          Until Sale or Desvanece or Choca;

          If Sale then
             begin
             writeln('La pelota pasa por el hueco');
             writeln('N§ de Rebotes: ', cont);
             end;
          If Desvanece then
             begin
             writeln('La pelota no alcanza la pared');
             writeln('N§ de Rebotes: ', cont);
             writeln('Recorrido: ',Alcance:4:3);
             end;
          If Choca then
             begin
             writeln('La pelota choca con la pared');
             writeln('N§ de Rebotes: ', cont);
             writeln('Recorrido: ',Alcance:4:3);
             end;
       end;
  Repeat
  Until Keypressed;
End.

