Program Arreglo_01;
Uses Crt;
Type
  Tvector= ARRAY [1..9] OF Integer;
Var
  A: Tvector;
  N: Word;

{--------------------------------------------}
Procedure LeeVector(Var ElVector: TVector;
                               N: Word    );
Var
  i: Word;
Begin
   For i:=1 To N Do Begin
     Write('ElVector[' , i ,']= ');
     REadLn(ElVector[i]);
   End;
End;

{--------------------------------------------}
Procedure MuestraVector(Vector: TVector;
                               N: Word    );
Var
  j: Word;
Begin
   For j:=1 To N Do
     WriteLN('Vector[' , j ,']: ', Vector[j]);
End;
{--------------------------------------------}

Begin
  ClrScr;
  N:= 5;
  LeeVector( A, N);
  MuestraVector(A,N);
  ReadLn;
End.