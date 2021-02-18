Program Puzzler;
Uses
  Crt;

type
  mat=array [1..5,1..5]of char;

Var
  a:mat;
  t,t1:text;
  w,i,j:byte;
  c,s:char;
  l:string;
  sal,final,code:boolean;
  cont:integer;

procedure presentacion;
var
n:char;
Begin
  Window(26,9,55,17);
  textcolor(white+blink);
  Write('..............................');
  Write('..............................');
  Write('..                          ..');
  Write('.. ');
  textcolor(white);
  Write('PROYECTO DE PROGRAMACION');
  textcolor(white+blink);
  Write(' ..');
  Write('..          ');
  textcolor(white);
  Write('PUZZLE');
  textcolor(white+blink);
  Write('          ..');
  Write('..                          ..');
  Write('..............................');
  Write('..............................');
  Window(1,1,80,25);
  Textcolor(lightgray);
  Gotoxy(45,25);
  Write('Presione una tecla para continuar...');
  Repeat
  Until Keypressed;
  n:=readkey;
end;

Procedure swap(var i,j:char);
Var
  k:char;
Begin
  k:=i; i:=j; j:=k;
End;

procedure escribe(a:mat);
Begin
  TextBackGround(lightgray);
  clrscr;
  Gotoxy(15,5);
  Textcolor(White);
  Write('Puzzle #',cont,':');
  Window(26,9,56,19);
  Textbackground(black);
  clrscr;
  Window(25,8,55,18);
  Textbackground(Blue);
  clrscr;
  Writeln;
  for i:=1 to 5 do begin
    for j:=1 to 5 do
    if j=1 then
      Write(a[i,j]:4)
    else
      Write(a[i,j]:6);
    Writeln;
    if i<>5 then
    Writeln;
  end;
  window(1,1,80,25);
  delay(500);
end;

procedure escribe_t(a:mat;n:integer;code:boolean);
Begin
  Writeln(t1,'Puzzle #',n,':');
  if not code then
    for i:=1 to 5 do begin
      for j:=1 to 5 do
        if j=1 then
          Write(t1,a[i,j]:1)
        else
          Write(t1,a[i,j]:2);
      Writeln(t1);
    end
  else begin
    Writeln(t1,'Este rompecabezas no tiene ninguna configuraci¢n final.');
    Writeln(t1);
  end;
  Writeln(t1);
end;

procedure arriba(var a:mat;var code:boolean);
Var
  sal:boolean;
  n,m:byte;
Begin
  sal:=false;
  for n:=1 to 5 do begin
    for m :=1 to 5 do
      if a[n,m]=' ' then begin
        sal:=true;
        break;
      end;
    if sal then
      Break;
    end;
  if (n-1)<1 then begin
    code:=true;
    exit
  end;
  swap(a[n,m],a[n-1,m]);
  escribe(a);
End;

procedure abajo(var a:mat;var code:boolean);
Var
  sal:boolean;
  n,m:byte;
Begin
  sal:=false;
  for n:=1 to 5 do begin
    for m :=1 to 5 do
      if a[n,m]=' ' then begin
        sal:=true;
        break;
      end;
    if sal then
      Break;
    end;
  if (n+1)>5 then begin
    code:=true;
    exit
  end;
  swap(a[n,m],a[n+1,m]);
  escribe(a);
End;

procedure derecha(var a:mat;var code:boolean);
Var
  sal:boolean;
  n,m:byte;
Begin
  sal:=false;
  for n:=1 to 5 do begin
    for m :=1 to 5 do
      if a[n,m]=' ' then begin
        sal:=true;
        break;
      end;
    if sal then
      Break;
    end;
  if (m+1)>5 then begin
    code:=true;
    exit
  end;
  swap(a[n,m],a[n,m+1]);
  escribe(a);
End;

procedure izquierda(var a:mat;var code:boolean);
Var
  sal:boolean;
  n,m:byte;
Begin
  sal:=false;
  for n:=1 to 5 do begin
    for m :=1 to 5 do
      if a[n,m]=' ' then begin
        sal:=true;
        break;
      end;
    if sal then
      Break;
    end;
  if (m-1)<1 then begin
    code:=true;
    exit
  end;
  swap(a[n,m],a[n,m-1]);
  escribe(a);
End;

Begin
  Textbackground(Black);
  clrscr;
  presentacion;
  Assign(t,'puzzle.in');
  Assign(t1,'puzzle.out');
  Reset(t);
  Rewrite(t1);
  Repeat
    inc(cont);
    code:=false;
    for i:=1 to 5 do  begin
        readln(t,l);
        if l='Z' then begin
          final:=true;
          Break;
        End;
        for j:=1 to 5 do
            a[i,j]:=l[j];
        if length(l)=4 then
            a[i,5]:=' '
    end;
    if final then
      Break;
    escribe(a);
    Repeat
          readln(t,L);
          sal:=false;
          for w:= 1 to length(l) do begin
                s:=upcase(l[w]);
                case s of
                    'Z' : begin sal:=true; break; end;
                    '0' : begin sal:=true; break; end;
                    'A' : arriba(a,code);
                    'B' : abajo(a,code);
                    'R' : derecha(a,code);
                    'L' : izquierda(a,code)
                  else  begin
                      code:=true; sal:=true; break
                  end;
                end;
            if code then break;
          end;
          if code or sal then
            break;
    Until false;
    Escribe_t(A,cont,code);
    Textcolor(White);
    TextBackground(lightgray);
    Gotoxy(30,23);
    Writeln('Presione <Enter> para continuar ');
    Readln;
  Until (s='Z')or (s='z');
  Textcolor(lightgray);
  Textbackground(Black);
  clrscr;
  Close(t);
  Close(t1);
End.