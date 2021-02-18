Uses
Crt;
var
t:text;
n:word;
Begin
  Assign(t,'Texto.txt');
  Rewrite(t);
  Repeat
    n:=n+1;
    write(t,n:5,':',chr(n):3);
    if (n mod 5)=0 then
      Writeln(t);
  until n=255;
  Close(t);
End.