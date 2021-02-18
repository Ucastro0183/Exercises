Program Ordenamiento_por_Shell;
Uses Crt;

Const
  Max = 100;
Type
  Vector= ARRAY [1..Max] OF Integer;

Var
  A: Vector;
  N: Word;


{--------------------------------------------}
Procedure Lee_N(Var m : Word);
Begin
  Repeat
    Write('Introduzca la dimenci¢n del vector: ');
    Readln(m);
  Until (m>0) and (m<Max);
End;


{--------------------------------------------}
Procedure Cambia(Var x,y: Integer);
Var
  Temp : Integer;
Begin
  Temp:= y;
  y   := x;
  x   := Temp;
End;

{--------------------------------------------}
Procedure OrdenaVector(Var A : Vector;
                           N : Word);
Var
  g, Cont, i, j, L, m, h : Word;
Begin
  Cont := 0;
  h:=N;
  Repeat
    Inc(Cont);
    L := N div 2;
    m:=1;
    If L>1 then
      for i:=1 to Cont do
        Begin
          For j:=m To L+m-1 Do
              If A[j]>A[j+L] Then
                Cambia(A[j],A[j+L]);
          m := m+L-1;
        End;
    N := L;
  Until L = 1;
  Repeat
    g:=0;
    for i := 1 to h-1 do
      If a[i]>a[i+1] then
        Begin
          cambia(a[i],a[i+1]);
          Inc(g);
          Dec(i)
        End;
  Until g = 0;
End;

{--------------------------------------------}
Procedure Lee_Vector(Var V : Vector;
                         N : Word   );
Var
  i: Word;
Begin
  Writeln('Introduzca el vector V : ');
  For i := 1 To N Do
    Begin
      Write('V(',i,') = ');
      Readln(V[i]);
    End;
End;


{--------------------------------------------}
Procedure MuestraVector(Vect : Vector;
                        N    : Word   );
Var
  j: Integer;
Begin
   For j:=1 To N Do
     Write(Vect[j]:5);
End;

Begin
  Clrscr;
  Lee_N(N);
  Lee_Vector(A,N);
  MuestraVector(A,N);
  Writeln;
  OrdenaVector(A,N);
  MuestraVector(A,N);
  Readln;
end.









  Repeat
    L := N div 2;
    For j:=1 To L Do
      Begin
        If A[j]>A[j+L] Then
          Cambia(A[j],A[j+L]);
      End;
    N := L;
  Until L = 1;
