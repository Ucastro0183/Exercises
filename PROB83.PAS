Program Arreglos;
Uses
  Crt;

Const
  Nmax = 100;

Type
  Vector = Array [1..Nmax] of Byte;

Var
  Par,Impar,A : Vector;
  Np,Ni,N : Integer;

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

Procedure Escribir(Par,Impar : Vector; Np,Ni : Integer);
Var
  i : Integer;
Begin
  Write('El vector par ordenado es : ');
  For i:=1 to Np do
    Write(Par[i]:4);
  Writeln;
  Write('El vector impar ordenado es : ');
  For i:=1 to Ni do
    Write(Impar[i]:4);
  Writeln;
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
    For j:=i+1 To N Do
      If tipo then begin
        If A[i]>A[j] Then
          Swap(A[i],A[j]);
      end else
        If A[i]<A[j] Then
          Swap(A[i],A[j]);
End;

Procedure Ordena(var Par,Impar : Vector;var j,k:Integer; A : Vector; N : Integer);
Var
  i : Integer;
Begin
  j:=0; k:=0;
  For i:=1 to N do
    If odd(A[i]) then begin
      inc(j);
      Impar[j]:=A[i];
    end else begin
      inc(k);
      Par[k]:=A[i];
    end;

  OrdenaVector(Par,k,false);
  OrdenaVector(Impar,j,true);

End;

Begin
  ClrScr;
  Leer(A,N);
  Ordena(Par,Impar,Ni,Np,A,N);
  Escribir(Par,Impar,Np,Ni);
End.







