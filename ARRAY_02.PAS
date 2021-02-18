Program Arreglo_02;
Uses Crt;
Type
  Tvector= ARRAY [1..9] OF Integer;
Var
  A,B,C: Tvector;
  N    : Word;

{--------------------------------------------}
Procedure LeeVector(Var ElVector: TVector;
                               N: Word   ;
                          NOMBRE: Char   );
Var
  i: Word;
Begin
   For i:=1 To N Do Begin
     Write(NOMBRE,'[' , i ,']= ');
     REadLn(ElVector[i]);
   End;
End;

{--------------------------------------------}
Procedure MuestraVector(Vector: TVector;
                             N: Word   ;
                        NOMBRE: Char   );
Var
  j: Word;
Begin
   For j:=1 To N Do
     WriteLN(NOMBRE,'[' , j ,']: ', Vector[j]);
End;
{--------------------------------------------}

Begin
  ClrScr;
  N:= 2;
  LeeVector( A, N, 'a');
  MuestraVector(A,N,'a');

  LeeVector( B, N, 'v');
  MuestraVector(B,N,'v');

  LeeVector( C, N,'C');
  MuestraVector(C,N,'C');

  ReadLn;
End.