Program Arreglos;
Uses
  Crt;

Const
  Nmax = 100;

Type
  Vector = Array [1..Nmax] of Byte;

Var
  A : Vector;
  N : Integer;

Procedure Leer(var A : Vector;var N : Integer);
Var
  i : Integer;
Begin
  Repeat
    Write('Meta N : ');
    Readln(N);
  Until (N>0) and (N<=Nmax);
  Writeln('Introduzca el vector : ');
  For i:=1 to N do begin
    Write('A[',i,'] = ');
    Readln(A[i]);
  end;
End;

Procedure Escribir(A : Vector; N : Integer);
Var
  i : Integer;
Begin
  Write('El vector ordenado es : ');
  For i:=1 to N do
    Write(A[i]:4);
  Readln;
End;

Procedure Swap(Var x,y: Byte);
Var Temp: Word;
Begin
  Temp:= y;
  y   := x;
  x   := Temp;
End;

Procedure OrdenaVector(Var A:Vector; N:Integer; tipo : Boolean);
Var i,j: Word;
Begin
  For i:=1 To N-1 Do
    For j:=1 To N-i Do
      If tipo then begin
        If A[j]>A[j+1] Then
          Swap(A[j],A[j+1]);
      end else
        If A[j]<A[j+1] Then
          Swap(A[j],A[j+1]);
End;

Procedure Ordena(var A : Vector; N : Integer);
Var
  Par,Impar : Vector;
  i,j,k : Integer;
Begin
  j:=0; k:=0;
  For i:=1 to N do
    If odd(i) then begin
      inc(j);
      Impar[j]:=A[i];
    end else begin
      inc(k);
      Par[k]:=A[i];
    end;

  OrdenaVector(Par,k,false);
  OrdenaVector(Impar,j,true);

  j:=0; k:=0;
  For i:=1 to N do
    If odd(i) then begin
      inc(j);
      A[i]:=Impar[j];
    end else begin
      inc(k);
      A[i]:=Par[k];
    end;

End;

Begin
  ClrScr;
  Leer(A,N);
  Ordena(A,N);
  Escribir(A,N);
End.







