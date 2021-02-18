Program Calculo_de_raices_por_Biseccion01;
Uses
  Crt;
Var
  a,b,tol,Xraiz : Real;
  Error         : Boolean;

{---------------------------- Funci¢n -------------------------------}

Function F(x: Real;
            Var mal:Boolean): Real;
Begin
  If x=0 Then       {condiciones para que x este fuera del dominio}
    mal:=true
  Else              {evaluo la funci¢n en x}
   Begin
    F:=(x*x*x-45*x+3)/(2*x*x+x);
    mal:=false;
   End
End;

{------------------------- Saludo -------------------------------}

Procedure Inicio;
Const
   a='ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»';
   b='º C lculo de ra¡ces por el m‚todo de Bisecci¢n º';
   c='ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼';
Begin
   Textcolor(15);
   Gotoxy(40-length(a) div 2 , 12); Writeln(a);
   Gotoxy(40-length(b) div 2 , 13); Writeln(b);
   Gotoxy(40-length(c) div 2 , 14); Writeln(c);
   gotoxy(80,25);
   Textcolor(7);
   Repeat Until Keypressed;
   Readkey;
End;

{----------------------------- Lectura -------------------------------}

Procedure Lee_datos( Var inf,sup,tol: Real;
                     Var e:Boolean );
Var
   e1,e2: boolean;
Begin
  Clrscr;
  Repeat
     Write('l¡mite Inferior: '); Readln(inf);
     Repeat
        Write('l¡mite superior: '); Readln(sup)
     Until sup>inf
  Until F(inf,e1)*F(sup,e2)<=0;
  If e1 or e2 then
    e:=true;
  Repeat
  Write('Tolerancia (entre 0-1): '); Readln(tol);
  Until (tol<1)and(tol>0);
End;

{------------------------------ C lculos ---------------------------}

Procedure Calcula_raiz(a,b,tol: Real;
                       Var e: Boolean;
                       Var m: Real);
Var
   e1,e2,e3 : boolean;

Begin
  If not e then
      Repeat
           If F(a,e1)=0 Then
              m:=a
           Else
              If F(b,e2)=0 Then
                 m:=b
              Else
                 Begin
                   m:=(a+b)/2;
                   If F(m,e3)<>0 Then
                      If F(a,e1)*F(m,e2)<0 Then
                         b:=m
                      Else  a:=m;
                 End;
      Until E1 or e2 or e3 or
            ( (( abs(F(m,e3)) <= tol ) and ( b-a <= tol )) or
            (F(m,e)=0));
  If e1 or e2 or e3 then
    e:=true;
 End;

{------------------------ Escribe resultados -------------------------}

Procedure Salida(a,b   : Real;
                 error : Boolean;
                 raiz  : Real );
Begin
   Clrscr;
   If  not error Then
    Begin
      Writeln('una de las ra¡ces de la funci¢n');
      Writeln('dentro del intervalo [ ',a:0:2,' , ',b:0:2,' ] es: ',raiz:0:2)
    End
   Else
    Begin
      Textcolor(red+blink);
      Writeln('Error!!!');
      Textcolor(7);
      Writeln('La funci¢n tiene discontinuidades y no se pudo evaluar')
    End;
End;

{---------------------- Indicaciones de salida ------------------------}

Procedure Fin;
Const
  mens='Presione <S> para Salir';
Begin
  Gotoxy(40 - length(mens) div 2,6);
  Write(mens);
  Repeat Until Upcase(Readkey)='S';
End;

{----------------------- Programa -------------------}

Begin
  Clrscr;
  Inicio;
  Lee_datos(a,b,tol,error);
  Calcula_raiz(a,b,tol,error,Xraiz);
  Salida(a,b,error,Xraiz);
  Fin;
End.