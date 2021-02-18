Program Matrices;
Uses
  Crt;
Const
  Nmax = 10;
Type            {fila,columnas}
  Mat = Array [1..Nmax,1..Nmax] of Byte;

Procedure LeerMat(var A : Mat;var N,M : Byte);
Var
  i,j : Byte;
Begin
  Repeat
    Write('N§ de Filas : ');
    Readln(N);
  Until (N>0)and(N<=Nmax);
  Repeat
    Write('N§ de Columnas : ');
    Readln(M);
  Until (M>0)and(M<=Nmax);
  Writeln('Introduzca la matriz : ');
  for i:=1 to N do
    for j:=1 to M do begin
      Write('A[',i,',',j,'] = ');
      Readln(A[i,j]);
    end;
End;

Procedure GenerarMatRandom(var A : Mat;var N,M : Byte);
Var
  i,j : Byte;
Begin
  Randomize;
  Repeat
    Write('N§ de Filas : ');
    Readln(N);
  Until (N>0)and(N<=Nmax);
  Repeat
    Write('N§ de Columnas : ');
    Readln(M);
  Until (M>0)and(M<=Nmax);
  Writeln('Introduzca la matriz : ');
  for i:=1 to N do
    for j:=1 to M do begin
      A[i,j]:=Random(255);
      Write('A[',i,',',j,'] = ',A[i,j]);
    end;
End;

Procedure EscribeMat(A : Mat; N,M : Byte; V : String);
VAr
  i,j : Byte;
Begin
  Writeln('La matriz ',V,' es : ');
  for i:=1 to N do begin
    for j:=1 to M do
      write(A[i,j]:4);
    writeln;
  end;
End;

Procedure Suma(A,B : Mat; N,M : Byte;var C : Mat);
Var
  i,j : Byte;
Begin
  for i:=1 to N do
    for j:=1 to M do
      C[i,j]:=A[i,j]+B[i,j];
End;

Procedure Multiplica(A,B : Mat; Na,Ma,Nb,Mb : Byte;var C : Mat);
Var
  i,j,k,temp : Byte;
Begin
  for i:=1 to Na do
    for j:=1 to Mb do begin
      temp:=0;
      for k:=1 to Nb do
        temp:=temp+A[i,k]*B[k,j];
      C[i,j]:=temp;
    end;
End;

Procedure Verifica(A,B : Mat; Na,Ma,Nb,Mb : Byte);
Var
  C : Mat;
Begin
  If (Na=Nb)and(Ma=Mb) then begin
    Suma(A,B,Na,Ma,C);
    EscribeMat(C,Na,Ma,'Suma');
  end else
    Writeln('Las Matrices no se pueden sumar... ja ja ja ');
  Readln;
  If (Ma=Nb) then begin
    Multiplica(A,B,Na,Ma,Nb,Mb,C);
    EscribeMat(C,Na,Mb,'Producto');
  end else
    Writeln('Las Matrices no se pueden multiplicar... ja ja ja ');
  Readln;
End;
Var
  A,B : Mat;
  Na,Ma,Nb,Mb : Byte;

Begin
  ClrScr;
  LeerMat(A,Na,Ma);
  LeerMat(B,Nb,Mb);
  Verifica(A,B,Na,Ma,Nb,Mb);
End.









