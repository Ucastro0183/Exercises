uses crt, grafics, graph;
var x1,y1,x2,y2:integer;
Begin
clrscr;
x1:=-1; x2:=0; y1:=-1; y2:=1;
grafica(x1,y1,x2,y2);
If ErrCode<>0 then Begin
  Writeln('Graphics Error ',GraphErrorMsg(ErrCode));
  Halt(1);
end;
end.