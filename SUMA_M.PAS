{$A+,B-,D+,E+,F+,G+,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}
Program suma_de_matrices;
Uses Crt;

Type
  matriz = Array [1..100,1..100] of integer;

Var
  A, B, C : matriz;
  n       : byte;

Function Lee_dim : byte;
Var
  n : byte;
Begin
  clrscr;
  Write('Introduzca la dimenci¢n de las matrices: ');
  Readln(n);
  Lee_dim := n;
End;

Function generar : byte;
Var
  Op      : Char;
  g, code : integer;
Begin
  Repeat
    Write('Desea que el programa genere las matrices [S/N]: ');
    Op:=Upcase(Readkey);
    Writeln(Op);
  Until Op in ['N','S'];
  If Op = 'S' Then
    generar := 1
  Else
    generar := 0;
End;

Procedure genera(var A: matriz; n: byte);
Var
  i, j : byte;
Begin
  randomize;
  for i:=1 to n do
    for j:=1 to n do
      A[i,j]:=random(100);
  Writeln;
  Writeln('La matriz generada es:');
  Writeln;
  For i:=1 to n do Begin
    For j:=1 to n do
      Write(a[i,j]:3);
    Writeln;
  End;
End;

Procedure Lee(var A: matriz; n: byte);
Var
  i, j : Byte;
Begin
  For i:=1 to n do Begin
    Writeln('Intoduzca la fila ',i,':');
    For j:=1 to n do begin
      write('A[',i,',',j']: ');
      Readln(A[i,j]);
    end;
    Writeln;
  End;
  Writeln;
  Writeln('La matriz le¡da es:');
  Writeln;
  For i:=1 to n do Begin
    For j:=1 to n do
      Write(a[i,j]:3);
    Writeln;
  End;
End;

Procedure suma(var C: matriz; A,B: matriz; n: byte);
Var
  i, j : longint;
Begin
  For i:=1 to n do
    For j:=1 to n do
      C[i,j]:=A[i,j]+B[i,j];
  Writeln;
  Writeln('La matriz suma es:');
  Writeln;
  For i:=1 to n do Begin
    For j:=1 to n do
      Write(c[i,j]:4);
    Writeln;
  End;
End;

Begin
  n := Lee_dim;
  Writeln('Matriz A:');
  If generar=1 Then Begin
    Genera(A,n);
    End Else Begin
      Lee(A,n);
    End;
  Writeln('Matriz B:');
  If generar=1 Then Begin
    Genera(B,n);
    End Else Begin
      Lee(B,n);
    End;
  Suma(C,A,B,n);
End.