Program Matrices_2;
Uses
  Crt;
Const
  Nmax = 10;
Type            {fila,columnas}
  Mat = Array [1..Nmax,1..Nmax] of Byte;

Procedure Crear(var A : Mat; Var N : Byte);
Var
  i,j,cont : byte;
Begin
  Write('Dimensi¢n : ');
  Readln(N);
  cont:=0;
  for i:=1 to N do
    for j:=1 to N do begin
      inc(cont);
      A[j,i]:=cont;
    end;

End;

Procedure EscribeMat(A : Mat; N : Byte; V : String);
Var
  i,j : Byte;
Begin
  Writeln('La matriz ',V,' es : ');
  for i:=1 to N do begin
    for j:=1 to N do
      write(A[i,j]:4);
    writeln;
  end;
End;

Var
  A : Mat;
  N : Byte;
Begin
  ClrScr;
  Crear(A,N);
  EscribeMat(A,N,'');
  Readln;
End.
