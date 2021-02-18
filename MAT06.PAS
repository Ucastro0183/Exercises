Program Arreglos_bidimensionales06;
{- Determina si hay repetidos  Seccion2-}

Uses Crt;

Const
	MaxFils= 50;
	MaxCols= 50;

Type
	TMatriz = Array [1..MaxFils , 1.. MaxCols] Of Integer;
Var
	A	 : TMatriz;
	M,N : Word;

{-----------------------------------------------------------}
Procedure GeneraArreglo(Var Mat: TMatriz;
							NumFil, NumCol:Word);
Var Cont,i, j: Word;

Begin
  Cont:=0;
  For i:=1 To NumFil Do
    For j:=1 To NumCol Do Begin
      Inc(Cont);
      Mat[i,j]:= Cont;
    End;
  Mat[1,3]:=1;
End;


{-----------------------------------------------------------}
Procedure MuestraArreglo(Mat: TMatriz;
								 NumFil, NumCol:Word);
Var i, j: Word;
Begin
	For i:= 1 to NumFil Do Begin
		For j:= 1 to NumCol Do
			Write(Mat[i,j]:3);
		WriteLn;
	End
End;

{-----------------------------------------------------------}
Function HayRepetidos(A:TMatriz; M,N: Word): Boolean;
var i,j,u,v: Word;
    Temp   : Boolean;
Begin
  Temp:= False;
  For i:=1 to M Do
    For j:=1 to N Do
      For u:=1 to M Do
        For v:=1 to N Do
          If (i<>u) OR (j<>v) Then
            If A[i,j]=A[u,v] Then
              Temp:= True;
  HayRepetidos:= Temp;
End;

{-----------------------------------------------------------}
Begin
	ClrScr;
	Randomize;

   M:=6;
   N:=6;

	GeneraArreglo(A,M,N);
	MuestraArreglo(A,M,N);

   If HayRepetidos(A,M,N) Then
	  Write('Si Hay Repetidos')
   Else
	  Write('NO Repetidos');

	Repeat Until KeyPressed;
End.