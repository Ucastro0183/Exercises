USES Crt;
TYPE
  T01 = ARRAY [1..60] OF single;
  T02 = RECORD Nomb: STRING[20];
        Apell: STRING[10];
        nCed: STRING[8];
        Sexo: (F,M);
        estado: (S,C,V,D,O);
        escuela: 0..7;
        Nmat: BYTE;
        NotasMat: T01; END;
  T03 = ARRAY [1..200] OF T02;
VAR
  A: T03;
  n: Word;
  opcion : byte;

PROCEDURE Presentacion(VAR n: byte);
VAR
  opc: char;
  code: integer;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                                - MENU -');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  WRITELN;
  WRITELN;
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             1');
  TEXTCOLOR(BLACK);
  WRITELN('.- Buscar informaci¢n de un estudiante.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             2');
  TEXTCOLOR(BLACK);
  WRITELN('.- Modificar informaci¢n de un estudiante.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             3');
  TEXTCOLOR(BLACK);
  WRITELN('.- Introducir estudiantes por escuela.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             4');
  TEXTCOLOR(BLACK);
  WRITELN('.- Notas definitivas de los estudiantes.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             5');
  TEXTCOLOR(BLACK);
  WRITELN('.- Total de estudiantes por Sexo y Estado Civil.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             6');
  TEXTCOLOR(BLACK);
  WRITELN('.- Total de materias aprobadas por Sexo y Estado Civil.');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             7');
  TEXTCOLOR(BLACK);
  WRITELN('.- Estado civil con mas materias aprobadas');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             8');
  TEXTCOLOR(BLACK);
  WRITELN('.- Escuelas con mayor y menor cantidad de estudiantes');
  WRITELN;
  TEXTCOLOR(CYAN);
  WRITE('             9');
  TEXTCOLOR(BLACK);
  WRITELN('.- Salida.');
  WRITELN;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('              Elija su opci¢n presionando los n£meros');
  CLREOL;
  REPEAT
    opc:=READKEY;
    IF opc IN ['1'..'9'] THEN
      VAL(opc,n,code)
  UNTIL opc in ['1'..'9'];
END;

PROCEDURE ESTUDIANTES(n: word);
VAR
  i: Word;
  code, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10: integer;
  escuela: Byte;
  CH: Char;
BEGIN
  Clrscr;
  S1:=0; S2:=0; S3:=0; S4:=0; S5:=0;
  S6:=0; S7:=0; S8:=0; S9:=0; S10:=0;
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('        TOTAL ESTUDIANTES POR SEXO Y ESTADO CIVIL');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITE('Introduzca el c¢digo de la escuela: ');
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('0-BASICA 1-CIVIL 2-ELECT. 3-GEOLOG 4-MECANICA 5-METALURGIA 6-QUIMI. 7-PETROLEO');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(38,5);
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['1'..'7','0', #13] THEN
      CASE CH OF
        '0': BEGIN GOTOXY(38,5); CLREOL; WRITE('Escuela B sica'); END;
        '1': BEGIN GOTOXY(38,5); CLREOL; WRITE('Civil'); END;
        '2': BEGIN GOTOXY(38,5); CLREOL; WRITE('El‚ctrica'); END;
        '3': BEGIN GOTOXY(38,5); CLREOL; WRITE('Geolog¡a'); END;
        '4': BEGIN GOTOXY(38,5); CLREOL; WRITE('Mec nica'); END;
        '5': BEGIN GOTOXY(38,5); CLREOL; WRITE('Metalurgia'); END;
        '6': BEGIN GOTOXY(38,5); CLREOL; WRITE('Qu¡mica'); END;
        '7': BEGIN GOTOXY(38,5); CLREOL; WRITE('Petr¢leo'); END;
      END
    Else BEGIN
      GOTOXY(38,5);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL CH = #13;
  Val(CH,escuela,code);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,6);
  FOR i:=1 TO n do BEGIN
    IF A[i].escuela=escuela THEN
      IF A[i].Sexo=M THEN
        CASE A[i].estado OF
          S: Inc(S1);
          C: Inc(S2);
          V: Inc(S3);
          D: Inc(S4);
          O: Inc(S5);
        END
      Else
        CASE A[i].estado OF
          S: Inc(S6);
          C: Inc(S7);
          V: Inc(S8);
          D: Inc(S9);
          O: Inc(S10);
        END;
  END;
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('        TOTAL ESTUDIANTES POR SEXO Y ESTADO CIVIL');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITELN('               CANTIDAD DE ESTUDIANTES POR SEXO Y ESTADO CIVIL');
  WRITELN;
  WRITELN('                  SOLTERO   CASADO   VIUDO   DIVORCIADO   OTRO   TOTAL');
  WRITELN('        HOMBRES :   ',S1:2,'        ',S2:2,'       ',S3:2,'        ',S4:2,'        ',S5:2,'      '
           ,S1+S2+S3+S4+S5:2,'  ');
  WRITELN;
  WRITELN('        MUJERES :   ',S6:2,'        ',S7:2,'       ',S8:2,'        ',S9:2,'        ',S10:2,'      '
           ,S6+S7+S8+S9+S10:2,'  ');
  WRITELN;
  WRITELN;
  WRITELN('         TOTAL  :   ',S1+S6:2,'        ',S2+S7:2,'       ',S3+S8:2,'        ',S4+S9:2,'        ',S5+S10:2,'      '
           ,S1+S6:2,'  ');
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE MATERIAS(n: word);
VAR
  i: Word;
  code, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10: integer;
  escuela: Byte;
  CH: Char;
