program trabajo_de_papa;
uses
  crt, trab1, cc, trab2;

var
  n:word;
  x:char;
  ne,num,a:string;

procedure arc;
var
  t:text;
begin
  if pos('.',a)<>(length(a)-3) then
    a:=a+'.txt';
  assign(t,a);
  rewrite(t);
  Writeln(t,ne);
  Writeln(t,num);
  writeln(t);
  close(t);
end;

BEGIN
  normvideo;
  clrscr;
  cursor(1,0);
  Presentacion(a);
  n:=1;
  Repeat
    Menu(n);
    x:=readkey;
    case x of
      #0 : begin
             x:=readkey;
             case x of
               #80 : if n<>2 then
                       inc(n)
                     else write(#7);
               #72 : if n<>1 then
                       dec(n)
                     else write(#7);
               #106 :
               else write(#7);
             end;
           end;
      #13 :if n=1 then begin
             Archivo(ne,num,a);
             arc;
             llenado(a);
             presentacion(a);
             menu(n);
           end;
      '1' : begin
              Archivo(ne,num,a);
              arc;
              llenado(a);
              presentacion(a);
              menu(n);
            end;
      '2' :;
      #27 :
      else write(#7);
    end;
  until (x=#106) or (x=#27) or ((x=#13)and(n=2)) or (x='2');
END.