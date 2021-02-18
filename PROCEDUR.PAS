PROGRAM MODULOS;
USES CRT;
VAR A,B,C : INTEGER;

PROCEDURE PROC1(A : INTEGER; VAR B: INTEGER);
VAR C :  INTEGER;
BEGIN
     A:=10;
     C:=A*B;
     B:=C;
     A:=C-A;
END;

PROCEDURE PROC2(A : INTEGER ; VAR C:  INTEGER);
VAR B: INTEGER;
BEGIN
     B:=A-10;
     C:= A*B;
     A:=C-A;
END;
PROCEDURE PROC3( VAR B,C : INTEGER;  A:INTEGER);
BEGIN
     A:=C-B;
     B:=C;
     C:=A+5;
END;
BEGIN
   CLRSCR;
     A:=5; B:=10; C:=2;
     WRITELN(A:5,B:5,C:5);
     PROC1(A,B);
     WRITELN(A:5,B:5,C:5);
     PROC2(C,B);
     WRITELN(A:5,B:5,C:5);
     PROC3(A,B,C);
     WRITELN(A:5,B:5,C:5);
     Readln;
   END.
