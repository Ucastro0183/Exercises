PROGRAM INTEGRACION_POR_TRAPECIOS;
USES CRT;
CONST
  OKEY = TRUE;
VAR
  A, B, AREA : REAL;
  N          : LONGINT;

{---------------------------------------------}
Function F(x: Real; var Error: Boolean ): Real;
Begin
  If (X=3) OR
     (X>8) OR
	  (Sqrt(8-x) + Exp(-2*x) <=0) Then
        Error:= True
  Else
    Begin
      F:= 1/(3-x) * Ln(Sqrt(8-x) + Exp(-2*x) );
      Error:= False;
    End;
End;

{--------------------------------------------}
PROCEDURE PRESENTACION;
CONST
  MENS = '--METODO DE LOS TRAPECIOS--';
BEGIN
  GOTOXY( 40 - LENGTH(MENS) DIV 2 ,13);
  WRITELN( MENS);
  GOTOXY(80,25);
  REPEAT UNTIL KEYPRESSED
END;

{--------------------------------------------}
PROCEDURE LEE_DATOS(VAR INF,SUP: REAL;
                    VAR NUMPART: LONGINT);
BEGIN
  CLRSCR;
  WRITE('EXTREMO INFERIOR DEL INTERVALO DE INTEGRACION: ');
  READLN(INF);
  REPEAT
    WRITE('EXTREMO SUPERIOR DEL INTERVALO DE INTEGRACION: ');
    READLN(SUP);
  UNTIL INF<SUP;
  REPEAT
    WRITE('NUMERO DE PARTICIONES (>100): ');
    READLN(NUMPART);
  UNTIL NUMPART>100;
END;

{--------------------------------------------}
FUNCTION TRAPECIOS(A, B: REAL;
                      N: LONGINT;
               VAR AREA: REAL ):BOOLEAN;
VAR
  DX, Ai: REAL;
  Xi,Xi_1: REAL;
  I     : WORD;
  E     : BOOLEAN;
BEGIN
   DX:= (B-A)/N;
   TRAPECIOS := OKEY;
   FOR I:=1 TO N DO BEGIN
     Xi_1:= A + (i-1)* Dx;
     Xi  := Xi_1 + Dx;
     Ai:= ( F(Xi_1, E) + F(Xi, E) )*DX/2;
     IF E THEN TRAPECIOS:= NOT OKEY;
     AREA:= AREA + Ai;
   END;
END;
{--------------------------------------------}
BEGIN
  CLRSCR;
  PRESENTACION;
  LEE_DATOS(A,B,N);
  IF TRAPECIOS(A,B,N,AREA)=OKEY THEN
      WRITELN('EL AREA ES: ', AREA:0:5)
  ELSE
      WRITELN('METODO NO COMPLETADO');
  REPEAT UNTIL KEYPRESSED;
END.