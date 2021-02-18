Program Tabla_de_caracteres_ASCII;
Uses
  Crt;

Var
  I, x, y : Integer;

Begin
  Clrscr;
  x:=1; y:=0;
  For I:=1 To 255 do
    Begin
      y:=y+1;
      GotoXY(x,y);
      If (I mod 5 = 0) Then
        Textcolor(15)
      Else Textcolor(8);
      Write(ord(I):4);
      If (I mod 5 = 0) Then
        Textcolor(11)
      Else Textcolor(3);
      Write(chr(I):3);
      If I mod 25 = 0 Then
        Begin
          y:=0; x:=x+7;
        End;
    End;
  Repeat Until Keypressed;
  Textcolor(7);
End.