PROGRAM USO_DEL_CASE;
USES CRT;
VAR
  A,B   : REAL;
  OPCION: CHAR;
BEGIN
  CLRSCR;
  WRITE('A= '); READLN(A);
  WRITE('B= '); READLN(B);

  REPEAT
      CLRSCR;
      WRITELN('A= ',A:0:3);
      WRITELN('B= ',B:0:3);
      WRITELN('[1] SUMAR A+B');
      WRITELN('[2] RESTAR A-B');
      WRITELN('[3] MULTIPLICAR A*B');
      WRITELN('[4] DIVIDIR A/B');
      WRITELN('[T] TEMINAR');
      WRITELN;
      WRITE('OPCION: ');
      OPCION:= UPCASE(READKEY);
      WRITE(OPCION);
      CASE OPCION OF
         '1': WRITELN(A+B);
         '2': WRITELN(A-B);
         '3': WRITELN(A*B);
         '4': WRITELN(A/B);
         'T': ;
      ELSE
         WRITE('OPCION INVALIDA');
      END;
      READLN;
  UNTIL OPCION='T';
END.