uses cc;
var n,m:word;
Begin
  repeat
    Readln(n);
    readln(m);
    cursor(n,m);
    Write('cursor(',n,',',m,'):');
    readln;
  until (n=0)and(m=0);
end.