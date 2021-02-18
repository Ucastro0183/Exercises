Program Arreglos_bidimensionales05;
{- Determina si hay repetidos -}

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
  Mat[4,3]:=1;
End;


{-----------------------------------------------------------}
Procedure MuestraArreglo(Mat: TMatriz;
								 NumFil, NumCol:Word);
Var i, j: Word;
Begin
	For i:= 1 to NumFil Do Begin
		For j:= 1 to NumCol Do
			Write(Mat[i,j]:5);
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
      For u:=i to M Do
        If (u=i)AND(j<>N) Then
           For v:=j+1 to N Do
             If A[i,j]=A[u,v] Then
               Temp:= True
        Else
           For v:=1 to N Do
             If A[i,j]=A[u,v] Then
               Temp:= True;
  HayRepetidos:= Temp;
End;

{-----------------------------------------------------------}
Begin
	ClrScr;
	Randomize;

   M:=4;
   N:=3;

	GeneraArreglo(A,M,N);
	MuestraArreglo(A,M,N);

   If HayRepetidos(A,M,N) Then Write('Repetidos')
   Else Write('NO Repetidos');

	Repeat Until KeyPressed;
End.