Program Ordenamiento_por_Burbuja;
Uses Crt;

Type
  Tvector= ARRAY [1..5000] OF Word;

Var
  A: Tvector;
  N: Word;


{--------------------------------------------}
Procedure Swap(VAr x,y: Word);
Var Temp: Word;
Begin
  Temp:= y;
  y   := x;
  x   := Temp;
End;

{--------------------------------------------}
Procedure OrdenaVector(VAr A:Tvector;N:Word);
Var i,j: Word;
Begin
  For i:=1 To N-1 Do
    For j:=1 To N-i Do
      If A[j]>A[j+1] Then
        Swap(A[j],A[j+1]);
End;

{--------------------------------------------}
Procedure GeneraVector(Var ElVector: TVector;
                               N: Word   );
Var
  i: Integer;
Begin
   For i:=1 To N Do
     ElVector[i]:= Random(1000);
End;


{--------------------------------------------}
Procedure MuestraVector(Vector: TVector;
                             N: Word   );
Var
  j: Integer;
Begin
   For j:=1 To N Do
     Write(Vector[j]:5);
End;

Begin
  Clrscr;
  Randomize;

  N:=50;
  GeneraVector(A,N);
  MuestraVector(A,N);

  WriteLn;
  OrdenaVector(A,N);
  MuestraVector(A,N);

  REadLn;
end.




