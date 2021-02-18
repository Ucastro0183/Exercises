program Problema_6;
Uses Crt;

Var
  c      : char;
  n1, n2 : String;
  l1, l2, code, d1, d2, d: integer;

Begin
  clrscr;
  Writeln('Introduzca el tipo de operaci¢n a realizar');
  Writeln;
  Writeln('1.- Suma');
  Writeln('2.- Resta');
  Writeln('3.- Multiplicaci¢n');
  Writeln('4.- Divici¢n');
  Writeln;
Repeat
  c:=upcase(readkey);
  Writeln(c);
Until c in ['1'..'4'];
  Writeln;
  Write('Introduzca el primer n£mero:');
  Readln(n1);
  Write('Introduzca el segundo n£mero');
  Readln(n2);
  l1:=length(n1);
  l2:=length(n2);

End.