Program Verifica_la_pertenencia_de_un_punto_en_una_region_R;
uses crt;
var
  a, b, c, d, alfa, beta,
  x1, y1, x2, y2, x3, y3, x4, y4: Real;
  entrada, salida: text;
const
  ruta1= 'region.in';
  ruta2= 'region.out';
begin
  clrscr;
  write('introduzca el valor de la abscisa de la recta vertical: ');
  readln(d);
  write('introduzca el valor de la ordenada de la recta horizontal: ');
  readln(b);
  write('introduzca el valor del radio de la circunferencia mayor: ');
  readln(a);
  write('introduzca el valor del radio de la circunferencia menor: ');
  readln(c);
  write('introduzca el valor del  ngulo resp. al eje de las abscisas de la recta L1: ');
  readln(beta);
  write('introduzca el valor del  ngulo resp. al eje de las ordenadas de la recta L2: ');
  readln(alfa);
  clrscr;
  alfa:=alfa*pi/180;
  beta:=beta*pi/180;
  if (((((b*b+d*d<=a*a)or(pi/2-alfa<=beta))or((alfa>pi/2)or(beta<0)))
  or(((b>=a)or(b<=c))or((d>=a)or(d<=c))))or((sin(beta)*d/cos(beta)>=sqrt(a*a-d*d))
  or(b*cos(alfa)/sin(alfa)>=sqrt(a*a-b*b)))) then
    writeln('ERROR: los datos suministrados no forman una regi¢n acorde a lo estipulado')
  else
    begin
      assign(salida,ruta2);
      rewrite(salida);
      writeln(salida,'a= ',a:0:2);
      writeln(salida,'b= ',b:0:2);
      writeln(salida,'c= ',c:0:2);
      writeln(salida,'d= ',d:0:2);
      writeln(salida,'alfa= ',alfa:0:2);
      writeln(salida,'beta= ',beta:0:2);
      close(salida);
      assign(entrada,ruta1);
      reset(entrada);
      readln(entrada,x1,y1);
      readln(entrada,x2,y2);
      readln(entrada,x3,y3);
      readln(entrada,x4,y4);
      close(entrada);
      if((((x1<=d)and(x1>=0))and((y1<=b)and(y1>=0)))and
      (((x1*x1+y1*y1<=a*a)and(x1*x1+y1*y1>=c*c))and
      ((y1/x1>=sin(beta)/cos(beta))and(y1/x1<=cos(alfa)/sin(alfa)))))then
        begin
          append(salida);
          writeln(salida,'Si Pertenece');
          close(salida);
        end
      else
        begin
          append(salida);
          writeln(salida,'No Pertenece');
          close(salida);
        end;
      if((((x2<=d)and(x2>=0))and((y2<=b)and(y2>=0)))and
      (((x2*x2+y2*y2<=a*a)and(x2*x2+y2*y2>=c*c))and
      ((y2/x2>=sin(beta)/cos(beta))and(y2/x2<=cos(alfa)/sin(alfa)))))then
        begin
          append(salida);
          writeln(salida,'Si Pertenece');
          close(salida);
        end
      else
        begin
          append(salida);
          writeln(salida,'No Pertenece');
          close(salida);
        end;
      if((((x3<=d)and(x3>=0))and((y3<=b)and(y3>=0)))and
      (((x3*x3+y3*y3<=a*a)and(x3*x3+y3*y3>=c*c))and
      ((y3/x3>=sin(beta)/cos(beta))and(y3/x3<=cos(alfa)/sin(alfa)))))then
        begin
          append(salida);
          writeln(salida,'Si Pertenece');
          close(salida);
        end
      else
        begin
          append(salida);
          writeln(salida,'No Pertenece');
          close(salida);
        end;
      if((((x4<=d)and(x4>=0))and((y4<=b)and(y4>=0)))and
      (((x4*x4+y4*y4<=a*a)and(x4*x4+y4*y4>=c*c))and
      ((y4/x4>=sin(beta)/cos(beta))and(y4/x4<=cos(alfa)/sin(alfa)))))then
        begin
          append(salida);
          writeln(salida,'Si Pertenece');
          close(salida);
        end
      else
        begin
          append(salida);
          writeln(salida,'No Pertenece');
          close(salida);
        end;
    end;
  writeln('presione cualquier tecla para terminar':150);
  repeat until Keypressed;
end.