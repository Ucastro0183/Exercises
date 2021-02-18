Program Proyecto;

Uses Crt;

Type
  Tnotas = Array [1..60] of real;
  Reg = Record
          Name, LName: String[10];
          CI: String[8];
          Sex: (F,M);
          Edo_C: (S,C,V,D,O);
          Esc: 0..7;
          M_ap: BYTE;
          N_ap: TNOTAS;
        End;
  Arreg = Array [1..100] of REG;

Var
  FI: Arreg;
  n : Word;
  op: byte;

{--------------------------------------------------------}
Procedure Menu(Var op: byte);
Var
  ch: char; C: integer;
Begin
  Clrscr;
  GotoXY(36,2);
  Writeln('- MENU -');
  Writeln;
  GotoXY(8,5);
  Writeln('1.- Mostrar datos de un estudiante.');
  GotoXY(8,7);
  Writeln('2.- Modificar datos de un estudiante.');
  GotoXY(8,9);
  Writeln('3.- Introducir datos de estudiantes por escuela.');
  GotoXY(8,11);
  Writeln('4.- Presentar los promedios de los estudiantes.');
  GotoXY(8,13);
  Writeln('5.- Presentar estudiantes por Sexo y Edo. Civil.');
  GotoXY(8,15);
  Writeln('6.- Total de Mat. Ap. por Sexo y Edo. Civil.');
  GotoXY(8,17);
  Writeln('7.- Estado Civil con mayor cantidad de Mat. Ap.');
  GotoXY(8,19);
  Writeln('8.- Escuelas con mayor Cantidad de estudiantes');
  GotoXY(50,22);
  Writeln('Presione [ESC] para salir.');
  Repeat
    GotoXY(5,23);
    Write('Que opcion desea ejecutar: ');
    ch:=UpCase(ReadKey);
    if not (ch in ['1'..'8',#27]) then Begin
      GotoXY(33,23);
      TextColor(LightGray+Blink);
      Write(#8);
      Write(ch);
      TextColor(LightGray);
    End Else
      if Ch in ['1'..'8'] then
        Val(ch,op,c)
      Else
        op:=10;
  Until ch in ['1'..'8',#27];
End;

{--------------------------------------------------------}
Procedure Muestra(Alumn: Reg);
Begin
  Clrscr;
  Writeln;
  Writeln('Nombre del Estudiante: ',Alumn.Name,' ',Alumn.LName);
  Writeln('N£mero de C‚dula: ',Alumn.CI);
  Writeln;
  Write('Sexo: ');
  If Alumn.Sex=F then
    Writeln('Femenino')
  Else
    Writeln('Masculino');
  Write('Estado civil: ');
  Case Alumn.Edo_c of
    S: Writeln('Soltero');
    C: Writeln('Casado');
    V: Writeln('Viudo');
    D: Writeln('Divorciado');
    O: Writeln('Otro');
  End;
  Write('Escuela: ');
  Case Alumn.Esc of
    0: Writeln('Escuela B sica');
    1: Writeln('Civil');
    2: Writeln('El‚ctrica');
    3: Writeln('Geolog¡a');
    4: Writeln('Mec nica');
    5: Writeln('Metalurgia');
    6: Writeln('Qu¡mica');
    7: Writeln('Petr¢leo');
  End;
  Writeln('N£mero de materias aprobadas: ',Alumn.M_ap);
  GotoXY(1,25);
  Readln;
End;

{--------------------------------------------------------}
Procedure Buscar(n: word);
Var
  i: integer;
  CI: string;
  Esta: Boolean;
Begin
  Clrscr;
  Write('Introduzca el n£mero de c‚dula del estudiante a mostrar: ');
  Readln(CI);
  Esta:=False;
  For i:=1 to n do Begin
    if FI[i].CI=CI then Begin
      Muestra(FI[i]);
      Esta:=True;
    End;
  End;
  If not esta then Begin
    Writeln;
    Write('No se encontr¢ el estudiante especificado.');
    GotoXY(1,25);
    Readln;
  End;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Nuevos_datos(Var FI: Arreg; i: byte);
Var
  CH: Char;
  j: Byte;
Begin
  Clrscr;
  Writeln;
  Write('Nombre del Estudiante: ');
  Readln(FI[i].Name);
  Write('Apellido del Estudiante: ');
  Readln(FI[i].LName);
  Write('N£mero de C‚dula: ');
  Readln(FI[i].CI);
  Writeln;
  Write('Sexo (M/F): ');
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['M','F',#13] then
      Case CH of
        #13: Break;
        'M': Begin
               GotoXY(13,6);
               ClrEol;
               FI[i].Sex:=M;
               Writeln('Masculino');
             End;
        'F': Begin
               GotoXY(13,6);
               ClrEol;
               FI[i].Sex:=F;
               Writeln('Femenino');
             End;
      End
    Else Begin
      GotoXY(14,6);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until CH=#13;
  Write('Estado civil (S,C,D,V,O): ');
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['S','C','D','V','O',#13] then
      Case CH of
        'S': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=S;
               Writeln('Soltero');
             End;
        'C': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=C;
               Writeln('Casado');
             End;
        'V': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=V;
               Writeln('Viudo');
             End;
        'D': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=D;
               Writeln('Divorciado');
             End;
        'O': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=O;
               Writeln('Otro');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(28,7);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until CH=#13;
  Write('Escuela: ');
  Write('0:B sica. 1:Civil. 2:El‚ct. 3:Geolog. 4:Mec nica. 5:Metalurg. 6:Qu¡m. 7:Petr¢.');
  GotoXY(37,WhereY-1);
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['1'..'7','0',#13] then
      Case CH of
        '0': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=0;
               Writeln('Escuela B sica');
             End;
        '1': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=1;
               Writeln('Civil');
             End;
        '2': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=2;
               Writeln('El‚ctrica');
             End;
        '3': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=3;
               Writeln('Geolog¡a');
             End;
        '4': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=4;
               Writeln('Mec nica');
             End;
        '5': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=5;
               Writeln('Metalurgia');
             End;
        '6': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=6;
               Writeln('Qu¡mica');
             End;
        '7': Begin
               GotoXY(10,8);
               ClrEol;
               FI[i].Esc:=7;
               Writeln('Petr¢leo');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(11,8);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until CH=#13;
  GotoXY(1,WhereY+2);
  Write('N£mero de materias aprobadas: ');
  Readln(FI[i].M_ap);
  Writeln('Introduzca las ',FI[i].M_ap,' notas:');
  For j:=1 to FI[i].M_ap do Begin
    Write('Nota ',j,': ');
    Readln(FI[i].N_ap[j]);
  End;
  Write('Presione <Enter> para obserVar los datos.');
  GotoXY(1,25);
  Readln;
End;

{--------------------------------------------------------}
Procedure Modificar(Var FI: Arreg;n: word);
Var
  i: Word;
  CI: string[8];
  Cambio: Boolean;
Begin
  Clrscr;
  Write('Introduzca el n£mero de c‚dula del estudiante a modificar: ');
  Readln(CI);
  Cambio:=False;
  For i:=1 to n do Begin
    if FI[i].CI=CI then Begin
      Muestra(FI[i]);
      Nuevos_datos(FI,i);
      Muestra(FI[i]);
      Cambio:=True;
    End;
  End;
  If Not Cambio then Begin
    Writeln;
    Write('No se encontr¢ el estudiante especificado.');
    GotoXY(1,25);
    Readln;
  End;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Nuevos_Estudiantes(Var FI: Arreg; i: byte);
Var
  CH: Char;
  j: Byte;
Begin
  Clrscr;
  Writeln;
  Write('Nombre del Estudiante: ');
  Readln(FI[i].Name);
  Write('Apellido del Estudiante: ');
  Readln(FI[i].LName);
  Write('N£mero de C‚dula: ');
  Readln(FI[i].CI);
  Writeln;
  Write('Sexo (M/F): ');
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['M','F',#13] then
      Case CH of
        'M': Begin
               GotoXY(13,6);
               ClrEol;
               FI[i].Sex:=M;
               Writeln('Masculino');
             End;
        'F': Begin
               GotoXY(13,6);
               ClrEol;
               FI[i].Sex:=F;
               Writeln('Femenino');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(14,6);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until CH=#13;
  Write('Estado civil (S,C,D,V,O): ');
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['S','C','D','V','O',#13] then
      Case CH of
        'S': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=S;
               Writeln('Soltero');
             End;
        'C': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=C;
               Writeln('Casado');
             End;
        'V': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=V;
               Writeln('Viudo');
             End;
        'D': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=D;
               Writeln('Divorciado');
             End;
        'O': Begin
               GotoXY(27,7);
               ClrEol;
               FI[i].Edo_c:=O;
               Writeln('Otro');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(28,7);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until CH=#13;
  Write('N£mero de materias aprobadas: ');
  Readln(FI[i].M_ap);
  Writeln('Introduzca las ',FI[i].M_ap,' notas:');
  For j:=1 to FI[i].M_ap do Begin
    Write('Nota ',j,': ');
    Readln(FI[i].N_ap[j]);
  End;
  Write('Presione <Enter> para continuar.');
  GotoXY(1,25);
  Readln;
End;

{--------------------------------------------------------}
Procedure Datos_Escuela(Var FI: Arreg;Var n: word);
Var
  i, Esc, m: Word;
  ch: Char;
  cod: Integer;
Begin
  Clrscr;
  Writeln;
  Write('Introduzca el c¢digo de la escuela: ');
  Write('0:B sica. 1:Civil. 2:El‚ct. 3:Geolog. 4:Mec nica. 5:Metalurg. 6:Qu¡m. 7:Petr¢.');
  GotoXY(37,WhereY-1);
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['1'..'7','0',#13] then Begin
      Case CH of
        '0': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Escuela B sica');
             end;
        '1': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Civil');
             End;
        '2': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('El‚ctrica');
             End;
        '3': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Geolog¡a');
             End;
        '4': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Mec nica');
             End;
        '5': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Metalurgia');
             End;
        '6': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Qu¡mica');
             End;
        '7': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Petr¢leo');
             End;
        #13: Break;
      End;
      if CH<>#13 then Val(CH,Esc,cod);
    End Else Begin
      GotoXY(39,2);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
  Until (CH=#13)and(Esc in [1..7]);
  GotoXY(1,WhereY+2);
  Write('Introduzca el n£mero de estudiantes de la escuela: ');
  Readln(m);
  For i:=n+1 to m+n do Begin
    FI[i].Esc:=Esc;
    Nuevos_Estudiantes(FI,i);
  End;
  n:=n+m;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Promedios(n: word);
Var
  i, j: Word;
  suma: real;
Begin
  Clrscr;
  Writeln;
  Writeln('   Nombre                               Promedio');
  Writeln;
  for i:=1 to n do Begin
    if (i mod 21)=0 then Begin
      GotoXY(10,25);
      Write('Presione <Enter> para continuar');
      GotoXY(1,25);
      Readln;
      Clrscr;
      Writeln;
      Writeln('   Nombre                               Promedio');
      Writeln;
    End;
    for j:=1 to FI[i].M_ap do
      suma:= FI[i].N_ap[j] + Suma;
    Suma:= suma / FI[i].M_ap;
    Writeln(FI[i].Name:20,',  ',FI[i].LName:20,'  ',Suma:5:2);
  End;
  GotoXY(1,25);
  Readln;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Estudiantes(n: word);
Var
  i: Word;
  code, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10: integer;
  Esc: Byte;
  CH: Char;
Begin
  Clrscr;
  S1:=0; S2:=0; S3:=0; S4:=0; S5:=0;
  S6:=0; S7:=0; S8:=0; S9:=0; S10:=0;
  Writeln;
  Writeln('Introduzca el c¢digo de la escuela: ');
  Write('0:B sica. 1:Civil. 2:El‚ct. 3:Geolog. 4:Mec nica. 5:Metalurg. 6:Qu¡m. 7:Petr¢.');
  GotoXY(37,WhereY-1);
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['1'..'7','0',#13] then
      Case CH of
        '0': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Escuela B sica');
             End;
        '1': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Civil'); End;
        '2': Begin
               GotoXY(38,2);
               ClrEol;
               Write('El‚ctrica');
             End;
        '3': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Geolog¡a');
             End;
        '4': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Mec nica');
             End;
        '5': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Metalurgia');
             End;
        '6': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Qu¡mica');
             End;
        '7': Begin
               GotoXY(38,2);
               ClrEol;
               Write('Petr¢leo');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(39,2);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
    if CH<>#13 then Val(CH,Esc,code);
  Until (CH=#13)and(Esc in [1..7]);
  GotoXY(1,WhereY+2);
  for i:=1 to n do Begin
    if FI[i].Esc=Esc then
      if FI[i].Sex=M Then
        Case FI[i].Edo_c of
          S: Inc(S1);
          C: Inc(S2);
          V: Inc(S3);
          D: Inc(S4);
          O: Inc(S5);
        End
      Else
        Case FI[i].Edo_c of
          S: Inc(S6);
          C: Inc(S7);
          V: Inc(S8);
          D: Inc(S9);
          O: Inc(S10);
        End;
  End;
  Writeln;
  Writeln('               Cantidad de Estudiantes por Sexo y Estado Civil                ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('                . Soltero . Casado . Viudo . Divorciado . Otro . Total        ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('        Hombres .   ',S1:2,'    .   ',S2:2,'   .   ',S3:2,'  .     ',S4:2,'     .  ',S5:2,'  .   '
           ,S1+S2+S3+S4+S5:2,'  ');
  Writeln('        Mujeres .   ',S6:2,'    .   ',S7:2,'   .   ',S8:2,'  .     ',S9:2,'     .  ',S10:2,'  .   '
           ,S6+S7+S8+S9+S10:2,'  ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('         Total  .   ',S1+S6:2,'    .   ',S2+S7:2,'   .   ',S3+S8:2,'  .     ',S4+S9:2,'     .  ',S5+S10:2,'  .   '
           ,S1+S6:2,'  ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln;
  GotoXY(1,25);
  Readln;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Materias(n: word);
Var
  i: Word;
  code, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10: integer;
  Esc: Byte;
  CH: Char;
Begin
  Clrscr;
  S1:=0; S2:=0; S3:=0; S4:=0; S5:=0;
  S6:=0; S7:=0; S8:=0; S9:=0; S10:=0;
  Writeln;
  Write('Introduzca el c¢digo de la escuela: ');
  Write('0:B sica. 1:Civil. 2:El‚ct. 3:Geolog. 4:Mec nica. 5:Metalurg. 6:Qu¡m. 7:Petr¢.');
  GotoXY(37,WhereY-1);
  Repeat
    CH:=Upcase(Readkey);
    if CH in ['1'..'7','0',#13] then
      Case CH of
        '0': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Escuela B sica');
             End;
        '1': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Civil'); End;
        '2': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('El‚ctrica');
             End;
        '3': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Geolog¡a');
             End;
        '4': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Mec nica');
             End;
        '5': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Metalurgia');
             End;
        '6': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Qu¡mica');
             End;
        '7': Begin
               GotoXY(38,2);
               ClrEol;
               Writeln('Petr¢leo');
             End;
        #13: Break;
      End
    Else Begin
      GotoXY(39,2);
      TextColor(LightGray+Blink);
      Write(#8);
      ClrEol;
      Write(ch);
      TextColor(LightGray);
    End;
    if CH<>#13 then Val(CH,Esc,code);
  Until (CH=#13)and(Esc in [1..7]);
  GotoXY(1,WhereY+2);
  for i:=1 to n do Begin
    if FI[i].Esc=Esc then
      if FI[i].Sex=M Then
        Case FI[i].Edo_c of
          S: S1:=S1+FI[i].M_ap;
          C: S2:=S2+FI[i].M_ap;
          V: S3:=S3+FI[i].M_ap;
          D: S4:=S4+FI[i].M_ap;
          O: S5:=S5+FI[i].M_ap;
        End
      Else
        Case FI[i].Edo_c of
          S: S6:=S6+FI[i].M_ap;
          C: S7:=S7+FI[i].M_ap;
          V: S8:=S8+FI[i].M_ap;
          D: S9:=S9+FI[i].M_ap;
          O: S10:=S10+FI[i].M_ap;
        End;
  End;
  Writeln;
  Writeln('              Cantidad de Materias Aprobadas por los estudiantes              ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('                . Soltero . Casado . Viudo . Divorciado . Otro . Total        ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('        Hombres .   ',S1:2,'    .   ',S2:2,'   .   ',S3:2,'  .     ',S4:2,'     .  ',S5:2,'  .   '
           ,S1+S2+S3+S4+S5:2,'  ');
  Writeln('        Mujeres .   ',S6:2,'    .   ',S7:2,'   .   ',S8:2,'  .     ',S9:2,'     .  ',S10:2,'  .   '
           ,S6+S7+S8+S9+S10:2,'  ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln('         Total  .   ',S1+S6:2,'    .   ',S2+S7:2,'   .   ',S3+S8:2,'  .     ',S4+S9:2,'     .  ',S5+S10:2,'  .   '
           ,S1+S6:2,'  ');
  Writeln('       ----------------------------------------------------------------       ');
  Writeln;
  GotoXY(1,25);
  Readln;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Edo_mas_materia(n: word);
Var
  i: Word;
  May, s1, s2, s3, s4, s5: integer;
  Esc: Byte;
Begin
  Clrscr;
  Writeln;
  Writeln('Estado civil con mayor Nø de materias aprobadas:');
  Writeln;
  For Esc:=0 to 7 do Begin
    S1:=0; S2:=0; S3:=0; S4:=0; S5:=0;
    for i:=1 to n do
      if FI[i].Esc=Esc then
          Case FI[i].Edo_c of
            S: S1:=S1+FI[i].M_ap;
            C: S2:=S2+FI[i].M_ap;
            V: S3:=S3+FI[i].M_ap;
            D: S4:=S4+FI[i].M_ap;
            O: S5:=S5+FI[i].M_ap;
          End;
    Case Esc of
      0: Write('Escuela B sica:');
      1: Write('Civil         :');
      2: Write('El‚ctrica     :');
      3: Write('Geolog¡a      :');
      4: Write('Mec nica      :');
      5: Write('Metalurgia    :');
      6: Write('Qu¡mica       :');
      7: Write('Petr¢leo      :');
    End;
    may:=s1;
    if s2>may then may:=s2;
    if s3>may then may:=s3;
    if s4>may then may:=s4;
    if s5>may then may:=s5;
    if may=s1 then Writeln('Solteros - ',may,' materias aprobadas.');
    if may=s2 then Writeln('Casados - ',may,' materias aprobadas.');
    if may=s3 then Writeln('Viudos - ',may,' materias aprobadas.');
    if may=s4 then Writeln('Divorsiados - ',may,' materias aprobadas.');
    if may=s5 then Writeln('Otros - ',may,' materias aprobadas.');
  End;
  GotoXY(1,25);
  Readln;
  Menu(op);
End;

{--------------------------------------------------------}
Procedure Mas_menos_estudiantes(n: word);
Var
  i: Word;
  May, men, s0, s1, s2, s3, s4, s5, s6, s7: integer;
  Esc: Byte;
Begin
  Clrscr;
  for i:=1 to n do
    Case FI[i].Esc of
      0: S0:=S0+1;
      1: S1:=S1+1;
      2: S2:=S2+1;
      3: S3:=S3+1;
      4: S4:=S4+1;
      5: S5:=S5+1;
      6: S6:=S6+1;
      7: S7:=S7+1;
    End;
  if s0<men then men:=s0;
  if s1<men then men:=s1;
  if s2<men then men:=s2;
  if s3<men then men:=s3;
  if s4<men then men:=s4;
  if s5<men then men:=s5;
  if s6<men then men:=s6;
  if s7<men then men:=s7;
  if s0>may then may:=s0;
  if s1>may then may:=s1;
  if s2>may then may:=s2;
  if s3>may then may:=s3;
  if s4>may then may:=s4;
  if s5>may then may:=s5;
  if s6>may then may:=s6;
  if s7>may then may:=s7;
  Writeln;
  Writeln('Escuela con mayor Nø de estudiantes:');
  if s0=may then Writeln('Escuela B sica con ',may,' estudiantes.');
  if s1=may then Writeln('Civil con ',may,' estudiantes.');
  if s2=may then Writeln('El‚ctrica con ',may,' estudiantes.');
  if s3=may then Writeln('Geolog¡a con ',may,' estudiantes.');
  if s4=may then Writeln('Mec nica con ',may,' estudiantes.');
  if s5=may then Writeln('Metalurgia con ',may,' estudiantes.');
  if s6=may then Writeln('Qu¡mica con ',may,' estudiantes.');
  if s7=may then Writeln('Petr¢leo con ',may,' estudiantes.');
  Writeln;
  Writeln;
  Writeln('Escuela con menor Nø de estudiantes:');
  if s0=men then Writeln('Escuela B sica con ',men,' estudiantes.');
  if s1=men then Writeln('Civil con ',men,' estudiantes.');
  if s2=men then Writeln('El‚ctrica con ',men,' estudiantes.');
  if s3=men then Writeln('Geolog¡a con ',men,' estudiantes.');
  if s4=men then Writeln('Mec nica con ',men,' estudiantes.');
  if s5=men then Writeln('Metalurgia con ',men,' estudiantes.');
  if s6=men then Writeln('Qu¡mica con ',men,' estudiantes.');
  if s7=men then Writeln('Petr¢leo con ',men,' estudiantes.');
  GotoXY(1,25);
  Readln;
  Menu(op);
End;

{--------------------------------------------------------}
Begin
  n:=1;
  Repeat
  Menu(op);
  Case op of
    1: Buscar(n);
    2: Modificar(FI,n);
    3: Datos_Escuela(FI,n);
    4: Promedios(n);
    5: Estudiantes(n);
    6: Materias(n);
    7: Edo_mas_materia(n);
    8: Mas_menos_estudiantes(n);
  End;
  Until op=10;
  Clrscr;
End.