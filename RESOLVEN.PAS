program resolvente;
uses crt;
var
  a,b,c,d,x,x1,x2,r,im:real;
begin
  clrscr;
  writeln('existe un ax^2+bx+c=0 dar el valor de a:');
  readln(a);
  writeln('dar el valor de b:');
  readln(b);
  Writeln('dar el valor de c:');
  readln(c);
  clrscr;
  if a=0 then
    begin
      if b=0 then
        writeln('te ped¡ una ecuaci¢n cuadrada est£pido')
      else
        begin
          x:= c/b;
          writeln('el valor de x: ',x:0:2);
        end;
    end
  else
    begin
      d:=b*b-4*a*c;
      if d<0 then
        begin
          writeln( 'idiota solo tiene soluci¢n imaginaria');
          writeln;
          r:=-b/(2*a);
          im:=(sqrt(-d))/(2*a);
          if im>0 then
            begin
              writeln('pero las soluciones imaginarias son: ');
              writeln(r:0:2,'+',im:0:2,'i');
              writeln(r:0:2,'-',im:0:2,'i');
            end
          else
            begin
              writeln('pero las soluciones imaginarias son: ');
              writeln(r:0:2,'+',-im:0:2,'i');
              writeln(r:0:2,im:0:2,'i');
            end;
        end
      else
        begin
          x1:= (-b+(sqrt(d)))/(2*a);
          x2:= (-b-(sqrt(d)))/(2*a);
          writeln('los valores de x son x1: ',x1:0:2,' y el de x2: ',x2:0:2);
        end;
    end;
  readln;
End.