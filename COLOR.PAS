Uses
Crt;
var
n:word;
Begin
  Repeat
  clrscr;
  inc(n);
  gotoxy(122,140);
  textcolor(n);
  Write('ULISES',n:3);

  until readkey=#27;
End.