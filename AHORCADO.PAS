Program ahorcado;
Uses Crt;

Var
  palabra:string;
  intentos,i:Byte;
  gana:boolean;

procedure cursor(ini,fin:byte);assembler;
Asm
  mov ax,$0100
  mov ch,ini
  mov cl,fin
  int $10
End;

Procedure Presentacion;
Var
  a:string;
Begin
 clrscr;
 a:='--- Este es el juego del ahorcado ---';
 gotoxy(40-(length(a) div 2),11);
 write(a);
 a:='Press any key to continue...';
 gotoxy(40-(length(a) div 2),13);
 write(a);
 Repeat
 Until keypressed;
 a:=readkey;
End;

Procedure Jugador_1(Var palabra:string;Var N:Byte);
Var
  a,d:string;
  c:char;
  errcode:integer;
Begin
  errcode:=0;
  clrscr;
  gotoxy(5,3);
  a:='Introduzca la palabra que desee que su compa¤ero adivine:';
  Write(a);
  gotoxy(5,8);
  a:='Introduzca el n£mero de intentos que tendr  su compa¤ero (0 - default)';
  Write(a);
  cursor(8,9);
  gotoxy(6,5);

  Readln(palabra);
  cursor(1,0);
  Repeat
    gotoxy(6,10);
    textcolor(LightGray+Blink);
    write('0');
    textcolor(LightGray);
    gotoxy(6,10);
    c:=Upcase(Readkey);
    if c<>#13 then begin
      gotoxy(6,10);
      Write(c);
      readln(d);
      d:=c+d;
      val(d,n,errcode);
      end else n:=0;
      if errcode<>0 then begin
        gotoxy(6,10);
        delline;
        end;
  Until errcode=0;
End;

Procedure mensaje;
Var
  a:string;
Begin
  a:='Presione cualquier tecla para que comience a jugar su compa¤ero';
  gotoxy(75-length(a),12);
  Write(a);
  Repeat
  Until Keypressed;
  a:=readkey;
  clrscr;
End;

Procedure Juego(st:string;n:byte;var gana:boolean);
Var
  c,posicion,aciertos,fallas:byte;
  caracter:char;
Begin
  fallas:=0;
  aciertos:=0;
  clrscr;
  gotoxy(40-(length(st)),4);
  c:=0;
  Repeat
    inc(c);
    Write('_');
    Write(' ')
  Until c=length(st);
  gotoxy(4,6);
  Write('Introduzca la letra con la que desee probar');
  gotoxy(5,7);
  textbackground(lightgray);
  Write(' ');
  textbackground(black);
  Repeat
    gotoxy(5,7);
    caracter:=Upcase(Readkey);
    gotoxy(5,7);
    Write(caracter);
    posicion:=pos(caracter,st);
    if posicion=0then
      Inc(fallas)
      else begin
        repeat
          inc(aciertos);
          st[posicion]:='*';
          gotoxy((40-(length(st)))+2*posicion-2,4);
          Write(caracter);
          posicion:=pos(caracter,st);
        until posicion=0;
      end;
  Until (aciertos=length(st)) or (fallas=n);
  if aciertos=length(st) then
    gana:=true
    else gana:=false;
End;

Procedure ganado;
Var
  a:string;
Begin
  clrscr;
  a:='Muy Bien, Has ganado...';
  gotoxy(40-(length(a)),6);
  Write(a);
  a:='Press any key to continue...';
  gotoxy(75-(length(a)),20);
  Write(a);
  Repeat
  Until Keypressed;
  a:=readkey;
End;

procedure perdido;
Var
  a:string;
Begin
  clrscr;
  a:='Que malo eres, vuelve a intentarlo si quieres...';
  gotoxy(40-(length(a) div 2),6);
  Write(a);
  a:='Press any key to continue...';
  gotoxy(75-(length(a)),20);
  Write(a);
  Repeat
  Until Keypressed;
  a:=readkey;
End;

function salir:boolean;
Var
  c:char;
  m:boolean;
Begin
  c:=' ';
  clrscr;
  gotoxy(3,5);
  Write('Desea repetir el juego: [S/N]:');
  Repeat
    c:=upcase(readkey);
    if not((c='S') or (c='N')) then
      textcolor(lightgray+blink);
    gotoxy(4+length('Desea repetir el juego: [S/N]:'),5);
    Write(c);
    normvideo;
  until (c='S') or (c='N');
  if c='S' then
    m:=false
    else m:=true;
  salir:=m;
  clrscr;
End;

Begin
  textbackground(black);
  clrscr;
  Repeat
    cursor(1,0);
    Presentacion;
    jugador_1(palabra,intentos);
    mensaje;
    If intentos=0 then
      intentos:=length(palabra)+(length(palabra) div 2);
    For i:=1 to length(palabra) do
      palabra[i]:=upcase(palabra[i]);
    Juego(palabra,intentos,gana);
    if gana then
      ganado
      else perdido;
  until salir;
End.