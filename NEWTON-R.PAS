{ ANALISIS NUMERICO
  BURDEN-FAIRES      }
PROGRAM NEWTON_RAPHSON;
USES CRT;

CONST MAXITER=1000;

VAR
  Xo,TOL,Xraiz: REAL;

FUNCTION F(X: REAL): REAL;
BEGIN
  F:= X*X - 11*X + 24;
END;

FUNCTION Fp(Z: REAL): REAL;
BEGIN
  Fp:= 2*Z - 11;
END;

PROCEDURE LEE_DATOS(VAR Xcero,Tol: REAL);
BEGIN
  WRITELN;
  WRITE('Xcero= ');      READLN(Xcero);
  WRITE('tolerancia= '); READLN(Tol);
END;

PROCEDURE BUSCA_RAIZ(X_CERO,TOL: real;
                          VAR M: real);
vAR
   Xn_1,Xn: REAL;
BEGIN
   Xn:= X_cero;
   REPEAT
     Xn_1:= Xn;
     Xn:= Xn_1 - F(Xn_1)/Fp(Xn_1);
   UNTIL ABS(f(Xn))<=TOL;
   M:= Xn;
END;

BEGIN
  LEE_DATOS(Xo,TOL);
  BUSCA_RAIZ(Xo,TOL,Xraiz);
  WRITE('APROX. A LA RAIZ: ', Xraiz:0:12);
  REPEAT UNTIL KEYPRESSED;
END.









