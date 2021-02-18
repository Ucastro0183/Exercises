Program Facturacion;
Uses Crt, Printer, Dos;

Const
  Ruta='Repuesto.SMR';

Type
  Tstring = String[12];
  Rep   = Record
            Name               : Tstring;
            Costo              : word;
            Ref                : Tstring;
            Cantidad, N_marcas : Byte;
          End;
  Marc  = Array [1..20] Of Tstring;
  Fecha = Record
            D, M, A, Ds : Word;
          end;
  Tlista = Array [1..50] of Rep;
  list  = Array [1..50] of Byte;
  Llis  = Array [1..50] of marc;
Var
  C : Char;
  N : Byte;

Procedure cursor(ini,fin:byte);assembler;
Asm
   mov ax,$0100
   mov ch,ini
   mov cl,fin
   int $10
End;

Procedure Pantalla;
Const
  a='                     T a l l e r   " D e   P i n h o s "                        ';
  b='                      Programa de Facturaciขn y Control                         ';

Begin
  Window(1,1,80,25);
  TextBackground(Black);
  Clrscr;
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(Black);
  Write(a);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Write(b);
  Gotoxy(1,23);
  TextBackground(LightGray);
  TextColor(LightCyan);
  Write('                                   Use las flechas ',#24,#25,' para escojer su opciขn    ');
  Gotoxy(1,24);
  TextBackground(Cyan);
  TextColor(Yellow);
  Write('F1':12);
  TextColor(DarkGray);
  Write(' = ');
  TextColor(Yellow);
  Write('A');
  TextColor(DarkGray);
  Write('cerca de...');
  TextColor(Yellow);
  Write('F3':8);
  TextColor(DarkGray);
  Write(' = ');
  TextColor(Yellow);
  Write('S');
  TextColor(DarkGray);
  Write('alida                                    ');
End;

Procedure Menu1;
Const
  b='.- Crear';

Begin
  TextBackground(Blue);
  Gotoxy(29,8);
  Write('1');
  TextColor(White);
  Write(b);
  TextBackground(LightGray);
End;

Procedure Menu2;
Const
  c='.- Modificar';

Begin
  TextBackground(Blue);
  Gotoxy(29,10);
  Write('2');
  Write(c);
  TextBackground(LightGray);
End;

Procedure Menu3;
Const
  d='.- Consultar';

Begin
  TextBackground(Blue);
  Gotoxy(29,12);
  Write('3');
  Write(d);
  TextBackground(LightGray);
End;

Procedure Menu4;
Const
  e='.- Facturar';

Begin
  TextBackground(Blue);
  Gotoxy(29,14);
  Write('4');
  Write(e);
  TextBackground(LightGray);
End;

Procedure Menu5;
Const
  f='.- Salir del Programa';

Begin
  TextBackground(Blue);
  Gotoxy(29,16);
  Write('5');
  Write(f);
  TextBackground(LightGray);
End;



Procedure Menu(n : byte);
Const
  a='MENU PRINCIPAL';
  b='.- Crear';
  c='.- Modificar';
  d='.- Consultar';
  e='.- Facturar';
  f='.- Salir del Programa';

Begin
  Window(1,3,80,22);
  TextBackground(LightGray);
  TextColor(White);
  Clrscr;
  Gotoxy(33,6);
  Write(a);
  TextColor(LightCyan);
  Gotoxy(29,8);
  Write('1');
  TextColor(White);
  Write(b);
  TextColor(LightCyan);
  Gotoxy(29,10);
  Write('2');
  TextColor(White);
  Write(c);
  TextColor(LightCyan);
  Gotoxy(29,12);
  Write('3');
  TextColor(White);
  Write(d);
  TextColor(LightCyan);
  Gotoxy(29,14);
  Write('4');
  TextColor(White);
  Write(e);
  TextColor(LightCyan);
  Gotoxy(29,16);
  Write('5');
  TextColor(White);
  Write(f);
  Case n of
    1 : menu1;
    2 : menu2;
    3 : menu3;
    4 : menu4;
    5 : menu5;
  Else begin
      Sound(800);
      Delay(110);
      NoSound; End
  End;
End;



Procedure Crear_Nuevo_Inventario(A : Rep;
                                 B : Marc);
Var
  Inventario : Text;
  j          : Byte;

Begin
  Assign(Inventario,Ruta);
  Append(Inventario);
  Writeln(Inventario,a.Name);
  Writeln(Inventario,a.Costo);
  Writeln(Inventario,A.Ref);
  Writeln(Inventario,A.Cantidad);
  Writeln(Inventario,A.N_marcas);
  For J:=1 to A.N_marcas Do
    Write(Inventario,B[j],' ');
  Writeln(Inventario,'');
  Writeln(Inventario,'');
  Close(Inventario);
End;


Procedure Mensaje_2;
Begin
  Writeln;
  Writeln(' El repuesto ya existe para modificar');
  Writeln('escoja Modificar en el menu principal.');
  Window(21,15,60,16);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(Yellow);
  Write('          Pulse Enter para continuar   ');
  Readln;
  Window(22,9,58,14);
End;

Function Esta(    S : Tstring;
              Var R : Rep;
              Var L : Marc): Boolean;
Var
  Inventario : Text;
  I          : Byte;
  N          : Tstring;

Begin
  Esta:=false;
  Assign(Inventario,Ruta);
  Reset(Inventario);
  Repeat
    Readln(Inventario,N);
    If N=S Then Begin
      R.Name:=N;
      Readln(Inventario,R.Costo);
      Readln(Inventario,R.Ref);
      Readln(Inventario,R.Cantidad);
      Readln(Inventario,R.N_marcas);
      For i:=1 to R.N_Marcas do
        Read(Inventario,L[i]);
      Esta:=True;
      Close(inventario);
      Exit;
    End;
    Readln(Inventario);
    Readln(Inventario);
    Readln(Inventario);
    Readln(Inventario);
    Readln(Inventario);
    Readln(Inventario);
  Until Eof(Inventario);
  Close(Inventario);

End;

Procedure Nuevo(Var C:Char);
Var
  Repuesto : Rep;
  j        : Byte;
  Lista    : Marc;

Begin
  Window(22,9,60,14);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  Write('Nombre :');
  Readln(Repuesto.name);
  If not Esta(Repuesto.name,Repuesto,Lista) Then Begin
    Writeln;
    Write('Valor por unidad :');
    Readln(Repuesto.costo);
    Writeln;
    Write('Referencia :');
    Readln(Repuesto.ref);
    Writeln;
    Write('Cantidad :');
    Readln(Repuesto.cantidad);
    Clrscr;
    Write('จ A cuantas marcas sirve ? :');
    Readln(Repuesto.N_marcas);
    Writeln; Writeln; Writeln;
    For j:=1 to Repuesto.N_marcas do Begin
      Clrscr;
      Write('จ A cuantas marcas sirve ? :',Repuesto.N_marcas);
      Writeln; Writeln; Writeln;
      Write('Marca #',j,' :');
      Readln(Lista[j]);
    End;
    Crear_Nuevo_Inventario(Repuesto,Lista);
  End Else
    Mensaje_2;
  TextBackground(Blue);
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('      จDesea crear otro Repuesto?     ');
  Window(22,9,60,14);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Write('(S/N) :');
  Repeat
    C:=UpCase(ReadKey);
    Write(C);
  Until (c='S') Or (C='N');

End;



Procedure Crear;
Const
  a='         Crear Nuevo Repuesto         ';

Var
  Otro:Char;

Begin
  Clrscr;
  Window(61,8,61,16);
  TextBackGround(Black);
  Clrscr;
  Window(21,16,60,16);
  TextBackGround(Black);
  Clrscr;
  Window(20,7,60,15);
  TextBackground(Blue);
  Clrscr;
  TextBackground(Cyan);
  Textcolor(DarkGray);
  Gotoxy(2,2);
  Write(a);
  Gotoxy(2,9);
  Write('                                       ');

  Repeat
    Nuevo(Otro);
  Until Otro='N';
  Menu(n);

End;

Procedure Mensaje_3;
Begin
  Writeln;
  Writeln(' El repuesto no existe para Crearlo');
  Writeln('escoja Crear en el menu principal.');
  Window(21,15,60,16);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(Yellow);
  Write('          Pulse Enter para continuar   ');
  Readln;
  Window(22,9,58,14);
End;

Procedure Pasar(Var A : TLista;Var B : Llis;Var N : Word);
Var
  Inventario : Text;
  j          : Word;

Begin
  Assign(Inventario,ruta);
  Reset(Inventario);
  N:=0;
  Repeat
  Inc(N);
  Readln(Inventario,A[N].Name);
  Readln(Inventario,A[N].costo);
  Readln(Inventario,A[N].Ref);
  Readln(Inventario,A[N].Cantidad);
  Readln(Inventario,A[N].N_Marcas);
  For j:=1 to A[N].N_Marcas Do
    Read(Inventario,B[N,j]);
  Readln(Inventario);
  Until Eof;
  Close(Inventario);
End;

Procedure Leer(Var A : Tlista ;
               Var B : Llis;
               Var N : word;
                   S : Tstring;
               Var R : Rep;
               Var L : Marc);
Var
  i, j : word;

Begin
  I:=0;
  Repeat
    Inc(i);
    If A[i].name = S Then Begin
      A[i].Name     := R.name;
      A[i].costo    := R.costo;
      A[i].Ref      := R.Ref;
      A[i].cantidad := R.Cantidad;
      For j:=1 to A[i].N_marcas do
        B[i,j]:='';
      A[i].N_marcas := R.n_marcas;
      For j:=1 to A[i].N_marcas do
        B[i,j]:=L[j];
      Break;
    End;
  Until i=n;
End;

Procedure Copiar(Var A:Tlista;
                 Var B:Llis;
                 Var n:word);
Var
  i, j       : word;
  Inventario : Text;

Begin
  Assign(Inventario,ruta);
  Rewrite(Inventario);
  i:=0;
  Repeat
  Inc(i);
  Writeln(Inventario,A[i].Name);
  Writeln(Inventario,A[i].costo);
  Writeln(Inventario,A[i].Ref);
  Writeln(Inventario,A[i].Cantidad);
  Writeln(Inventario,A[i].N_Marcas);
  For j:=1 to A[i].N_Marcas Do
    Write(Inventario,B[i,j]);
  Writeln(Inventario,' ');
  Until i=n;
  Close(Inventario);

End;


Procedure Guardar(S : Tstring;
                  R : Rep;
                  L : Marc);
Var
  A : Tlista;
  B : Llis;
  i : Word;

Begin

  Pasar(A,B,i);
  Leer(A,B,i,S,R,L);
  Copiar(A,B,i);

End;




Procedure Cambio(Var C : Char);
Var
  Repuesto : Rep;
  S        : Tstring;
  j        : Byte;
  Lista    : Marc;

Begin
  Window(22,9,60,14);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  Write('Nombre :');
  Readln(Repuesto.name);
  S:=Repuesto.name;
  If Esta(Repuesto.name,Repuesto,Lista) Then Begin
    clrscr;
    Gotoxy(1,2);
    Writeln('Nombre : ',Repuesto.name);
    Writeln('Valor por unidad : ',Repuesto.costo);
    Writeln('Referencia : ',Repuesto.ref);
    Writeln('Cantidad : ', Repuesto.cantidad);
    Writeln('Sirve a ',Repuesto.N_marcas,' Marca(s)');
    Window(21,15,60,16);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('          Pulse Enter para continuar   ');
    Readln;
    Window(21,15,60,16);
    TextColor(Yellow+Blink);
    TextBackground(Cyan);
    Write('          Ingrese los nuevos datos     ');
    Delay(220);
    Window(21,15,60,16);
    TextColor(Yellow+Blink);
    TextBackground(Cyan);
    Write('                                       ');
    Window(22,9,58,14);
    TextBackGround(Blue);
    Textcolor(White);
    Clrscr;
    Write('Nombre :');
    Readln(Repuesto.name);
    Writeln;
    Write('Valor por unidad :');
    Readln(Repuesto.Costo);
    Writeln;
    Write('Referencia :');
    Readln(Repuesto.ref);
    Writeln;
    Write('Cantidad :');
    Readln(Repuesto.cantidad);
    Clrscr;
    Write('จ A cuantas marcas sirve ? :');
    Readln(Repuesto.N_marcas);
    Writeln; Writeln; Writeln;
    For j:=1 to Repuesto.N_marcas do Begin
      Clrscr;
      Write('จ A cuantas marcas sirve ? :',Repuesto.N_marcas);
      Writeln; Writeln; Writeln;
      Write('Marca #',j,' :');
      Readln(Lista[j]);
    End;
    Guardar(S,Repuesto,Lista);
  End Else
    Mensaje_3;
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('     จDesea buscar otro Repuesto?     ');
  Window(22,9,58,14);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Write('(S/N) : ');
  Repeat
    C:=UpCase(ReadKey);
    Write(C);
  Until (c='S') Or (C='N');

End;





Procedure Modificar;
Const
  a='          Modificar Repuesto         ';

Var
  Otro:Char;

Begin
  Clrscr;
  Window(61,8,61,16);
  TextBackGround(Black);
  Clrscr;
  Window(21,16,60,16);
  TextBackGround(Black);
  Clrscr;
  Window(20,7,60,15);
  TextBackground(Blue);
  Clrscr;
  TextBackground(Cyan);
  Textcolor(DarkGray);
  Gotoxy(2,2);
  Write(a);
  Gotoxy(2,9);
  Write('                                       ');

  Repeat
    Cambio(Otro);
  Until Otro='N';
  Menu(n);

End;



Procedure Revisar(Var C : Char);
Var
  Repuesto : Rep;
  Lista    : Marc;

Begin
  Window(22,9,58,14);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  Write('Nombre : ');
  Readln(Repuesto.name);
  If Esta(Repuesto.name,Repuesto,lista) Then Begin
    clrscr;
    Gotoxy(1,2);
    Writeln('Nombre : ',Repuesto.name);
    Writeln('Valor por unidad : ',Repuesto.costo);
    Writeln('Referencia : ',Repuesto.ref);
    Writeln('Cantidad : ', Repuesto.cantidad);
    Writeln('Sirve a ',Repuesto.N_marcas,' Marca(s)');
    Window(22,15,59,15);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('         Pulse Enter para continuar  ');
    Readln;
  End Else
    Mensaje_3;
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('     จDesea buscar otro Repuesto?     ');
  Window(22,9,58,14);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Clrscr;
  Write('(S/N) : ');
  Repeat
    C:=UpCase(ReadKey);
    Write(C);
  Until (c='S') Or (C='N');

End;


Procedure Consultar;
Const
  a='          Consultar Repuesto         ';

Var
  Otro:Char;

Begin
  Clrscr;
  Window(61,8,61,16);
  TextBackGround(Black);
  Clrscr;
  Window(21,16,60,16);
  TextBackGround(Black);
  Clrscr;
  Window(20,7,60,15);
  TextBackground(Blue);
  Clrscr;
  TextBackground(Cyan);
  Textcolor(DarkGray);
  Gotoxy(2,2);
  Write(a);
  Gotoxy(2,9);
  Write('                                       ');

  Repeat
    Revisar(Otro);
  Until Otro='N';
  Menu(n);

End;

Procedure  Para_Imprimir(R        : Tlista;
                         i        : Byte;
                         Cantidad : list);
Var
  j      : Byte;
  LTotal : List;
  Total  : Word;
  f      : Fecha;

Const
  Days : Array [0..6] of String[4] = ('Dom','Lun','Mar','Mier','Jue','Vier','Sab');
Begin
  GetDate(f.a, f.m, f.d, f.ds);
  If i=0 then
    Exit;
  Writeln(Lst,'');
  Writeln(Lst,'      Factura   ');
  Writeln(Lst,'  Taller  "De Pinhos"');
  Writeln(Lst,'  Caracas - Venezuela');
  Writeln(Lst,'                                                 ',Days[F.ds],'/',F.d,'/',F.m,'/',F.a);
  Writeln(Lst,'');
  Writeln(Lst,' ษอออออออออออหออออออออออออออออออออออหอออออออออหออออออออออหอออออออป ');
  Writeln(Lst,' บ  Cantidad บ  Nombre              บ Num Ref บCosto unidบ Total บ ');
  Writeln(Lst,' ศอออออออออออสออออออออออออออออออออออสอออออออออสออออออออออสอออออออผ ');
  For j:=1 to I do Begin
    Write(Lst,'        ',Cantidad[j+10]:2);
    Write(Lst,'     ',R[j+10].Name:22);
    Write(Lst,'  ',r[j+10].ref:4);
    Write(Lst,'      ',R[j+10].Costo:5);
    Write(Lst,'    ',R[j+10].costo*Cantidad[j+10]:5);
    Writeln(Lst,' ');
  End;
  Writeln(Lst,' ');
  Writeln(Lst,' ');
  Writeln(Lst,' อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ ');
  Writeln(Lst,' ');
  for j:=1 to i do
    LTotal[j]:=R[j].costo*Cantidad[j];
  Total:=0;
  For J:=1 to i do
    Total:=total+LTotal[j];
  Writeln(Lst,'                                           TOTAL A PAGAR : ',Total:5);
End;


Procedure Fact(Var C        : Char;
               Var i        : byte;
               Var Cant     : list;
               Var Repuesto : Tlista);

Var
  Lista    : marc;

Begin
  Inc(I);
  Window(22,9,58,14);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  Write('Nombre :');
  Readln(Repuesto[i].name);
  If Esta(Repuesto[i].name,Repuesto[i],lista) Then Begin
    Writeln;
    Writeln('Referencia :',Repuesto[i].ref);
    Writeln('Valor por unidad :',Repuesto[i].costo);
    Repeat
    Write('Cantidad :');
    Readln(Cant[i]);
    If Cant[i]<Repuesto[i].Cantidad Then
      Writeln('Solo hay ',Repuesto[i].Cantidad,' ',Repuesto[i].Name,'(s)');
    Until cant[i] <= Repuesto[i].cantidad;
    Repuesto[i].cantidad:=repuesto[i].cantidad-cant[i];
    Guardar(Repuesto[i].name,repuesto[i],lista);
    Clrscr;
    Window(22,14,60,15);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('          Pulse Enter para continuar   ');
  End Else Begin
    Mensaje_3;
    I:=0;
  End;
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('    จDesea Facturar otro Repuesto?    ');
  Window(22,9,58,14);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Write('(S/N) : ');
  Repeat
    C:=UpCase(ReadKey);
    Write(C);
  Until (c='S') Or (C='N');
End;




Procedure Facturar;
Const
  a='                Facturar              ';

Var
  Otro     : Char;
  Repuesto : Tlista;
  i        : byte;
  Cant     : list;

Begin
  I:=0;
  Clrscr;
  Window(61,8,61,16);
  TextBackGround(Black);
  Clrscr;
  Window(21,16,60,16);
  TextBackGround(Black);
  Clrscr;
  Window(20,7,60,15);
  TextBackground(Blue);
  Clrscr;
  TextBackground(Cyan);
  Textcolor(DarkGray);
  Gotoxy(2,2);
  Write(a);
  Gotoxy(2,9);
  Write('                                       ');
  Repeat
    Fact(Otro,i,Cant,repuesto);
  Until Otro='N';

  Para_Imprimir(Repuesto, i, Cant);


  Menu(n);

End;









Procedure Mensaje;
Const
  a='              Acerca de...             ';
  b='Facturaciขn y Control';
  c='es un programa que permite';
  d='llevar el control de los repuestos';
  e='y realizar facturas.';

Begin
  Clrscr;
  Window(61,8,61,16);
  TextBackGround(Black);
  Clrscr;
  Window(21,16,60,16);
  TextBackGround(Black);
  Clrscr;
  Window(20,7,60,15);
  TextBackground(Blue);
  Clrscr;
  TextBackground(Cyan);
  Textcolor(DarkGray);
  Gotoxy(2,2);
  Write(a);
  Gotoxy(2,9);
  TextColor(Yellow);
  Write('                       Enter ');
  TextColor(DarkGray);
  Write('= Salida  ');

  Window(21,9,59,14);
  TextBackground(Blue);
  Gotoxy(20 - length(b) div 2,2);
  TextColor(Yellow);
  Write(b);
  Gotoxy(20 - length(c) div 2,3);
  TextColor(White);
  Write(c);
  Gotoxy(20 - length(d) div 2,4);
  Write(d);
  Gotoxy(20 - length(e) div 2,5);
  Write(e);
  Readln;
  Menu(n);
End;

Begin
  Cursor(1,0);
  Clrscr;
  Pantalla;
  n:=1;
  Repeat
    Menu(n);
    C:=ReadKey;
    Case C of
     '1'              : Crear;
     '2'              : Modificar;
     '3'              : Consultar;
     '4'              : Facturar;
     'A'         : Mensaje;
     '5','S','s' : ;
     #13         : Case n of
                     1 : Crear;
                     2 : Modificar;
                     3 : Consultar;
                     4 : Facturar;
                     5 : ;
                   End;
     #0          : Begin
                     c:=ReadKey;
                     Case c of
                       #80 : If n<>5 then Inc(n)
                             Else Begin
                               Sound(800);
                               Delay(110);
                               NoSound
                             End;
                       #72 : If n <>1 then Dec(n)
                             Else Begin
                               Sound(800);
                               Delay(110);
                               NoSound
                             End;
                       #59 : Mensaje;
                       #61 : ;
                     Else Begin
                       Sound(800);
                       Delay(110);
                       NoSound; End
                     End;
                   End;
    Else Begin
      Sound(800);
      Delay(110);
      NoSound; End
    End;
  Until (C='S')or(C='5')or
        (C='s')or(C=#61)or
        ((C=#13)and(n=5));
  Window(1,1,80,25);
  TextBackground(Black);
  Clrscr;
End.