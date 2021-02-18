uses crt;

type
  v=array[1..20] of real;

Var
  x, y, c: v;
  i:integer;

procedure Poinomio_N(n: integer);
var
  k, i: Integer;
  u, d: Real;
begin
  c[1]:=y[1];
  for k:=2 to n do begin
    d:=x[k]-x[k-1];
    u:=c[k-1];
    for i:=k-2 downto 1 do begin
      d:=d*(x[k]-x[i]);
      u:=u*(x[k]-x[i])+c[i];
    end;
    c[k]:=(y[k]-u)/d;
  end;
end;

procedure Escribir(n: integer);
var
  S,l: string;
  i, j: byte;
begin
  str(c[1]:0:2,l);
  s:='P(x)='+l;
  for i:=2 to n do begin
    if c[i]>0 then
      s:=s+'+';
    str(c[i]:0:2,l);
    s:=s+l;
    for j:=i-1 downto 1 do begin
      s:=s+'(x';
      if x[j]>0 then
        s:=s+'+';
      str(x[j]:0:2,l);
      s:=s+l+')';
    end;
  end;
  writeln(s);
end;

begin
  clrscr;
  x[1]:=1;
  x[2]:=2;
  x[3]:=3;
  y[1]:=-2;
  y[2]:=1;
  y[3]:=3;
  Poinomio_N(3);
  for i:=1 to 3 do
    writeln(c[i]:0:3);
  Escribir(3);
  readln;
end.