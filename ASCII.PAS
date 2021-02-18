Program Ascii;
Uses
  Crt;

Var
  n : word;

begin
  normvideo;
  for n:=1 to 255 do begin
    write(n:4,':',chr(n));
    readln;
    clrscr;
  end;
  Write('........');
  readln;
end.