BEGIN
  Clrscr;
  S1:=0; S2:=0; S3:=0; S4:=0; S5:=0;
  S6:=0; S7:=0; S8:=0; S9:=0; S10:=0;
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('        TOTAL MATERIAS APROBADAS POR SEXO Y ESTADO CIVIL');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITE('Introduzca el c¢digo de la escuela: ');
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('0-BASICA 1-CIVIL 2-ELECT. 3-GEOLOG 4-MECANICA 5-METALURGIA 6-QUIMI. 7-PETROLEO');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(38,5);
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['1'..'7','0', #13] THEN
      CASE CH OF
        '0': BEGIN GOTOXY(38,5); CLREOL; WRITE('Escuela B sica'); END;
        '1': BEGIN GOTOXY(38,5); CLREOL; WRITE('Civil'); END;
        '2': BEGIN GOTOXY(38,5); CLREOL; WRITE('El‚ctrica'); END;
        '3': BEGIN GOTOXY(38,5); CLREOL; WRITE('Geolog¡a'); END;
        '4': BEGIN GOTOXY(38,5); CLREOL; WRITE('Mec nica'); END;
        '5': BEGIN GOTOXY(38,5); CLREOL; WRITE('Metalurgia'); END;
        '6': BEGIN GOTOXY(38,5); CLREOL; WRITE('Qu¡mica'); END;
        '7': BEGIN GOTOXY(38,5); CLREOL; WRITE('Petr¢leo'); END;
      END
    Else BEGIN
      GOTOXY(38,5);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL CH = #13;
  Val(CH,escuela,code);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,6);
  FOR i:=1 TO n do BEGIN
    IF A[i].escuela=escuela THEN
      IF A[i].Sexo=M THEN
        CASE A[i].estado OF
          S: S1:=S1+A[i].Nmat;
          C: S2:=S2+A[i].Nmat;
          V: S3:=S3+A[i].Nmat;
          D: S4:=S4+A[i].Nmat;
          O: S5:=S5+A[i].Nmat;
        END
      Else
        CASE A[i].estado OF
          S: S6:=S6+A[i].Nmat;
          C: S7:=S7+A[i].Nmat;
          V: S8:=S8+A[i].Nmat;
          D: S9:=S9+A[i].Nmat;
          O: S10:=S10+A[i].Nmat;
        END;
  END;
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('        TOTAL MATERIAS APROBADAS POR SEXO Y ESTADO CIVIL');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITELN('              CANTIDAD DE MATERIAS APROBADAS POR LOS ESTUDIANTES');
  WRITELN;
  WRITELN('                  SOLTERO   CASADO   VIUDO   DIVORCIADO   OTRO   TOTAL');
  WRITELN('        HOMBRES :   ',S1:2,'        ',S2:2,'       ',S3:2,'        ',S4:2,'        ',S5:2,'      '
           ,S1+S2+S3+S4+S5:2,'  ');
  WRITELN;
  WRITELN('        MUJERES :   ',S6:2,'        ',S7:2,'       ',S8:2,'        ',S9:2,'        ',S10:2,'      '
           ,S6+S7+S8+S9+S10:2,'  ');
  WRITELN;
  WRITELN;
  WRITELN('         TOTAL  :   ',S1+S6:2,'        ',S2+S7:2,'       ',S3+S8:2,'        ',S4+S9:2,'        ',S5+S10:2,'      '
           ,S1+S6:2,'  ');
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE EstadoMasAprueba(n: word);
VAR
  i: Word;
  mayor, cont1, cont2, cont3, cont4, cont5: integer;
  escuela: Byte;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           ESTADO CIVIL CON MAS MATERIAS APROBADAS');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  FOR escuela:=0 TO 7 do BEGIN
    cont1:=0; cont2:=0; cont3:=0; cont4:=0; cont5:=0;
    FOR i:=1 TO n do
      IF A[i].escuela=escuela THEN
          CASE A[i].estado OF
            S: cont1:=cont1+A[i].Nmat;
            C: cont2:=cont2+A[i].Nmat;
            V: cont3:=cont3+A[i].Nmat;
            D: cont4:=cont4+A[i].Nmat;
            O: cont5:=cont5+A[i].Nmat;
          END;
    CASE escuela OF
      0: WRITE('Escuela B sica:');
      1: WRITE('Civil         :');
      2: WRITE('El‚ctrica     :');
      3: WRITE('Geolog¡a      :');
      4: WRITE('Mec nica      :');
      5: WRITE('Metalurgia    :');
      6: WRITE('Qu¡mica       :');
      7: WRITE('Petr¢leo      :');
    END;
    mayor:=cont1;
    IF cont2>mayor THEN mayor:=cont2;
    IF cont3>mayor THEN mayor:=cont3;
    IF cont4>mayor THEN mayor:=cont4;
    IF cont5>mayor THEN mayor:=cont5;
    IF mayor=cont1 THEN WRITELN('Solteros, ',mayor,' materias aprobadas.');
    IF mayor=cont2 THEN WRITELN('Casados, ',mayor,' materias aprobadas.');
    IF mayor=cont3 THEN WRITELN('Viudos, ',mayor,' materias aprobadas.');
    IF mayor=cont4 THEN WRITELN('Divorsiados, ',mayor,' materias aprobadas.');
    IF mayor=cont5 THEN WRITELN('Otros, ',mayor,' materias aprobadas.');
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE EscMayMenNumEst(n: word);
VAR
  i: Word;
  mayor, menor, cont0, cont1, cont2, cont3, cont4, cont5, cont6, cont7: integer;
  escuela: Byte;
