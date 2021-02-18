Program Regiones;
Uses
  Crt, Graph;
Var
  Gd,Gm,ErrCode : Integer;
  r,x,y,
  Ymax,Ymin,Xmax,Xmin,
  m1,b1,m2,b2 : Real;
  rf,rc,xp,yp :Integer;
  Reg1, Reg2, Reg3 : Boolean;
Begin
  ClrScr;
  Writeln('Introduzca el radio de la circunferencia : '); Readln(r);
  Writeln('Introduzca la coordenada X : '); Readln(x);
  Writeln('Introduzca la coordenada Y : '); Readln(y);
  Reg1:=(Abs(x)<=r) and (Abs(y)<=-Abs(x)+r);
  Reg2:=not Reg1 and (Abs(x)<=r) and (Abs(y)<=r);
  Reg3:=(Reg2 and (Y<=0)) or (Reg2 and (Y<0) and (sqr(X)+sqr(Y+r)<=sqr(r)));
  Ymax:=2.5*r; Ymin:=-2.5*r;
  Xmax:=2.5*r; Xmin:=-2.5*r;
  Gd:=Detect;
  InitGraph(Gd,Gm,'c:\bp\bgi');
  if ErrCode = grOk then
  begin
    {CALCULOS PREVIOS}
    m1:=(0-480)/(Ymax-Ymin);
    b1:=480-m1*Ymin;
    rf:=round(m1*r+b1);
    yp:=round(m1*y+b1);
    m2:=(0-480)/(Ymax-Ymin);
    b2:=480-m2*Ymin;
    rc:=round(m2*r+b2);
    xp:=round(m1*x+b1);
    {------------------------------------------------------------------------}
    SetColor(White);
    {EJES DE COORDENADAS}
    Line(0, GetMaxY div 2, GetMaxX, GetMaxY div 2);
    Line(GetMaxX div 2, 0, GetMaxX div 2, GetMaxY);
    {ROMBO}
    Line(GetMaxX div 2, GetMaxY div 2 + rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 - rf);
    {RELLENA LA REGION}
    SetFillStyle(CloseDotFill,Blue);
    FloodFill(GetMaxX div 2 -1, GetMaxY div 2 -1, White);
    FloodFill(GetMaxX div 2 -1, GetMaxY div 2 +1, White);
    FloodFill(GetMaxX div 2 +1, GetMaxY div 2 -1, White);
    FloodFill(GetMaxX div 2 +1, GetMaxY div 2 +1, White);
    {ESCRIBE EL TITULO}
    SetTextStyle(3,0,2);
    OutTextXY(0,0,'Regi¢n #1');
    If not Reg1 then
      OutTextXY(0,20,'Adentro')
    Else
      OutTextXY(0,20,'Afuera');
    {COLOCA EL PUNTO}
    SetColor(Red);
    Circle(xp,yp,2);
    PutPixel(xp,yp,Red);
    Readln;
    {------------------------------------------------------------------------}
    ClearDevice;
    SetColor(White);
    {EJES DE COORDENADAS}
    Line(0, GetMaxY div 2, GetMaxX, GetMaxY div 2);
    Line(GetMaxX div 2, 0, GetMaxX div 2, GetMaxY);
    {ROMBO}
    Line(GetMaxX div 2, GetMaxY div 2 + rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 - rf);
    {CUADRADO}
    Line(GetMaxX div 2 - rc, GetMaxY div 2 + rf, GetMaxX div 2 + rc, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2 - rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2 - rf, GetMaxX div 2 - rc, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 + rc, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2 + rf);
    {RELLENA LA REGION}
    FloodFill(GetMaxX div 2 - rc +1 , GetMaxY div 2 + rf -1 , White);
    FloodFill(GetMaxX div 2 + rc -1 , GetMaxY div 2 + rf -1 , White);
    FloodFill(GetMaxX div 2 - rc +1 , GetMaxY div 2 - rf +1 , White);
    FloodFill(GetMaxX div 2 + rc -1 , GetMaxY div 2 - rf +1 , White);
    {ESCRIBE EL TITULO}
    OutTextXY(0,0,'Regi¢n #2');
    If not Reg2 then
      OutTextXY(0,20,'Adentro')
    Else
      OutTextXY(0,20,'Afuera');
    {COLOCA EL PUNTO}
    SetColor(Red);
    Circle(xp,yp,2);
    PutPixel(xp,yp,Red);
    Readln;
    {------------------------------------------------------------------------}
    SetColor(White);
    ClearDevice;
    {EJES DE COORDENADAS}
    Line(0, GetMaxY div 2, GetMaxX, GetMaxY div 2);
    Line(GetMaxX div 2, 0, GetMaxX div 2, GetMaxY);
    {ROMBO}
    Line(GetMaxX div 2, GetMaxY div 2 + rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2, GetMaxX div 2, GetMaxY div 2 - rf);
    {CUADRADO}
    Line(GetMaxX div 2 - rc, GetMaxY div 2 + rf, GetMaxX div 2 + rc, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2 - rf);
    Line(GetMaxX div 2 - rc, GetMaxY div 2 - rf, GetMaxX div 2 - rc, GetMaxY div 2 + rf);
    Line(GetMaxX div 2 + rc, GetMaxY div 2 - rf, GetMaxX div 2 + rc, GetMaxY div 2 + rf);
    {CIRCUNFERENCIA}
    Circle(GetMaxX div 2,GetMaxY div 2 + rf,rf);
    {RELLENA LA REGION}
    FloodFill(GetMaxX div 2 - rc +1 , GetMaxY div 2 + rf -1 , White);
    FloodFill(GetMaxX div 2 + rc -1 , GetMaxY div 2 + rf -1 , White);
    FloodFill(GetMaxX div 2 - rc +1 , GetMaxY div 2 - rf +1 , White);
    FloodFill(GetMaxX div 2 + rc -1 , GetMaxY div 2 - rf +1 , White);
    {ESCRIBE EL TITULO}
    OutTextXY(0,0,'Regi¢n #3');
    If not Reg3 then
      OutTextXY(0,20,'Adentro')
    Else
      OutTextXY(0,20,'Afuera');
    {COLOCA EL PUNTO}
    SetColor(Red);
    Circle(xp,yp,2);
    PutPixel(xp,yp,Red);
    Readln;
    {------------------------------------------------------------------------}
    CloseGraph;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
End.