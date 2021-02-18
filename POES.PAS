Program POES_metodo_Maulen_y_Odeh;
Uses
  Crt;
Var
  OP: char;
  N, We, F, E,
  num, Se, sf, Se_2, Sef : real;

{-----------------------------------------------------------------------------------------}

Procedure Lectura_y_Calculo_sumatoria( var F, E,
                                           num, Se, sf, Se_2, Sef : real);
Var
  e_2, ef : Real;
Begin
  num:=0 ; Se:=0 ; Se_2:=0 ; Sef:=0 ; Sf:=0 ;
  Repeat
    Write('Escriba el valor de E: '); Readln(E);
    Write('Escriba el valor de F: '); Readln(F);
    Writeln;
    Writeln('presione < C > para continuar');
    Writeln('o presione cualquier otra tecla para suministrar otro dato');
    OP:=Upcase(Readkey);
    Se := Se+e ;                 { ä e }
    num := num+1 ;               { cantidad de datos}
    e_2 := e*e ;
    Se_2 := Se_2 + e_2 ;         { ä eý }
    ef := e*f ;
    Sef := Sef+ef ;              { ä e*f }
    Sf := Sf+f ;                 { ä f }
    Clrscr;
  Until OP = 'C' ;
End;

{-------------------------------------------------------------------------------------}

Procedure mensage_de_error;   { escribe un mensaje de error en pantalla }
Begin
  Write('':2*80);
  Textcolor(red+blink);
  Writeln('ERROR!!!');
  Textcolor(white);
  Writeln('          Debe suministrar mas datos...');
End;

{-------------------------------------------------------------------------------------}

Procedure mensage_de_error_recta_vertical;   { escribe un mensaje de error en pantalla }
Begin
  Write('':2*80);
  Textcolor(red+blink);
  Writeln('ERROR!!!');
  Textcolor(white);
  Writeln('          Datos invalidos: la recta no puede ser vertical...');
End;

{-------------------------------------------------------------------------------------}

Begin
  Clrscr;
  Textcolor(white);
  Lectura_y_Calculo_sumatoria(f, e, num, Se, sf, Se_2, Sef );
  If (num = 1) or ((Se=e*num) and (Sf=f*num))  then
   mensage_de_error      {Si se da menos de dos datos diferentes no hay recta}
  Else
    IF ( E*num = Se ) then
      mensage_de_error_recta_vertical
    Else
      Begin
        N := (Sef-Sf*Se/num)/(Se_2-sqr(Se)/num);
        We := (Sf-N*Se)/num;
        writeln('Por el m‚todo de haulen & Odeh:');
        writeln('POES (N)= ',N:0:4);
        writeln('We =      ',We:0:4);
      End;
  Gotoxy(10,6);
  Write('Presione < S > para Salir');
  Repeat
  Until Upcase(Readkey) = 'S';
End.