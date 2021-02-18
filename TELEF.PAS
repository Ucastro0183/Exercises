Program Lista_de_numeros_telefonicos;
Uses
  Crt;

Const
  Max=1000;
  Ruta_in='entrada.in';
  Ruta_out='salida.out';

Type
  list= Array [0..max] of String[15];


Procedure Lee (var a:list; Cant:longint);
Var
  i      : Longint;
  infile : Text;
Begin
  Assign(infile,ruta_in);
  Reset(infile);
  For i:= 0 to cant do
     Readln(infile,a[i]);
  Close(infile)
End;

procedure Borra_Guiones(var a : list; dim : longint);
Var
  i:longint;
Begin
  for i:=1 to dim do
    iF pos('-',a[i])<>0 Then Begin
      delete(a[i],pos('-',a[i]),1);
      dec(i);
    End;
end;

Procedure Forma_numerica(Var a : list; dim : longint);
Var
  i, j : longint;
Begin
  for I:=1 to dim do
    For j:=1 to 15 do Begin
      If ((a[i,j]='A') or (a[i,j]='B')) or (a[i,j]='C') then
        A[i,j]:='2';
      If ((a[i,j]='D') or (a[i,j]='E')) or (a[i,j]='F') then
        A[i,j]:='3';
      If ((a[i,j]='G') or (a[i,j]='H')) or (a[i,j]='I') then
        A[i,j]:='4';
      If ((a[i,j]='J') or (a[i,j]='K')) or (a[i,j]='L') then
        A[i,j]:='5';
      If ((a[i,j]='M') or (a[i,j]='N')) or (a[i,j]='O') then
        A[i,j]:='6';
      If ((a[i,j]='P') or (a[i,j]='R')) or (a[i,j]='S') then
        A[i,j]:='7';
      If ((a[i,j]='T') or (a[i,j]='U')) or (a[i,j]='V') then
        A[i,j]:='8';
      If ((a[i,j]='W') or (a[i,j]='X')) or (a[i,j]='Y') then
        A[i,j]:='9';
    End;
End;

Procedure elimino(Var a:list; j:longint; Var c:longint);
Var
  i: longint;
Begin
  for i:=j to c-1 do
    a[i]:=a[i+1];
  A[c]:='';
  C:=c-1;
End;


Procedure Repetidos(Var a, q:list; Var c:longint);
Var
  b, i, j : longint;
  r       : String;
Begin
  For i:=1 to c-1 do
    begin
      b:=1;
      j:=i;
      Repeat
        inc(j);
        If a[i]=a[j] Then
          Begin
            elimino(a,j,c);
            b:=b+1;
            j:=j-1;
          End;
      Until j>=c;
        str(b,r);
        q[i]:=r;
    End;
End;

Procedure invierte(Var a:list; i,j :word);
Var
  s:string;
Begin
  s:=a[i];
  a[i]:=a[j];
  a[j]:=s;
End;

Procedure ordena(Var a,b: list; dim:longint);
Var
  i, j :longint;
Begin
  For i:=1 to dim-1 do
    For J:=I+1 to dim do
      If a[i]>a[j] then  Begin
        invierte(a,i,j);
        invierte(b,i,j); End
End;

Procedure Coloca_guiones(var a:list; dim:longint);
Var
  i : longint;
  j : integer;
  s : string;
Begin      s:='-'; j:=4;
  for i:=1 to dim do
    insert(s,a[i],j);
End;



Var
  Cant_num        : longint;
  Lista, lista_r  : list;
  infile, outfile : text;
  i:integer;

Begin
  Clrscr;
  Assign(infile,ruta_in);
  Reset(infile);
  Read(Infile,cant_num);
  Close(infile);
  Lee(lista,cant_num);
  Borra_guiones(lista,cant_num);
  Forma_numerica(lista,cant_num);
  Repetidos(lista,lista_r, cant_num);
  ordena(lista,lista_r, cant_num);
  coloca_guiones(lista,cant_num);
  Assign(outfile,ruta_out);
  Rewrite(outfile);
  For i:=1 to Cant_num do
    If lista_r[i]<>'1' then
      Writeln(outfile,lista[i],'  ',lista_r  [i]);
  Close(outfile);
End.