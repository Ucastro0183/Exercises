program modulos;
uses crt;
var a,b,c:integer;

procedure proc1(a:integer; var b:integer);
var c:integer;
  begin
      a:=10; c:=a*b; b:=c; a:=c-a;
  end;

procedure proc2(a:integer; var c:integer);
var b:integer;
   begin
     b:=a-10; c:=a*b; a:=c-a;
   end;

procedure proc3(var b,c:integer; a:integer);
   begin
     a:=c-b; b:=c; c:=a+5;
   end;


begin
    clrscr;
    a:=5; b:=10; c:=2;
    writeln(a:5,b:5,c:5);
    proc1(a,b);
    writeln(a:5,b:5,c:5);
    proc2(c,b);
    writeln(a:5,b:5,c:5);
    proc3(a,b,c);
    writeln(a:5,b:5,c:5);
    readln;
end.