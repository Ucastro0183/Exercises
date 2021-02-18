Program Matrices;
Uses Crt;
Const
  Nmax=10;
Type          { fila   columna }
  Mat = Array [1..Nmax,1..Nmax] of Byte;

Procedure LeerMat(Var a : mat; Var n, m : Byte);
Var i, j :byte;
Begin
  Repeat
    Write('Num de Filas: ');
    Readln(n)
  Until (n>0) and (n<nmax);
  Repeat
    Write('Num de Columnas: ');
    Readln(m)
  Until (m>0) and (m<nmax);
  Write('Intruduzca la Matriz:');
  For i:=1 to n do
    For J:=1 to m do
      Begin
        Write('a[',i,',',j,'] = ');
        Readln(a[i,j]);
      End;
End;

Procedure EscribeMat(a : mat; m, n : Byte);
Var
  I, J : Byte;
Begin
  Writeln('La matriz es: ');
  for i:=1 to m do
    for j:=1 to n do
    Write(a[i,j])
End;

Var
  a: Mat;
  M, N : Byte;

Begin
  Clrscr;
  Leermat(a,m,n);
  Escribemat(a,m,n);
  Readln
End.