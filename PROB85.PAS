Program Union_Interseccion;
Uses
  Crt;
Const
  Nmax = 100;
Type
  Vector = Array [1..Nmax] of Integer;

Procedure Leer(var A : Vector;var N : Integer; V : Char);
Var
  i : Integer;
Begin
  Repeat
    Write('Introduzca la dimensi¢n del Vector ',V,' : ');
    Readln(N);
  Until (N>0) and (N<=Nmax);
  Writeln('Introduzca el vector ',V,' : ');
  For i:=1 to N do begin
    Write(V,'[',i,'] = ');
    Readln(A[i]);
  end;
End;

Procedure Eliminar(var A : Vector;var N : Integer);
Var
  i,j,k : Integer;
Begin
  for i:=1 to N-1 do
    for j:=i+1 to N do
      if A[i]=A[j] then begin
        for k:=j+1 to N do
          A[k-1]:=A[k];
        dec(N);
        dec(j);
      end;
End;





Procedure Union(var C : Vector;var Nu : Integer; A,B : Vector; N,M : Integer);
Var
  i : Integer;
Begin
  For i:=1 to N do
    C[i]:=A[i];
  For i:=1 to M do
    C[N+i]:=B[i];
  Nu:=N+M;
  Eliminar(C,Nu);
End;

Function esta(valor : Integer; A :Vector; N : Integer):Boolean;
Var
  SioNo : Boolean;
  i : Integer;
Begin
  SioNo := False;
  For i:=1 to N do
    if valor=A[i] then
      SioNo:=True;
  esta:=SioNo;
End;

Procedure Interseccion(var D : Vector;var Ni : Integer; A,B : Vector; N,M : Integer);
Var
  i,k : Integer;
Begin
  k:=0;
  For i:=1 to N do
    if esta(A[i],B,M) then begin
      inc(k);
      D[k]:=A[i];
    end;
  Ni:=K;
  Eliminar(D,Ni);
End;

Procedure Escribir(A :Vector; N : Integer; V : String);
Var
  i : Integer;
Begin
  Write('El Vector ',V,' es : ');
  For i:=1 to N do
    Write(A[i]:4);
  Writeln;
End;

Var
  A,B,C,D : Vector;
  N,M,Nu,Ni : Integer;
Begin
  ClrScr;
  Leer(A,N,'A');
  Leer(B,M,'B');
  Union(C,Nu,A,B,N,M);
  Interseccion(D,Ni,A,B,N,M);
  Escribir(C,Nu,'Uni¢n');
  Escribir(D,Ni,'Intersecci¢n');
  Readln;
End.


