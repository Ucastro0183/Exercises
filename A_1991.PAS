program ACM_A_1991;

type
  re  = record
          ini,fin : byte
        end;
  reg = array [1..25] of re;
  arr = Array [1..25] of byte;

Var
  T, T1        : text;
  a, b, x, f   : byte;
  calles       : reg;
  tam, cont, I, h : word;
  res          : arr;

Procedure escribe;
Var
  j, k : word;
Begin
  For j:=1 to i-1 do
    For k:=j+1 to i do
      If res[j]=res[i] then
        Exit;
  Assign(t1,'A_1991.out');
  Append(t1);
  Write(T1,res[1]);
  For i:=2 to I do Begin
    Write(t1,res[i]:5);
  End;
  Writeln(t1);
  Close(t1);
End;

Procedure Busca(pos:word);
Var
  j : word;
Begin
  If res[i]=calles[pos].ini then Begin
    inc(i);
    res[i]:=calles[pos].fin;
    If res[i]=f then Begin
      escribe;
      End;
    For j:=1 to tam do
      Busca(j);
    res[i]:=0;
    Dec(i);
  End;
End;

Begin
  Assign(t,'A_1991.in');
  Assign(t1,'A_1991.out');
  Reset(t);
  Rewrite(t1);
  Close(t1);
  Repeat
    inc(cont);
    tam:=0;
    Readln(t,f);
    Res[1]:=1;
    for i:=2 to 25 do
      res[i]:=0;
    For i:=1 to 25 do Begin
      Calles[i].ini:=0;
      Calles[i].fin:=0;
      End;
    i := 1;
    Repeat
      Readln(t,a,b);
      If a>b then Begin
        x:=a; a:=b; b:=x;
        End;
      If a=0 then
        Break;
      Inc(tam);
      calles[tam].ini:=a;
      calles[tam].fin:=b;

    Until false;
    Assign(t1,'A_1991.out');
    Append(t1);
    Writeln(t1,'CASE #',cont);
    Close(T1);
    for h:=1 to tam do
      busca(h)
  Until eof(t);
  Close(t);
End.