uses crt;
const
  dir : array[1..2,1..8] of shortint =
       ((0,-1,-1,-1, 0, 1, 1, 1),(1, 1, 0,-1,-1,-1, 0, 1));
type
  Tbuscamin = array[1..50,1..50] of shortint;
  dt = array [1..50,1..50] of boolean;
var
  Buscamin        : Tbuscamin;
  M,N,P,i,j,llego : integer;
  ded,tot         : char;
Procedure Cursor (ini,fin:byte); Assembler; {8,0 desaparece 8,9 aparece}
Asm
   mov ax,$0100
   mov ch,ini
   mov cl,fin
   int $10
end; {Cursor}
{***************************NIVELES*****************************************}
procedure Niveles (var m,n,p:integer);
 procedure nivel(let:char ;m,n:integer;var p:integer);
  begin{nivel}
   case let of
    'S': p:= (m*n) div 6;
    'M': p:= ((m*n) div 5)-M DIV 3;
    'A': p:=(m*n) div 5;
    'E': p:= ((m*n) div 5)+M DIV 3;
   end;{case}
  end;{nivel}
 procedure taman(pot:char;var m,n:integer);
  begin{taman}
   case pot of
    'P': begin
          m:=5 ;  n:=5 ;
         end;
    'O': begin
          m:=10;  n:=10;
         end;
    'G': begin
          m:=14;  n:=14;
         end;
    'X': begin
          m:=19;  n:=19;
         end;
   end;{case}
  end;{taman}
 var {niveles}
  let,pot : char;
 begin{niveles}
  clrscr;textbackground(0);
  textcolor(yellow);clrscr;
  writeln('…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª');
  write('∫ INGRESE EL NIVEL:      ');TEXTCOLOR(LIGHTCYAN);WRITE('B');
  textcolor(14);writeln('   ∫');
  write('∫  ');textcolor(RED);write('S');
   textcolor(14);write('encillo              ');TEXTCOLOR(LIGHTCYAN);WRITE('U');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  ');textcolor(RED);write('M');
   textcolor(14);write('edio                 ');TEXTCOLOR(LIGHTCYAN);WRITE('S');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  ');textcolor(RED);write('A');
   textcolor(14);write('vanzado              ');TEXTCOLOR(LIGHTCYAN);WRITE('C');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  ');textcolor(RED);write('E');
   textcolor(14);write('xtra                 ');TEXTCOLOR(LIGHTCYAN);WRITE('A');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫                        ');TEXTCOLOR(LIGHTCYAN);WRITE('M');
   TEXTCOLOR(14);WRITELN('   ∫');
  write('∫ INGRESE EL TAMA•O:     ');TEXTCOLOR(LIGHTCYAN);WRITE('I');
   TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  ');textcolor(RED);write('P');
   textcolor(14);write('eque§o               ');TEXTCOLOR(LIGHTCYAN);WRITE('N');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  medi');textcolor(RED);write('O');
   textcolor(14);write('                 ');TEXTCOLOR(LIGHTCYAN);WRITE('A');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  ');textcolor(RED);write('G');
   textcolor(14);write('rande                ');TEXTCOLOR(LIGHTCYAN);WRITE('S');TEXTCOLOR(14);WRITELN('   ∫');
  write('∫  e');textcolor(RED);write('X');
   textcolor(14);writeLN('tra                     ∫');
  write('»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº');
  gotoxy(3,2);
  textcolor(yellow); write('INGRESE EL NIVEL:');
  repeat
   gotoxy(21,2);write(' ');
   let:=readkey;
   let:=upcase(let);
   gotoxy(21,2);
   write(let);
  until (let='S')or(let='A')or(let='M')or(let='E');
  gotoxy(3,8);
  textcolor(YELLOW); write('INGRESE EL TAMA•O:');
  repeat
   gotoxy(21,8);
   write(' ');
   pot:=readkey;
   pot:=upcase(pot);
   gotoxy(21,8);
   write(pot);
  until (pot='P')or(pot='G')or(pot='O')or(pot='X');
  taman(pot,m,n);
  nivel(let,m,n,p);
  clrscr;
 end;{niveles}
{*************************LLENAR*******************************************}
 Procedure Llenar(var Buscamin : TBuscamin; M, N, P : integer);
 var{Llenar}
  i, j, k, minas : integer;
 begin {llenar}
  minas := 0;
  repeat
   i := random(M)+2;
   j := random(N)+2;
   if Buscamin[i,j] = 0 then begin
    Buscamin[i,j] := -1;
    inc(minas);
   end;
  until minas = p;
  for i := 1 to M+2 do begin
   Buscamin[i,1] := -2;
   Buscamin[i,N+2] := -2;
  end;
  for j := 2 to N+1 do begin
   Buscamin[1,j] := -2;
   Buscamin[M+2,j] := -2;
  end;
  for i := 2 to M+1 do
   for j := 2 to N+1 do
    if Buscamin[i,j] = -1 then
     for k:= 1 to 8 do
      if Buscamin[i+dir[1,k],j+dir[2,k]] >= 0 then
       Buscamin[i+dir[1,k],j+dir[2,k]]:= Buscamin[i+dir[1,k],j+dir[2,k]] + 1;
 end;{llenar}
{*************************DESTAPAR******************************************}
 Procedure Destapar (var i,j:integer);
  begin{destapar}
   textbackground(blue);
   gotoxy(j*4+(40-((n+1) div 2)*4)-6,i+(12 - (m+1) div 2));
   if buscamin[i,j]=-1 then begin   textcolor(red); write('  Ë ');
   end else begin   textcolor(lightgreen);
    if buscamin[i,j]=0 then   write('    ')
    else   write('  ',buscamin[i,j],' ');
   end;
 end;{destapar}
{*************************BLANCO********************************************}
 Procedure Blanco(var destapado:dt;i,j:integer;var llego:integer);
  begin{blanco}
   if (buscamin[i,j]=0 )and(not destapado[i,j])and(i>=2)and(i<=(m+1))and( j<=(n+1))and(j>=2) then begin
     dec(llego);
     destapado[i,j]:=true;         destapar(i,j);
     blanco(destapado,i-1,j-1,llego);    blanco(destapado,i+1,j+1,llego);
     blanco(destapado,i,j+1,llego);      blanco(destapado,i,j-1,llego);
     blanco(destapado,i-1,j,llego);      blanco(destapado,i+1,j,llego);
     blanco(destapado,i-1,j+1,llego);    blanco(destapado,i+1,j-1,llego);
  end else
   if (buscamin[i,j]>=1)and((buscamin[i,j]<=7))and(not destapado[i,j])and(i>=2)and(i<=(m+1))and( j<=(n+1))and(j>=2) then begin
     dec(llego);  destapado[i,j]:=true;     destapar(i,j);
   end;
 end;{blanco}
{*************************TELON*********************************************}
 procedure telon(i,j:integer;p:boolean);
  begin{telon}
     gotoxy(j*4+(40-((n+1) div 2)*4)-6,i+(12 - (m+1) div 2));
     if p then begin
      if ((i mod 2=0)and(j mod 2=0))or((i mod 2=1)and(j mod 2=1)) then begin
       textcolor(cyan); write('€€€');
       textbackground(cyan);textcolor(4);write(chr(4));
      end else begin
       textcolor(7); write('€€€');
       textbackground(7);textcolor(4);write(chr(4));
      end;
     end else begin
      if ((i mod 2=0)and(j mod 2=0))or((i mod 2=1)and(j mod 2=1)) then begin
       textcolor(cyan); write('€€€€');
      end else begin
       textcolor(7); write('€€€€');
      end;
     end;
  end;{telon}
{*************************PRESS*********************************************}
 procedure press(i,j:integer;p:boolean);
  begin{press}
   gotoxy(j*4+(40-((n+1) div 2)*4)-6,i+(12 - (m+1) div 2));
     if p then begin
      if ((i mod 2=0)and(j mod 2=0))or((i mod 2=1)and(j mod 2=1)) then begin
       textcolor(cyan); write('€');textbackground(cyan);textcolor(0);write(chr(1));
       textcolor(cyan); write('€');textbackground(cyan);textcolor(4);write(chr(4));
      end else begin
       textcolor(7); write('€');textbackground(7);textcolor(0);write(chr(1));
       textcolor(7); write('€');textbackground(7);textcolor(4);write(chr(4));
      end;
     end else begin
      if ((i mod 2=0)and(j mod 2=0))or((i mod 2=1)and(j mod 2=1)) then begin
      textcolor(cyan); write('€');textbackground(cyan);textcolor(0);write(chr(1));
      textcolor(cyan); write('€€');
      end else begin
      textcolor(7); write('€');textbackground(7);textcolor(0);write(chr(1));
       textcolor(7); write('€€');
      end;
     end;
  end;{press}
{***************************NOPRESS*****************************************}
 procedure nopress(i,j:integer);
  begin{nopress}
   textbackground(blue);
   destapar(i,j);
   gotoxy(j*4+(40-((n+1) div 2)*4)-6,i+(12 - (m+1) div 2));
   textcolor(0);
   write(' ',chr(1));
  end;{nopress}
{***************************INTERACTUAR*************************************}
procedure interactuar(var buscamin:tbuscamin;m,n,p:integer;var llego:integer);
 var {interactuar}
  i,j,ti,tj,puntos,minas  : integer;
  car               : char;
  destapado,marcado : dt;
  explosion         : boolean;
 begin{interactuar}
  minas:=p;  explosion:=false;  puntos:=0;
  for i:= 2 to m+1 do
   for j:= 2 to n+1 do begin
    DESTAPADO[I,J]:=FALSE;
    MARCADO[I,J]:=FALSE;
   end;
  for i:= 2 to m+1 do
   for j:= 2 to n+1 do
    telon(i,j,false);
  gotoxy(1,1);
  textcolor(yellow);
  write('Puntos: ');
  textcolor(LIGHTGREEN);
  gotoxy(60,1); write('Total minas: ',minas);
  i:=2;j:=2; llego:=m*n;
  press(i,j,false);
  gotoxy(j*4+(40-((n+1) div 2)*4)-6,i+(12 - (m+1) div 2));
  repeat
   car:=readkey;
   if car=#0 then
    car:=readkey;
   case car of
     'H' : begin
            ti:=i;
            i:=i-1;
            if i<2 then
             i:=m+1;
            if not destapado[i,j] then
             press(i,j,marcado[i,j])
            else
             nopress(i,j);
            if not destapado[ti,j] then
             telon(ti,j,marcado[ti,j])
            else begin
             destapar(ti,j);
            end;
           end;
     'P' : begin
            ti:=i;
            i:=i+1;
            if i>m+1 then
             i:=2;
            if not destapado[i,j] then
             press(i,j,marcado[i,j])
            else
             nopress(i,j);
            if not destapado[ti,j] then
             telon(ti,j,marcado[ti,j])
            else begin
             destapar(ti,j);
            end;
           end;
     'K' : begin
            tj:=j;
            dec(j);
            if j<2 then
             j:=n+1;
            if not destapado[i,j] then
             press(i,j,marcado[i,j])
            else
             nopress(i,j);
            if not destapado[i,tj] then
             telon(i,tj,marcado[i,tj])
            else begin
             destapar(i,tj);
            end;
           end;
     'M' : begin
            tj:=j;
            inc(j);
            if j>n+1 then
             j:=2;
            if not destapado[i,j] then
             press(i,j,marcado[i,j])
            else
             nopress(i,j);
            if not destapado[i,tj] then
             telon(i,tj,marcado[i,tj])
            else begin
             destapar(i,tj);
            end;
           end;
    #32: begin
             if not destapado[i,j] then begin
              if marcado[i,j] then begin
               marcado[i,j]:=false;
               inc(minas);
               press(i,j,false);
              end else begin
               marcado[i,j]:=true;
               dec(minas);
               press(i,j,true);
              end;
              textbackground(0);textcolor(10);
              gotoxy(73,1);write('  ');gotoxy(73,1);write(minas);
             end;
         end;
    end;{case}
    if (car=#13) and (not destapado[i,j]) then  begin
     gotoxy(9,1);
     case buscamin[i,j] of
       1: inc(puntos);   2: inc(puntos,2); 3: inc(puntos,3); 4: inc(puntos,4);
       5: inc(puntos,5); 6: inc(puntos,6); 7: inc(puntos,7); 8: inc(puntos,8);
     end;{case}
     textbackground(red);  textcolor(yellow);
     write(puntos:4);
     if buscamin[i,j]<>-1 then begin
      if buscamin[i,j]=0 then
       blanco(destapado,i,j,llego)
      else  begin destapado[i,j]:=true;
      dec(llego); end;
      nopress(i,j);
     end else begin
      explosion:=true;
      for i:= 2 to m+1 do
       for j:= 2 to n+1 do
        destapar(i,j);
     end;
    end;
   until explosion or (llego=p);
 end;{interactuar}
{***************************PRINCIPAL***************************************}
Begin {principal}
 repeat
  Cursor(8,9);
  niveles(m,n,p);
  Cursor(8,0);
  Clrscr;
  textbackground(0);
  randomize;
  clrscr;
  for i:= 1 to 20 do
   for j:= 1 to 20 do
    buscamin[i,j]:=0;
  Llenar(Buscamin, M, N, P);
  Interactuar(buscamin,m,n,p,llego);
  if llego=p then begin
   textbackground(red); textcolor(yellow+blink);
   gotoxy(33,1); write('  GANASTE!!!  ');
   repeat
    gotoxy(25,25);
    textcolor(white);
    write('®Deseas jugar otra vez? (S/N) ');
    ded:=readkey;
   until ded in ['n','N','s','S'];
   tot:='s';
  end else begin
   repeat
    gotoxy(25,25);
    textcolor(white);
    write('®Desea intentar de nuevo? (S/N) ');
    tot:=readkey;
   until tot in ['n','N','s','S'];
   ded:='s';
  end;
 until (ded='N')or(ded='n')or(tot='N')or(tot='n');
 Cursor(8,9);
end.{principal}