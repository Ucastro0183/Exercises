PROGRAM NUMERO_PRIMO1;
USES CRT;
VAR
  I,N: WORD;
BEGIN
  CLRSCR;
  WRITE('N= '); READLN(N);
  FOR I:=2 TO N-1 DO
    IF N MOD I = 0 THEN              {este programa no funciona con uno}
	   WRITELN('NO ES PRIMO')       {ni con dos}
    ELSE
	   WRITELN('ES PRIMO');

  REPEAT UNTIL KEYPRESSED;
END.