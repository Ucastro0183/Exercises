var
  t, t1     : text;
  i, cont   : word;
  buf, line : string;

begin
  assign(t,'G_1991.in');
  reset(t);
  assign(t1,'G_1991.out');
  rewrite(t1);
  repeat
    readln(t,line);
    cont:=0;
    buf:='';
    for i:=1 to length(line) do begin
      case line[i] of
        'A'..'Z': begin
                    if i=1 then
                      writeln(t1,'L ',line[i])
                    else if (buf='') then
                      buf:=line[i]
                      else begin
                        cont:=cont+1;
                        writeln(t1,'ST $',cont);
                        writeln(t1,'L ',buf);
                        buf:=line[i];
                      end;
                  end;
        '+'     : begin
                    if buf<>'' then begin
                      writeln(t1,'A ',buf);
                      buf:='';
                    end else begin
                      writeln(t1,'A $',cont);
                      cont:=cont-1;
                    end;
                  end;
        '*'     : begin
                    if buf<>'' then begin
                      writeln(t1,'M ',buf);
                      buf:='';
                    end else begin
                      writeln(t1,'M $',cont);
                      cont:=cont-1;
                    end;
                  end;
        '/'     : begin
                    if buf<>'' then begin
                      writeln(t1,'D ',buf);
                      buf:='';
                    end else begin
                      cont:=cont+1;
                      writeln(t1,'ST $',cont);
                      writeln(t1,'L $',cont-1);
                      Writeln(t1,'D $',cont);
                      cont:=cont-1;
                    end;
                  end;
        '-'     : begin
                    if buf<>'' then begin
                      writeln(t1,'N');
                      writeln(t1,'A ',buf);
                      buf:='';
                    end else begin
                      writeln(t1,'N');
                      writeln(t1,'A $',cont);
                      cont:=cont-1;
                    end;
                  end;
        '@'     : Begin
                    if buf<>'' then begin
                      inc(cont);
                      writeln(t1,'ST $',cont);
                      writeln(t1,'L ',buf);
                      Writeln(t1,'N');
                      buf:='';
                    end;
                  end;

      end;
    end;
    writeln(t1);
  until (eof(t));
  close(t1);
  close(t);
end.