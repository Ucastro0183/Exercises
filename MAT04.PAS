Program Arreglos_bidimensionales04;
{- Genera y muestra diagonales de un arreglo -}

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
Var i, j: Word;
Begin
	For i:= 1 to NumFil Do
		For j:= 1 to NumCol Do
		  Mat[i,j]:= -100 + Random(201);
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
Procedure MuestraDiagonal1(M: TMatriz; N: Word);
Var i, j: Word;
Begin
	For i:= 1 to N Do
		For j:= 1 to N Do
         If i=j Then
			   Write(M[i,j]:5);
End;

{-----------------------------------------------------------}
Procedure MuestraDiagonal2(M: TMatriz; N: Word);
Var i, j: Word;
Begin
	For i:= 1 to N Do
		For j:= 1 to N Do
         If i+j=N+1 Then
			   Write(M[i,j]:5);
End;

{-----------------------------------------------------------}
Begin
	ClrScr;
	Randomize;

	Write('Orden de la matriz: '); ReadLn(M);
	GeneraArreglo(A,M,M);
	MuestraArreglo(A,M,M);

   WriteLn('Elementos de la diagonal Principal:');
   MuestraDiagonal1(A,M);

   WriteLn;
   WriteLn('Elementos de la diagonal Secundaria:');
   MuestraDiagonal2(A,M);

	Repeat Until KeyPressed;
End.