type
  mat=array[1..12,1..12]of word;

var
  t,t1:text;
  a,b,c:mat;
  cont,cglob,a1,a2,i,j,
  g_f,g_c,s_f,s_c,
  num_c,num_f:word;
  paro:boolean;

procedure mueve(x,y:byte);
begin
  if a[x,y]<>0 then
    exit;
  if paro then
    exit;
  cont:=cont+1;
  a[x,y]:=cont;
  if (x=g_f) and (y=g_c) then begin
    paro:=true;
    exit;
    end;
  if ((y-1)>0) then
    if (b[x,y-1]<>1)and(b[x,y-1]<>3) then
      mueve(x,y-1);
  if ((x-1)>0) then
    if (b[x-1,y]<>2)and(b[x-1,y]<>3) then
      mueve(x-1,y);
  if (not((b[x,y]=1)or(b[x,y]=3)))and((y+1)<=num_c) then
    mueve(x,y+1);
  if (not((b[x,y]=2)or(b[x,y]=3)))and((x+1)<=num_f) then
    mueve(x+1,y);
  if not paro then begin
    cont:=cont-1;
    inc(c[x,y]);
    a[x,y]:=0;
    end;
End;

begin
    assign(t1,'out.out');
    rewrite(t1);
    assign(t,'in.in');
    reset(t);
  repeat
    inc(cglob);
    {--------------------}
    Read(t,num_f,num_c,s_f,s_c,g_f,g_c);
    if (num_f=0)and(num_c=0)and(s_f=0)and
       (s_c=0)and(g_f=0)and(g_c=0) then
       break;
    for i:=1 to num_f do
     for j:=1 to num_c do
       b[j,i]:=0;
    for i:=1 to num_f do
     for j:=1 to num_c do
       a[j,i]:=0;
    for i:=1 to num_f do
     for j:=1 to num_c do
       Read(t,b[i,j]);
    paro:=false;
    {--------------------}
    cont:=0;
    mueve(s_f,s_c);
    {--------------------}
    Writeln(t1,'Maze ',cglob);
    Writeln(t1);
{}
    a1:=0;
    Repeat
      inc(a1);
      Write(t1,'+');
      Write(t1,'---')
    until a1=num_c;
    Writeln(t1,'+');
{}
    a2:=0;
    repeat
      inc(a2);
      a1:=0;
      repeat
        inc(a1);
        if (a1<>1)and(a1<>num_c) then
          begin
            if (b[a2,a1]=1)or(b[a2,a1]=3) then
              Write(t1,'|');
          end
        else
          Write(t1,'|');

        if (c[a2,a1]=0) then
          if a[a2,a1]<>0 then
            Write(t1,a[a2,a1]:3)
          else
            Write(t1,'   ')
        else
          Write(t1,'???');
      until a1=num_c;
      Writeln(t1);
      a1:=0;
      if a2<>num_f then
        begin
          repeat
            inc(a1);
            if (a[a2,a1]<>2)and(a[a2,a1]<>3) then
              Write(t1,'   ')
            else
              Write(t1,'---');
          until a1=num_c;
          Writeln(t1);
        end;
    until a2=num_f;
    Writeln(t1,'|');
{}
    a1:=0;
    Repeat
      inc(a1);
      Write(t1,'+');
      Write(t1,'---')
    until a1=num_c;
    Writeln(t1,'+');
{}
    Writeln(t1,' ');
    Writeln(t1,' ');
  until eof(t);
  close(t);
  close(t1);
end.