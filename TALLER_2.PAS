Program Facturacion;
Uses Crt, Printer;

Const
   Ruta='Rep.smr';

Type
  Lista = Array [1..20] of string[15];
  Datos = Record
            nombre:string[20];
            Ref:Word;
            Cant,num_marc:Byte;
            Marca:lista;
          End;
  Repuesto = Array [1..50] of Datos;

Var
  a : Char;

Procedure  Pantalla_Inicial;
Const
  a='T a l l e r  " D e  P i n h o s "';
  b='Programa de Facturaci¢n y Control';
  c='MENU PRINCIPAL';
Begin
  Window(1,1,80,25);
  Clrscr;
  TextBackground(3);
  Write(' ':80);
  TextColor(0);
  GotoXY(40-Length(a) div 2 , 1);
  Writeln(a);
  TextBackground(1);
  TextColor(15);
  Writeln('':80);
  GotoXY(40-Length(b) div 2 , 2);
  Writeln(b);
  TextBackground(7);
  Writeln('':80*21);
  TextColor(15);
  gotoxy(1,3);
  GotoXY(31 , 8);
  Writeln(c);
  Writeln;
  GotoXY(27,10);
  Write('1.- Crear');
  GotoXY(27,12);
  Write('2.- Modificar');
  GotoXY(27,14);
  Write('3.- Consultar');
  GotoXY(27,16);
  Write('4.- Facturar');
  GotoXY(27,18);
  Write('5.- Salir');
  Gotoxy(1,24);
  TextBackground(3);
  Write('':80);
  TextBackground(0);
  Write('':79);
End;


Procedure Crear;
Var
  Marc:Lista;
  Arch: Text;
  Rep : Repuesto;
  i, j: Word;
  t   : Char;
Begin

  Window(19,8,59,16);
  textBackground(Blue);
  Clrscr;
  gotoxy(2,2);
  textBackground(3);
  Textcolor(8);
  Writeln('         Crear Nuevo Repuesto         ');
  gotoxy(2,9);
  Write('':39);
  Textcolor(White);

  i:=0;
  window(22,10,58,15);
  Repeat
  Inc(i);
  Textbackground(blue);
  Clrscr;
  Gotoxy(1,1);
  Write('Nombre : ');
  Readln(Rep[i].nombre);
  Writeln;
  Write('Referencia : ');
  Readln(Rep[i].ref);
  Writeln;
  Write('Cantidad : ');
  Readln(Rep[i].cant);
  Clrscr;
  Write('¨A que cantidad de marcas sirve?:  ');
  Readln(Rep[i].num_marc);
  Clrscr;
  For j:=1 to Rep[i].num_marc Do  Begin
    Write('Marca #',j,' : ');
    Readln(Marc[j]);
  End;
  Clrscr;
  Write('¨Crear otro repuesto? [Y/N]');
  Repeat
  t:=Upcase(readkey);
  Until (t='N')or(t='Y');
  Assign(Arch,Ruta);
  Append(Arch);
  Writeln(Arch,Rep[i].nombre);
  Writeln(Arch,Rep[i].Ref);
  Writeln(Arch,Rep[i].Cant);
  Writeln(Arch,Rep[i].num_marc);
  For j:=1 To Rep[i].num_marc Do
    Writeln(Arch,Marc[j]);
  Writeln(arch,'');
  Close(arch);
  Until t='N';
  Pantalla_inicial;
End;


Procedure Modificar;
Begin
End;


Procedure Consultar;
Begin
End;


Procedure Facturar;
Begin
End;


Begin
  Clrscr;
  Pantalla_inicial;
  Repeat
  a:=ReadKey;
  Case a of
    '1':crear;
    '2':modificar;
    '3':consultar;
    '4':facturar;
    '5':Halt(0);
  End;
  Until a='5';

End.