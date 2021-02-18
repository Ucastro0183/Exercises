PROGRAM Trapecios;

USES
    CRT;

    Procedure Lectura(var N: integer; var a,b: real);
    BEGIN
     Clrscr;
     Repeat
       Writeln('Introduzaca el limite inferior del intervalo:');
       Readln(a);
       Writeln('Introduzaca el limite superior del intervalo:');
       Readln(b);
        If a>=b then
        Writeln ('Error');
     until (a<b);
       Writeln('Introduzca el numero de divisiones:');
       Readln(N);
    END;


    Procedure Salida(Resultado: real);
    Begin
     Clrscr;
     gotoxy(1,12);
     Write('El area bajo la curva es: ');
     Textcolor(white + blink);
     Writeln(resultado:0:4);
     readln;
    End;

    Function f(x: real):real;
    Begin
     F:= 4 - sqr(X-2);
    End;

    Function Trapecio(N: integer; a,b: real):real;
    var
     dx,x1,x2,y1,At,Ai,y2: real;
     i: integer;
    Begin
     dx:=(b-a)/N;
     At:=0;
     x1:=a;
     For i:= 1 to N do begin
         x2:=x1 + dx;
         y1:= f(x1);
         y2:= f(x2);
         Ai:= (y1+y2)*dx/2;
         At:= At + Ai;
         x1:= x2;
         End;
     Trapecio := At;
    End;

var
n: integer;
xi,xs:real;
area:real;

BEGIN
     Lectura (N,xi,xs);
     Area:= Trapecio(N,xi,xs);
     Salida(Area);

     REPEAT
     UNTIL KEYPRESSED;
END.












