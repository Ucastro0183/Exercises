Program Arreglos_bidimensionales;
{- Lee y muestra un arreglo -}

Uses Crt;

Const
	MaxFils= 50;
	MaxCols= 50;

Type
	TCuadricula = Array [1..MaxFils , 1.. MaxCols] Of Word;

Var
	A	 : TCuadricula;
	M,N : Word;

{-----------------------------------------------------------}
Procedure LeeArreglo(Var Mat: TCuadricula;
							NumFil, NumCol:Word);
Var i, j: Word;
Begin
	For i:= 1 to NumFil Do
		For j:= 1 to NumCol Do Begin
			Write('Mat[', i , ',' , j ,']= ');
			ReadLn(Mat[i,j])
		End
End;

{-----------------------------------------------------------}
Procedure MuestraArreglo(Mat: TCuadricula;
								 NumFil, NumCol:Word);
Var i, j: Word;
Begin
	For i:= 1 to NumFil Do Begin
		For j:= 1 to NumCol Do
			Write(Mat[i,j]:5);
		WriteLn;
	End
End;

Begin
	ClrScr;
	Write('N£mero de filas: ');  		ReadLn(M);
	Write('N£mero de Columnas: ');	ReadLn(N);
	LeeArreglo(A,M,N);
	MuestraArreglo(A,M,N);
	Repeat Until KeyPressed;
End.



