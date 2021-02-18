Program Lanzamiento_y_rebote_con_choque;
Uses Crt;
var
  V0, alfa, tol, L, h, f,
  cont, Xh, t, y: Real;
Const
  g=9.88;
Begin
  Clrscr;
  Write('Introduzca el valor del  ngulo de lanzamiento: ');
  Readln(alfa);
  Write('Introduzca el valor de la velocidad  inicial de lanzamiento: ');
  Readln(V0);
  Write('Introduzca el valor de tolerancia de aproximaci¢n a cero (entre 0 y 1):         ');
  Readln(tol);
  Write('Introduzca el valor del factor de perdida de velocidad por rebote entre 0 y 1:  ');
  Readln(f);
  Write('Introduzca el valor de la distancia horizontal a la pared: ');
  Readln(L);
  Write('Introduzca el valor de la distancia vertical del piso al agujero en la pared: ');
  Readln(h);
  Clrscr;
  alfa := alfa*pi/180 ;
  If (V0<=tol) or (alfa<=tol) then
    Writeln('la pelota no realiza movimiento')
  Else
    Begin
      cont := 0 ;
      Xh := 0 ;
      Repeat
        Cont := cont + 1 ;
        Xh := Xh + 2*V0*V0*sin(alfa)*cos(alfa)/g;
        V0 := V0*(1-f);
        alfa := alfa*(1-f)
      Until (V0 <= Tol) or (alfa <= tol) or (Xh+(2*V0*V0*sin(alfa)*cos(alfa)/g)>=L);
      If (V0 <= tol) Then
        Writeln('La Pelota se detiene antes de llegar a la pared')
      Else
        If (alfa <= tol) Then
          Writeln('La pelota ha dejado de rebotar')
        Else
          If xh>l then
            Begin
              t := L/(V0*cos(alfa));
              y := V0*sin(alfa)*t - g*t*t/2;
              If y=h Then
                Writeln('La pelota pasa por el agujero en la pared')
              Else
                Writeln('La pelota toca la pared pero no pasa por el agujero');
            End
          else
            Begin
              L := L - Xh;
              t := L/(V0*cos(alfa));
              y := V0*sin(alfa)*t - g*t*t/2;
              If y=h Then
                Writeln('La pelota pasa por el agujero en la pared')
              Else
                Writeln('La pelota toca la pared pero no pasa por el agujero');
            End;
      Writeln('ademas, el nø de rebotes que realiz• fueron: ',cont:0:0);
    End;
  Writeln('Presione cualquier tecla para terminar':150);
  Repeat
  Until Keypressed;
End.