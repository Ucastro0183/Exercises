Program Arreglo_03;
Uses Crt;

CONST
  Inf = -10;
  Sup =   4;

Type
  Tvector= ARRAY [Inf..Sup] OF Integer;

Var
  A,B,C: Tvector;
  N    : Word;

{--------------------------------------------}
Procedure LeeVector(Var ElVector: TVector;
                               N: Word   ;
                          NOMBRE: Char   );
Var
  i: Integer;
Begin
   For i:=Inf To Inf+N Do Begin
     Write(NOMBRE,'[' , i ,']= ');
     REadLn(ElVector[i]);
   End;
End;

{--------------------------------------------}
Procedure MuestraVector(Vector: TVector;
                             N: Word   ;
                        NOMBRE: Char   );
Var
  j: Integer;
Begin
   For j:=Inf To Inf+N Do
     WriteLN(NOMBRE,'[' , j ,']: ', Vector[j]);
End;
{--------------------------------------------}

Begin
  ClrScr;
  N:= 6;
  LeeVector( A, N, 'a');
  MuestraVector(A,N,'a');

  LeeVector( B, N, 'v');
  MuestraVector(B,N,'v');

  ReadLn;
End.