BEGIN
  Clrscr;
  FOR i:=1 TO n do
    CASE A[i].escuela OF
      0: cont0:=cont0+1;
      1: cont1:=cont1+1;
      2: cont2:=cont2+1;
      3: cont3:=cont3+1;
      4: cont4:=cont4+1;
      5: cont5:=cont5+1;
      6: cont6:=cont6+1;
      7: cont7:=cont7+1;
    END;
  IF cont0<menor THEN
    menor:=cont0;
  IF cont1<menor THEN
    menor:=cont1;
  IF cont2<menor THEN
    menor:=cont2;
  IF cont3<menor THEN
    menor:=cont3;
  IF cont4<menor THEN
    menor:=cont4;
  IF cont5<menor THEN
    menor:=cont5;
  IF cont6<menor THEN
    menor:=cont6;
  IF cont7<menor THEN
    menor:=cont7;
  IF cont0>mayor THEN
    mayor:=cont0;
  IF cont1>mayor THEN
    mayor:=cont1;
  IF cont2>mayor THEN
    mayor:=cont2;
  IF cont3>mayor THEN
    mayor:=cont3;
  IF cont4>mayor THEN
    mayor:=cont4;
  IF cont5>mayor THEN
    mayor:=cont5;
  IF cont6>mayor THEN
    mayor:=cont6;
  IF cont7>mayor THEN
    mayor:=cont7;
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           ESCUELAS CON MAYOR Y MENOR CANTIDAD DE ESTUDIANTES');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITELN('Escuela con mayor cantidad de estudiantes:');
  IF cont0=mayor THEN
    WRITELN('  Escuela B sica, ',mayor,' estudiantes.');
  IF cont1=mayor THEN
    WRITELN('  Civil, ',mayor,' estudiantes.');
  IF cont2=mayor THEN
    WRITELN('  El‚ctrica, ',mayor,' estudiantes.');
  IF cont3=mayor THEN
    WRITELN('  Geolog¡a, ',mayor,' estudiantes.');
  IF cont4=mayor THEN
    WRITELN('  Mec nica, ',mayor,' estudiantes.');
  IF cont5=mayor THEN
    WRITELN('  Metalurgia, ',mayor,' estudiantes.');
  IF cont6=mayor THEN
    WRITELN('  Qu¡mica, ',mayor,' estudiantes.');
  IF cont7=mayor THEN
    WRITELN('  Petr¢leo, ',mayor,' estudiantes.');
  WRITELN;
  WRITELN;
  WRITELN('Escuela con menor cantidad de estudiantes:');
  IF cont0=menor THEN
    WRITELN('  Escuela B sica, ',menor,' estudiantes.');
  IF cont1=menor THEN
    WRITELN('  Civil, ',menor,' estudiantes.');
  IF cont2=menor THEN
    WRITELN('  El‚ctrica, ',menor,' estudiantes.');
  IF cont3=menor THEN
    WRITELN('  Geolog¡a, ',menor,' estudiantes.');
  IF cont4=menor THEN
    WRITELN('  Mec nica, ',menor,' estudiantes.');
  IF cont5=menor THEN
    WRITELN('  Metalurgia, ',menor,' estudiantes.');
  IF cont6=menor THEN
    WRITELN('  Qu¡mica, ',menor,' estudiantes.');
  IF cont7=menor THEN
    WRITELN('Petr¢leo, ',menor,' estudiantes.');
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE DEFINITIVAS(n: word);
VAR
  i, j: Word;
  def: real;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                  NOTAS DEFINITIVAS DE LOS ESTUDIANTES');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  FOR i:=1 TO n do BEGIN
    IF (i mod 17)=0 THEN BEGIN
      TEXTBACKGROUND(BLUE);
      TEXTCOLOR(WHITE);
      WRITE('           Presione una tecla');
      CLREOL;
      TEXTBACKGROUND(LIGHTGRAY);
      TEXTCOLOR(BLACK);
      REPEAT UNTIL KEYPRESSED;
      CLRSCR;
      WRITELN;
      TEXTBACKGROUND(BLUE);
      TEXTCOLOR(WHITE);
      WRITE('                  NOTAS DEFINITIVAS DE LOS ESTUDIANTES ');
      CLREOL;
      TEXTBACKGROUND(LIGHTGRAY);
      TEXTCOLOR(BLACK);
      WRITELN;
      WRITELN;
      WRITELN;
    END;
    FOR j:=1 TO A[i].Nmat do
      def:= A[i].NotasMat[j] + def;
    def:= def / A[i].Nmat;
    WRITELN(A[i].Nomb:20,',  ',A[i].Apell:20,'  ',def:5:2);
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE MuestraDatos(A: T02);
VAR i: 1..60;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                 MOSTRANDO INFORMACION DE UN ESTUDIANTE');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  WRITELN('Nombre: ',A.Nomb,' ',A.Apell);
  WRITELN('CI: ',A.nCed);
  WRITELN;
  WRITE('Sexo: ');
  IF A.Sexo=F THEN
    WRITELN('Femenino')
  Else
    WRITELN('Masculino');
  WRITE('Estado civil: ');
  CASE A.estado OF
    S: WRITELN('Soltero');
    C: WRITELN('Casado');
    V: WRITELN('Viudo');
    D: WRITELN('Divorciado');
    O: WRITELN('Otro');
  END;
  WRITE('Escuela: ');
  CASE A.escuela OF
    0: WRITELN('Escuela B sica');
    1: WRITELN('Civil');
    2: WRITELN('El‚ctrica');
    3: WRITELN('Geolog¡a');
    4: WRITELN('Mec nica');
    5: WRITELN('Metalurgia');
    6: WRITELN('Qu¡mica');
    7: WRITELN('Petr¢leo');
  END;
  WRITELN('N£mero de materias aprobadas: ',A.Nmat);
  IF A.Nmat<>0 THEN BEGIN
    WRITE('Notas : ');
    FOR i:=1 TO A.Nmat do
      WRITE(A.NotasMat[i]);
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE Buscar(n: word);
VAR
  i: Word;
  nCed: string[8];
  Hay: Boolean;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                 BUSCAR INFORMACION DE UN ESTUDIANTE');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,5);
  WRITELN('Introduzca el n£mero de c‚dula del estudiante a mostrar: ');
  READLN(nCed);
  Hay:=False;
  FOR i:=1 TO n do BEGIN
    IF A[i].nCed=nCed THEN BEGIN
      MuestraDaTOs(A[i]);
      Hay:=True;
    END;
  END;
  IF not Hay THEN BEGIN
    WRITELN;
    WRITE('No existe ese n£mero de c‚dula!!!');
    GOTOXY(1,24);
    TEXTBACKGROUND(BLUE);
    TEXTCOLOR(WHITE);
    WRITE('           Presione una tecla');
    CLREOL;
    TEXTBACKGROUND(LIGHTGRAY);
    TEXTCOLOR(BLACK);
    REPEAT UNTIL KEYPRESSED;
    Presentacion(opcion);
  END;
