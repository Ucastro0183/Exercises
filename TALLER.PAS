{$A+,B-,D+,E+,F+,G+,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 65520,0,655360}

Program Facturacion;
Uses
  Crt,
  Printer,
  Dos;

Const
  Ruta='Repuesto.SMR';

Type
  tString  = String[12];
  Rep      = Record
               Name               : tString;
               Costo              : Real;
               Ref                : tString;
               Cantidad, N_marcas : Byte;
             End;
  Marc     = Array [1..20] Of tString;
  Fecha    = Record
               D, M, A, Ds : Word;
             End;
  Tlista   = Array [1..50] of Rep;
  list     = Array [1..50] of Byte;
  Llis     = Array [1..50] of marc;

Var
  C : Char;
  N : Byte;

{ Oculta el cursor en el programa }
Procedure cursor(ini,fin:byte);assembler;
Asm
   mov ax,$0100
   mov ch,ini
   mov cl,fin
   int $10
End;


{ Coloca el encabesamiento y la presentaci¢n
  que no cambia del programa                  }
Procedure Pantalla;
Const
  a='                     T a l l e r   " D e   P i n h o s "                        ';
  b='                      Programa de Facturaci¢n y Control                         ';

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
  Write('                                   Use las flechas ',#24,#25,' para escojer su opci¢n    ');
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


{ Subraya, en el menu principal, la linea de Crear }
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


{ Subraya, en el menu principal, la linea de Modificar }
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


{ Subraya, en el menu principal, la linea de Consultar }
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


{ Subraya, en el menu principal, la linea de Facturar }
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


{ Subraya, en el menu principal, la linea de Salir del Programa }
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



{ Coloca el menu principal subrayando la linea
  referida al parametro n                      }
Procedure Menu(var n : byte);
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
  Case n of     { Dependiendo del valor de n subraya }
    1 : menu1;
    2 : menu2;
    3 : menu3;
    4 : menu4;
    5 : menu5;
  End;
End;



{ Crea un nuevo repuesto en el inventario del taller
  no se nesecita verificar que exista el archivo
  porque esto se hace en la funci¢n <Esta> }
Procedure Crear_Nuevo_Inventario(var A : Rep;
                                 var B : Marc);
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
  Close(Inventario);
End;



{ Devuelve un mensaje cuando se desea
  crear algun elemento ya existente   }
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



{ Verifice si algun repuesto S se encuentra en el inventario
  de ser asi dewvuelve verdadero y todos los datos del mismo
  y en el caso opuesto devuelve falso }
Function Esta(var S : tString;
              Var R : Rep;
              Var L : Marc): Boolean;
Var
  Inventario : Text;
  I          : Byte;
  N          : String;

Begin
  Esta:=false;                 { supongo que no se encuentra el repuesto     }
  {$I-}
  Assign(Inventario,Ruta);
  Reset(Inventario);
  If IOResult<>0 then Begin    { verifico que exista el archivo              }
    Rewrite(Inventario);       { si no existe lo creo                        }
    Close(Inventario);
    Assign(Inventario,ruta);
    Reset(Inventario);
  End;
  {$I+}
  Repeat
    Readln(Inventario,N);
    If N=S Then Begin          { si encuentra el repuesto                    }
      R.Name:=N;               { lee los datos del repuesto                  }
      Readln(Inventario,R.Costo);
      Readln(Inventario,R.Ref);
      Readln(Inventario,R.Cantidad);
      Readln(Inventario,R.N_marcas);
      For i:=1 to R.N_Marcas do
        Read(Inventario,L[i]);  { despues de encontrado el repuesto          }
      Esta:=True;               { devuelvo verdadero                         }
      Close(inventario);        { cierra el archivo                          }
      Exit;                     { y sale de la funci¢n                       }
    End;
    Readln(Inventario);
    Readln(Inventario);
    Readln(Inventario);    { solo lee las posiciones donde se encuentren los }
    Readln(Inventario);    { nombres de los repuestos                        }
    Readln(Inventario);
  Until Eof(Inventario);
  Close(Inventario);       { si no se encuenta cierra el archivo y sale      }
End;



{ Pide los datos del nuevo repuesto
  y si no se encuentra lo crea, en
  caso opuesto escribe un mensaje,
  luego devuelve un caracter indicando
  si repite o no el procedimiento       }
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
  If not Esta(Repuesto.name,Repuesto,Lista) Then Begin  {Verifica que no este}
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
    Write('¨ A cuantas marcas sirve ? :');
    Readln(Repuesto.N_marcas);
    Writeln; Writeln; Writeln;
    For j:=1 to Repuesto.N_marcas do Begin
      Clrscr;
      Write('¨ A cuantas marcas sirve ? :',Repuesto.N_marcas);
      Writeln; Writeln; Writeln;
      Write('Marca #',j,' :');
      Readln(Lista[j]);
    End;
    Crear_Nuevo_Inventario(Repuesto,Lista); { Crea el nuevo repuesto         }
  End Else
    Mensaje_2;     { escribe un mensaje indicando que ya se encuentra creado }

  TextBackground(Blue);
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('      ¨Desea crear otro Repuesto?     ');
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



{ Abre una ventana para el procedimiento }
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

  Menu(n);      { devuelve al menu principal }
End;



{ Indica cuando no se encuentra un repuesto espes¡fico }
Procedure Mensaje_3;
Begin
  Clrscr;
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
  TextBackground(Blue);
End;



{ Manda todos los datos del inventario
  a una variable para modificar, no
  verifica el archivo, esto se hace con
  la funcion <Esta>                     }
Procedure Pasar(Var A : TLista;
                Var B : Llis;
                Var N : Word);
Var
  Inventario : Text;
  i, j       : Word;

Begin
  Assign(Inventario,ruta);
  Reset(Inventario);
  i:=0;
  Repeat
    Inc(i);
    Readln(Inventario,A[i].Name);
    Readln(Inventario,A[i].costo);
    Readln(Inventario,A[i].Ref);
    Readln(Inventario,A[i].Cantidad);
    Readln(Inventario,A[i].N_Marcas);
    For j:=1 to A[i].N_Marcas Do
      Read(Inventario,B[i,j]);
    Readln(Inventario);
  Until Eof(Inventario);
  Close(Inventario);
  N:=i;
End;



{ modifica la variable del inventario,
  solo el repuesto a cambiar           }
Procedure Leer(Var A : Tlista ;
               Var B : Llis;
               Var N : word;
               Var S : Tstring;
               var R : Rep;
               var L : Marc);
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



{ Escribe la variable de inventario en
  el archivo de registro del mismo }
Procedure Copiar(var A:Tlista;
                 var B:Llis;
                 var n:word);
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




{ Guarda en el archivo los cambios realizados
  al repuesto de nombre S }
Procedure Guardar(var S : tString;
                  var R : Rep;
                  var L : Marc);
Var
  A : Tlista;
  B : Llis;
  i : Word;

Begin

  Pasar(A,B,i);
  Leer(A,B,i,S,R,L);
  Copiar(A,B,i);

End;



{ Si quiere modificar un repuesto devuelve los datos del mismo
  y recive los nuevos datos cuando este se encuentra en inventario
  si no escribe un mensaje. Devuelve un caracter indicando si se
  quiere repetir o no el procedimento                              }
Procedure Cambio(Var C : Char);
Var
  Repuesto : Rep;
  S        : tString;
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
  If Esta(Repuesto.name,Repuesto,Lista) Then Begin {Verifica que se encuentra}
    clrscr;
    Gotoxy(1,2);
    Writeln('Nombre : ',Repuesto.name);            { Escribe los datos       }
    Writeln('Valor por unidad : ',Repuesto.costo:0:2);
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
    Write('          Introduzca los nuevos datos  ');
    Delay(1500);
    Window(21,15,60,16);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('                                       ');
    Window(22,9,58,14);
    TextBackGround(Blue);
    Textcolor(White);
    Clrscr;                             { Nuevos datos del repuesto }
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
    Write('¨ A cuantas marcas sirve ? :');
    Readln(Repuesto.N_marcas);
    Writeln; Writeln; Writeln;
    For j:=1 to Repuesto.N_marcas do Begin
      Clrscr;
      Write('¨ A cuantas marcas sirve ? :',Repuesto.N_marcas);
      Writeln; Writeln; Writeln;
      Write('Marca #',j,' :');
      Readln(Lista[j]);
    End;
    Guardar(S,Repuesto,Lista);      { Guarda los cambios realizados }
  End Else
    Mensaje_3;
  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('     ¨Desea buscar otro Repuesto?     ');
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



{ Abre una ventana para el procedimiento
  de modificar                           }
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

  Menu(n);              { Vuelve al menu principal }
End;



{ Escribe los datos de un repuesto en la
  pantalla en caso de que este exista y
  si no existe escribe un mensaje, devuelve un
  Caracter indicando si desea repetir o no el
  procedimiento                                }
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
  If Esta(Repuesto.name,Repuesto,lista) Then Begin { Verifica si un existe   }
    clrscr;
    Gotoxy(1,2);
    Writeln('Nombre : ',Repuesto.name);            { escribe los datos       }
    Writeln('Valor por unidad : ',Repuesto.costo:0:2);
    Writeln('Referencia : ',Repuesto.ref);
    Writeln('Cantidad : ', Repuesto.cantidad);
    Writeln('Sirve a ',Repuesto.N_marcas,' Marca(s)');
    Window(22,15,59,15);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('         Pulse Enter para continuar  ');
    Readln;
  End Else
    Mensaje_3;     { si no se encuentra escribe el mensaje                   }

  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('     ¨Desea buscar otro Repuesto?     ');
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



{ Abre una ventana para Consultar los datos de un repuesto }
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



{ Realiza la impresion de la factura
  segun el modelo dado               }
Procedure  Para_Imprimir(Var R        : Tlista;
                         Var i        : Byte;
                         Var Cantidad : list;
                         Var Cliente,Direccion  : string);
Var
  j      : Byte;
  LTotal : Array [1..50] of Real;
  Total  : Real;
  f      : Fecha;
  Cost   : Real;
  fact   : integer;
  Fac    : Text;

Const
  K    ='Imp.num';   { este archivo indica la cantidad de facturas realizadas}

Begin
  {$I-}
  Assign(Fac,K);
  Reset(Fac);
  If IOResult <> 0 Then begin  { Verifica que se encuentra el archivo        }
    Rewrite(fac);              { si no se encuentra lo crea                  }
    close(fac);
    assign(fac,K);
    reset(fac);
  end;
  {$I+}
  If eof(fac) then
    Fact:=0
  Else
    Read(Fac,Fact);
  Close(fac);

  GetDate(f.a, f.m, f.d, f.ds);  { Toma la fecha de la impresi¢n             }
  If i=0 then
    Exit;
  Writeln(lst,'                         T a l l e r  " D e  P i n h o "                        ');
  Writeln(lst,'                              Telefono:                                         ');
  Writeln(lst,'ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
  Writeln(lst,'º Se¤or(es): ',Cliente,' ³ Factura N§: ',fact+1:12,'º');
  Writeln(lst,'ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶');
  Writeln(lst,'º Direccion: ',Direccion,' ³ Fecha:  ',f.D:2,'/',f.M:2,'/',f.A:4,'      º');
  Writeln(lst,'ÇÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¶');
  Writeln(lst,'º Ref. ³         Descripcion         ³   Cantidad    ³   Precio U.³  Precio T. º');
  Writeln(lst,'ÇÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ¶');
  For j:=1 to I do Begin
    Write(Lst,'º');
    Write(Lst,R[j].ref:6,'³');
    Write(Lst,R[j].Name:29,'³');
    Write(Lst,Cantidad[j]:15,'³');
    Write(Lst,R[j].Costo:12:2,'³');
    Cost:=R[j].costo*Cantidad[j];
    Writeln(Lst,Cost:12:2,'º');
  End;
  for j:=1 to i do
    LTotal[j]:=R[j].costo*Cantidad[j];
  Total:=0;
  For J:=1 to i do
    Total:=total+LTotal[j];
  Writeln(lst,'ÈÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÏÍÍÍÍÍÍÍÍÍÍÑÍÏÍÍÍÍÍÍÍÍÍÍÍÍ¹');
  Writeln(lst,'                                                 º  T o t a l   ³',Total:14:2,'º');
  Writeln(lst,'                                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
  Writeln(lst);Writeln(lst);
  Writeln(lst,'    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ           ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
  Writeln(lst,'            Firma Conforme                             Firma Autorizada');

  Inc(Fact);
  Assign(fac,K);
  Rewrite(fac);      { Incrementa el n£mero de facturas realizadas           }
  Writeln(fac,fact);
  Writeln(fac);
  Close(fac);
End;



{ Pide los datos de la venta a realizar devolviendo
  una lista de los repuestos, las cantidades vendidas
  y un caracter que indica si desea o no repetir el
  procedimiento                                       }
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
  Write('Repuesto :');
  Readln(Repuesto[i].name);
  If Esta(Repuesto[i].name,Repuesto[i],lista) Then Begin { Verifica que este }
    Writeln;
    Writeln('Referencia :',Repuesto[i].ref);
    Writeln('Valor por unidad :',Repuesto[i].costo:0:2);
    Repeat
      Writeln('Cantidad :',Repuesto[i].cantidad);
      Write('Venta :');                     { Pide la cantidad a vender      }
      Readln(cant[i]);                      { hasta que sea menor o igual    }
    Until cant[i] <= Repuesto[i].cantidad;  { a la existente                 }
    Repuesto[i].cantidad:=repuesto[i].cantidad-cant[i];
    Guardar(Repuesto[i].name,repuesto[i],lista); {dism la cant segun lo vend }
    Clrscr;
    Window(22,14,60,15);
    TextColor(Yellow);
    TextBackground(Cyan);
    Write('          Pulse Enter para continuar   ');
  End Else Begin
    Mensaje_3;                      { Si no se encuentra devuelve el mensaje }
    Dec(i);
  End;

  Clrscr;
  Window(21,8,58,14);
  Gotoxy(1,1);
  TextBackground(Cyan);
  TextColor(DarkGray);
  Write('    ¨Desea Facturar otro Repuesto?    ');
  Window(22,9,60,14);
  Gotoxy(1,2);
  TextBackground(Blue);
  TextColor(White);
  Clrscr;
  Writeln;
  Write('(S/N) : ');
  Repeat
    C:=UpCase(ReadKey);
    Write(C);
  Until (c='S') Or (C='N');
End;



{ Abre una ventana para la facturaci¢n,
  pide los datos del cliente
  e imprime la factura                 }
Procedure Facturar;
Const
  a='                Facturar              ';

Var
  Otro     : Char;
  Repuesto : Tlista;
  i, m, n  : byte;
  Cant     : list;
  Cliente  : string;
  Direccion : string;

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

  Window(22,9,58,14);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  repeat
    Write('Cliente :');        { nombre del cliente no mayor de 40 caracteres}
    Readln(Cliente);
  Until Length(Cliente)<=40;
  If Length(Cliente)<40 then Begin
    for m:=1 to 39-Length(cliente) do
      Cliente:=Cliente+' ';
  End;
  Writeln;
  Repeat
  Write('Direcci¢n :');      {direcci¢n del cliente no mayor de 40 caracteres}
  Readln(Direccion);
  Until Length(Direccion)<=40;
  If Length(Direccion)<40 then Begin
    for m:=1 to 39-Length(Direccion) do
      Direccion:=Direccion+' ';
  End;
  Para_Imprimir(Repuesto, i, Cant, Cliente, Direccion);
  Window(20,7,60,15);
  TextBackGround(Blue);
  Textcolor(White);
  Clrscr;
  TextBackground(Cyan);
  TextColor(White);
  Gotoxy(2,2);
  Write('          I m p r e s i o n          ');
  Textcolor(Yellow);
  Gotoxy(2,9);
  Write('                 Imprimiendo.          ');
  Delay(500);
  Gotoxy(2,9);
  Write('                 Imprimiendo..         ');
  Delay(500);
  Gotoxy(2,9);
  Write('                 Imprimiendo...        ');
  Delay(500);
  Gotoxy(2,9);
  Write('                 Imprimiendo....      ');
  Delay(500);
  Gotoxy(2,9);
  Write('                 Imprimiendo.....     ');
  Delay(500);

  Menu(n);         {Vuelve al menu prioncipal}
End;



{ Mensaje de ayuda sobre
  el programa             }
Procedure Mensaje;
Const
  a='              Acerca de...             ';
  b='Facturaci¢n y Control';
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
  Readln;                 {sale al presionar <enter>}

  Menu(n);                {Vuelve al menu principal}
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
     'A','a'          : Mensaje;
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