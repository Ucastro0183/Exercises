Program Random01;
Uses Crt;
Var
  a,k:integer;
Begin
  Randomize;
  Clrscr;
  Repeat
    inc(a);
    k:=Random(1000);
    Writeln(k);
  Until a=24;
  readln;
End.