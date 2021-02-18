Program Arreglos_bidimensionales03;
{- Genera en "S" y muestra un arreglo -}

Uses Crt;

Const
	MaxFils= 50;
	MaxCols= 50;

Type
	TCuadricula = Array [1..MaxFils , 1.. MaxCols] Of Integer;

Var
	A	 : TCuadricula;
	M,N : Word;

{-----------------------------------------------------------}
Procedure GeneraArreglo(Var Mat: TCuadricula;
							NumFil, NumCol:Word);
Var i, j: Word;
    ConT: Integer;
Begin
   Cont:= 1;
	For J:= 1 to NumCol Do
      If odd(j) Then
		  For i:= 1 to NumFil Do Begin
		    Mat[i,j]:= Cont;
          Inc(Cont);
        end
      Else
		  For i:=NumFil DownTo 1 Do Begin
		    Mat[i,j]:= Cont;
          Inc(Cont);
        end
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

{-----------------------------------------------------------}
Begin
	ClrScr;
	Randomize;

	Write('N£mero de filas: ');  		ReadLn(M);
	Write('N£mero de Columnas: ');	ReadLn(N);
	GeneraArreglo(A,M,N);
	MuestraArreglo(A,M,N);

	Repeat Until KeyPressed;
End.