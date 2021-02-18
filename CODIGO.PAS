Uses
Crt;
var
n:char;
Begin
  Repeat
    n:=readkey;
    write('#',ord(n));
    if n=#0 then begin
      n:=readkey;
      Writeln(' #',ord(n))
    end else
      Writeln;
  until n=#27;
End.