END;

PROCEDURE Nuevos_datos(VAR A: T03; i: byte);
VAR
  CH: Char;
  j: Byte;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                 INTRODUCIR INFORMACION DE UN ESTUDIANTE');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,5);
  WRITE('Nombre del Estudiante: ');
  READLN(A[i].Nomb);
  WRITE('Apellido del Estudiante: ');
  READLN(A[i].Apell);
  WRITE('N£mero de C‚dula: ');
  READLN(A[i].nCed);
  WRITELN;
  WRITE('Sexo: ');
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('M: masculino;  F: femenino');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(7,8);
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['M','F',#13] THEN
      CASE CH OF
        'M': BEGIN
               A[i].Sexo:=M;
               WRITE('Masculino');
             END;
        'F': BEGIN
               A[i].Sexo:=F;
               WRITE('Femenino');
             END;
      END
    Else BEGIN
      GOTOXY(7,8);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH =#13) AND (A[i].Sexo IN [M,F]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('S: soltero;  C: casado;  V: viudo;  D: divorciado;  O: otro');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,9);
  WRITE('Estado civil: ');
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['S','C','D','V','O',#13] THEN
      CASE CH OF
        'S': BEGIN
               A[i].estado:=S;
               WRITELN('Soltero');
             END;
        'C': BEGIN
               A[i].estado:=C;
               WRITELN('Casado');
             END;
        'V': BEGIN
               A[i].estado:=V;
               WRITELN('Viudo');
             END;
        'D': BEGIN
               A[i].estado:=D;
               WRITELN('Divorciado');
             END;
        'O': BEGIN
               A[i].estado:=O;
               WRITELN('Otro');
             END;
      END
    Else BEGIN
      GOTOXY(15,9);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH=#13)AND(A[i].estado in [S,C,D,V,O]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('0-BASICA 1-CIVIL 2-ELECT. 3-GEOLOG 4-MECANICA 5-METALURGIA 6-QUIMI. 7-PETROLEO');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,10);
  WRITE('Escuela: ');
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['1'..'7','0',#13] THEN
      CASE CH OF
        '0': BEGIN
               A[i].escuela:=0;
               WRITELN('Escuela B sica');
             END;
        '1': BEGIN
               A[i].escuela:=1;
               WRITELN('Civil');
             END;
        '2': BEGIN
               A[i].escuela:=2;
               WRITELN('El‚ctrica');
             END;
        '3': BEGIN
               A[i].escuela:=3;
               WRITELN('Geolog¡a');
             END;
        '4': BEGIN
               A[i].escuela:=4;
               WRITELN('Mec nica');
             END;
        '5': BEGIN
               A[i].escuela:=5;
               WRITELN('Metalurgia');
             END;
        '6': BEGIN
               A[i].escuela:=6;
               WRITELN('Qu¡mica');
             END;
        '7': BEGIN
               A[i].escuela:=7;
               WRITELN('Petr¢leo');
             END;
      END
    Else BEGIN
      GOTOXY(10,10);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH=#13) AND (A[i].escuela in [1..7,0]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,11);
  WRITE('N£mero de materias aprobadas: ');
  READLN(A[i].Nmat);
  WRITELN('Introduzca las ',A[i].Nmat,' notas:');
  FOR j:=1 TO A[i].Nmat do BEGIN
    WRITE('Nota ',j,': ');
    READLN(A[i].NotasMat[j]);
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
END;

PROCEDURE MODIFY(VAR A: T03;n: word);
VAR
  i: Word;
  nCed: string[8];
  Cambio: Boolean;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('                 MODIFICAR INFORMACION DE UN ESTUDIANTE');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,5);
  WRITE('Introduzca el n£mero de c‚dula del estudiante a modificar: ');
  READLN(nCed);
  Cambio:=False;
  FOR i:=1 TO n do BEGIN
    IF A[i].nCed=nCed THEN BEGIN
      MuestraDatos(A[i]);
      Nuevos_datos(A,i);
      MuestraDatos(A[i]);
      Cambio:=True;
    END;
  END;
  IF Not Cambio THEN BEGIN
    WRITELN;
    WRITE('No se encontr¢ el estudiante especificado.');
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

PROCEDURE Nuevos_Estudiantes(VAR A: T03; i: byte);
VAR
  CH: Char;
  j: Byte;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('            INTRODUCIR INFORMACION DE ESTUDIANTES POR ESCUELA');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,5);
  WRITE('Nombre del Estudiante: ');
  READLN(A[i].Nomb);
  WRITE('Apellido del Estudiante: ');
  READLN(A[i].Apell);
  WRITE('N£mero de C‚dula: ');
  READLN(A[i].nCed);
  WRITELN;
  WRITE('Sexo: ');
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('M: masculino;  F: femenino');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(7,8);
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['M','F',#13] THEN
      CASE CH OF
        'M': BEGIN
               A[i].Sexo:=M;
               WRITELN('Masculino');
             END;
        'F': BEGIN
               A[i].Sexo:=F;
               WRITELN('Femenino');
             END;
      END
    Else BEGIN
      GOTOXY(7,8);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH = #13)AND(A[i].Sexo IN [F,M]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('S: soltero;  C: casado;  V: viudo;  D: divorciado;  O: otro');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,9);
  WRITE('Estado civil: ');
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['S','C','D','V','O',#13] THEN
      CASE CH OF
        'S': BEGIN
               A[i].estado:=S;
               WRITELN('Soltero');
             END;
        'C': BEGIN
               A[i].estado:=C;
               WRITELN('Casado');
             END;
        'V': BEGIN
               A[i].estado:=V;
               WRITELN('Viudo');
             END;
        'D': BEGIN
               A[i].estado:=D;
               WRITELN('Divorciado');
             END;
        'O': BEGIN
               A[i].estado:=O;
               WRITELN('Otro');
             END;
      END
    Else BEGIN
      GOTOXY(15,9);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH=#13)AND(A[i].estado in [S,C,D,V,O]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,10);
  WRITE('N£mero de materias aprobadas: ');
  READLN(A[i].Nmat);
  IF A[i].Nmat<>0 THEN BEGIN
    WRITELN('Introduzca las ',A[i].Nmat,' notas:');
    FOR j:=1 to A[i].Nmat do BEGIN
      WRITE('Nota ',j,': ');
      READLN(A[i].NotasMat[j]);
    END;
  END;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
END;

PROCEDURE Datos_Escuela(VAR A: T03;VAR n: word);
VAR
  i, escuela, m: Word;
  ch: Char;
  cod: Integer;
BEGIN
  TEXTBACKGROUND(LIGHTGRAY);
  CLRSCR;
  WRITELN;
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('            INTRODUCIR INFORMACION DE ESTUDIANTES POR ESCUELA');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  WRITELN;
  WRITELN;
  WRITELN;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('0-BASICA 1-CIVIL 2-ELECT. 3-GEOLOG 4-MECANICA 5-METALURGIA 6-QUIMI. 7-PETROLEO');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,5);
  WRITE('Introduzca el c¢digo de la escuela: ');
  REPEAT
    CH:=UpCASE(Readkey);
    IF CH in ['1'..'7','0',#13] THEN BEGIN
      CASE CH OF
        '0': BEGIN GOTOXY(38,5); CLREOL; WRITE('Escuela B sica'); END;
        '1': BEGIN GOTOXY(38,5); CLREOL; WRITE('Civil'); END;
        '2': BEGIN GOTOXY(38,5); CLREOL; WRITE('El‚ctrica'); END;
        '3': BEGIN GOTOXY(38,5); CLREOL; WRITE('Geolog¡a'); END;
        '4': BEGIN GOTOXY(38,5); CLREOL; WRITE('Mec nica'); END;
        '5': BEGIN GOTOXY(38,5); CLREOL; WRITE('Metalurgia'); END;
        '6': BEGIN GOTOXY(38,5); CLREOL; WRITE('Qu¡mica'); END;
        '7': BEGIN GOTOXY(38,5); CLREOL; WRITE('Petr¢leo'); END;
        END;
      IF ch<>#13 THEN Val(CH,escuela,cod);
    END Else BEGIN
      GOTOXY(38,5);
      CLREOL;
      WRITE(ch);
    END;
  UNTIL (CH=#13)AND(escuela in [1..7,0]);
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  GOTOXY(1,7);
  WRITE('Introduzca el n£mero de estudiantes de la escuela: ');
  READLN(m);
  FOR i:=n+1 TO m+n do BEGIN
    A[i].escuela:=escuela;
    Nuevos_Estudiantes(A,i);
  END;
  n:=n+m;
  GOTOXY(1,24);
  TEXTBACKGROUND(BLUE);
  TEXTCOLOR(WHITE);
  WRITE('           Presione una tecla');
  CLREOL;
  TEXTBACKGROUND(LIGHTGRAY);
  TEXTCOLOR(BLACK);
  REPEAT UNTIL KEYPRESSED;
  Presentacion(opcion);
END;

BEGIN
  n:=1;
  Presentacion(opcion);
  REPEAT
  CASE opcion OF
    1: Buscar(n);
    2: MODIFY(A,n);
    3: Datos_Escuela(A,n);
    4: DEFINITIVAS(n);
    5: Estudiantes(n);
    6: Materias(n);
    7: EstadoMasAprueba(n);
    8: EscMayMenNumEst(n);
  END;
  UNTIL opcion=9;
  Clrscr;
END.