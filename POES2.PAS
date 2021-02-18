program Minimos_Cuadrados_POES;
uses
  crt;
var
  op: char;
  N, We, F, E,
  num, So, sf,
  So_2, e_2, ef, Sof : real;

procedure Lee_y_calcula( var F, E, num, So, sf, So_2, e_2, ef, Sof : real);

Begin
  num:=0 ; So:=0 ; So_2:=0 ; Sof:=0 ; Sf:=0 ;
  repeat
    write('Introduzca el valor de E: '); Readln(E);
    write('Introduzca el valor de F: '); Readln(F);
    Writeln;
    writeln('presione < S > para salir');
    writeln('oprima cualquier otra tecla para introducir otro dato');
    OP:=upcase(readkey);
    So := So+e ;
    num := num+1 ;
    e_2 := e*e ;
    So_2 := So_2 + e_2 ;
    ef := e*f ;
    Sof := Sof+ef ;
    Sf := Sf+f ;
    Clrscr;
  until op = 'S' ;
End;

procedure mensage_de_error;
begin
  write('':2*80);
  writeln('ERROR!!!');
  Writeln('      !!!Los datos no son validos!!!');
End;

procedure recta_vertical_error;
begin
  write('':2*80);
  writeln('ERROR!!!');
   Writeln('      !!!La recta no puede ser Vertical!!!');

End;


begin
  clrscr;
  textcolor(white);
  Lee_y_calcula(f, e, num, So, sf, So_2, e_2, ef, Sof );
  if num = 1  then
   mensage_de_error
  Else
    IF ( E*num = So ) then
      recta_vertical_error
    else
      begin
        N := (Sof-Sf*So/num)/(So_2-sqr(So)/num);
        We := (Sof-N*So_2)/So;
        writeln(' Metodo de Haulen & Odeh:');
        writeln('POES (N)= ',N:0:4);
        writeln('We =      ',We:0:4);
      end;
  Gotoxy(10,5);
  Write('Presione < S > para Salir');
  Repeat
  Until Upcase(Readkey) = 'S';

end.