Type
  ba=0..10;

Var
  t,t1:text;
  Base:ba;
  num,n:string;

Function eleva(x,y:integer):integer;
Var
  t:integer;
  i:word;
Begin
  t:=x;
  if y>=2 then
    for i:= 2 to y do begin
      t:=t*y;
    end;
  if y=0 then
    t:=1;
  eleva:=t;
End;


Procedure c_b(b:ba;st:string;var n:string);
Var
  n1,sum,c:integer;
  i:word;
Begin
  for i:=1 to length(st) do begin
    val(st[i],n1,c);
    sum:=sum+n1*eleva(b,length(st)-i);
  end;
  str(sum,n);
End;

function niven(st,n:string):boolean;
Var
  c,sum,n1:integer;
  i:word;
  c1:boolean;
Begin
  c1:=true;
  for i:=1 to length(st) do begin
    val(st[i],n1,c);
    sum:=sum+n1;
  end;
  val(n,n1,c);
  if (n1 mod sum)<>0 then
    c1:=false;
  niven:=c1;
End;

Begin
  Assign(t,'niven.in');
  Reset(t);
  Assign(T1,'niven.out');
  Rewrite(t1);
  Repeat
    Read(t,base);
    if base=0 then
      break;
    Read(t,num);
    if base<>10 then
      c_b(base,num,n);
    if niven(num,n) then
      Writeln(t1,'yes')
    else
      Writeln(t1,'no');
  Until false;
  Close(t);
  Close(t1);
End.