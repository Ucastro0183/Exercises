type
  r=0..25;
  name=array[0..25]of string[26];
Var
  t,t1:text;
  n,m:r;
  i:word;
  cont:integer;
  nombres,nam:name;
Begin
  assign(t,'calling.in');
  assign(T1,'Calling.out');
  reset(t);
  rewrite(t1);
  Repeat
    inc(cont);
    Readln(t,n,m);
    if n=0 then
      Break;
    for i:=1 to 2*m do begin
      read(nombres[i]);
      nam[i]:=nombres[i];
    end;
    Writeln('Calling circles for data set ',cont,':');
  Until false;
  close(t);
  close(t1);
End.