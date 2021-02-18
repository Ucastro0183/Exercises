Program Integracion_por_Simpson;
Uses
  Crt;
Var
  a, b, area : real;
  error      : boolean;
  n          : longint;

{---------------------------- Funciขn -------------------------------}

Function F(x: Real;
            Var err:Boolean): Real;
Begin
  If x=0 Then       {condiciones para que x este fuera del dominio}
    err:=true
  Else              {evaluo la funciขn en x}
   Begin
    F:=(x*x-45*x+3)/(2*x);
    err:=false;
   End
End;

{--------------------------- Presentaciขn --------------------------}

Procedure saludo;
const
   a='ษอออออออออออออออออออออออออออออออออออป';
   b='ศอออออออออออออออออออออออออออออออออออผ';
   c='บ';
   d='  C lculo del Area bajo una curva  ';
   e='          Mtodo de Simpson        ';
Begin
   textcolor(15);
   gotoxy( 40 - length(a) div 2 , 11);
   write(a);
   gotoxy( 40 - length(a) div 2 , 12);
   write(c);textcolor(7); write(d);textcolor(15); write(c);
   gotoxy( 40 - length(a) div 2 , 13);
   write(c);textcolor(7); write(e);textcolor(15); write(c);
   gotoxy( 40 - length(a) div 2 , 14);
   write(b); textcolor(7);
   gotoxy(80,25);
   Repeat Until Keypressed;
   Readkey;
End;

{----------------------------- datos ---------------------------}

Procedure Lectura(var inf, sup: Real;
                  var n       : longint);
Begin
   Clrscr;
   Write('Valor del lกmite inferior de evaluaciขn: '); Readln(inf);
   Repeat
      Write('Valor del lกmite superior de evaluaciขn: '); Readln(sup);
   Until  inf < sup ;
   Repeat
      Write('Nฃmero de particiones ( >0 e impar ): '); Readln(n);
   Until (n>0)and(n mod 2 <> 0) ;

End;

{-------------------------- Calculos ------------------------------}

function simpson(    a, b : Real;
                     n    : longint;
                 Var e    : boolean):Real;
Var
   e1, e2, e3      : Boolean;
   At, area, x, dx : real;
   cont            : longint;
begin
   e := False;
   At := (a-b)/3*n*(f(a,e1)+F(b,e2));
   dx:=(b-a)/n;
   If e1 or e2 then
      E:= True
   Else
      begin
        cont:=1;
        x:=a;
        Repeat
           inc(cont);
           x:=x+dx;
           area := 2 * f(x,e3);
           if e3 then
              E:=True
           Else
              if cont mod 2 = 0 then
                 area := area * 2;
           At := At + area;
        Until e3 or (x>=b);
        If e3 then
          e:=true;
      end;
   Simpson := At ;
end;

{------------------------- Salida -------------------------------}

Procedure Salida(a, b, area : Real;
                 error      : Boolean );
Begin
  Clrscr;
  If not Error then
     Begin
        Writeln('El area debajo de la curva por el mtodo de Simpson');
        Writeln('dentro del intervalo [ ',a:0:2,' , ',b:0:2,' ] es: ',area:0:6);
     End
  Else
     begin
        Textcolor(28);
        Writeln('ERROR!!!');
        Textcolor(7);
        Writeln('No se pudo evaluar el area, la funcion no es continua.');
     End;
  gotoxy(40-length('Presione <S> para Salir') div 2,6);
  Write('Presione <S> para Salir');
  Repeat Until Upcase(Readkey)='S';
End;

{-------------------------- programa -------------------------------}

Begin
   Clrscr;
   Saludo;
   Lectura(a,b,n);
   Area:=simpson(a,b,n,error);
   salida(a,b,area,error);
End.