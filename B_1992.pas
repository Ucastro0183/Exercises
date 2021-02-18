Program Get_in_line;

type
  lista = array [1..8,1..4] of longint;

var
  lis, lis2           : lista;
  T, T1               : text;
  i, j, cant, ext,
  glob, m, n          : longint;
  primera             : boolean;
  dist, dist1, acum   : real;

function d(l:lista; m,n:longint):real;
begin
  d:=sqrt(sqr(l[m,1]-l[n,1])+sqr(l[m,2]-l[n,2]));
end;

procedure siguiente(var l : lista;ini : longint);
var
  i, h, j: longint;
  m, n:real;
begin
  if not primera then
    if dist>dist1 then begin
      ext:=0;
      exit;
    end;
  if ext=cant then begin
    ext:=0;
    exit;
  end;
  inc(ext);
  l[ini,3]:=ext;
  for i:=1 to cant-1 do begin
    if l[i,3]=0 then begin
      n:=d(l,ini,i);
      h:=i;
      break;
    end;
  end;
  for j:=i+1 to cant do begin
    if l[j,3]=0 then begin
      m:=d(l,ini,j);
      if m<n then begin
        n:=m;
        h:=j;
      end;
    end;
  end;
  dist:=dist+n;
  siguiente(l,h);

end;

begin
  assign(T,'B_1992.in');
  reset(T);
  assign(T1,'B_1992.out');
  rewrite(T1);
  repeat
    inc(glob);
    read(T,cant);
    if cant=0 then
      break;
    primera:=true;
    ext:=0;
    for i:=1 to cant do begin
      readln(T,lis[i,1],lis[i,2]);
      lis[i,3]:=0;
    end;

    lis2:=lis;
    dist:=0;
    siguiente(lis2,1);
    dist1:=dist;
    dist:=0;
    primera:=false;
    lis:=lis2;

    for i:=2 to cant do begin
      for j:=1 to cant do
        lis2[j,3]:=0;
      siguiente(lis2,i);
      if dist < dist1 then begin
        dist1:=dist;
        lis:=lis2;
      end;
      dist:=0;
    end;

    acum:=0;
    writeln(T1,'***********************************************************');
    writeln(T1,'Network #',glob);
    for i:=1 to cant-1 do begin
      for j:=1 to cant do begin
        if lis[j,3]=i then
          m:=j
        else if lis[j,3]=(i+1) then
          n:=j;
      end;
        write(T1,'Cable requirement to connect ');
        write(T1,'(',lis[m,1],',',lis[m,2],') to (',lis[n,1],',',lis[n,2],')');
        writeln(T1,' is ',d(lis,m,n)+16:0:2,' feet.');
        acum:=acum+d(lis,m,n)+16;
    end;
    writeln(T1,'Number of feet of cable required is ',acum:0:2,'.')

  until false;
  close(T);
  close(T1);
end.