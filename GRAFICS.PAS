Unit Grafics;

Interface
  Var ErrCode:Integer;
  Procedure Grafica(MinX,MinY,MaxX,MaxY: Integer);

{----------------------------------------------------------}
Implementation
  Uses Graph;

  Procedure ModoGrafico;
  Var
    grDriver: Integer;
    grMode: Integer;
  Begin
    grDriver := Detect;
    InitGraph(grDriver, grMode,'C:\bp\bgi\');
    ErrCode := GraphResult;
    If ErrCode <> grOk Then Begin
      Exit;
    End;
  End;

  Procedure Ejes(MinX,MinY,MaxX,MaxY: Integer); {GetMaxY = 479}
  Var                                           {GetMaxX = 639}
    Cx, Cy, Ox, Oy: word;
  Begin
    Rectangle( 0, 0, 639, 479);
    Rectangle(40,20, 599, 459);
    Cx:=(599-40)div(MaxX-MinX+5);
    Cy:=(599-40)div(MaxY-MinY+5);
    If MaxX*MinX<=0 Then
      If MaxX*MinX=0 Then
        If MaxX=0 Then
          Line(((5-maxx)*cx),20,((5-maxx)*cx),459)
        Else Begin
          Line(((5-maxx)*cx),20,((5-maxx)*cx),459);

        End;
  End;

  Procedure Grafica(MinX,MinY,MaxX,MaxY: Integer);
  Begin
   ErrCode:=0;
   ModoGrafico;
   If ErrCode<>0 Then Begin
     CloseGraph;
     Exit;
   End;
   Ejes(MinX,MinY,MaxX,MaxY);
   Readln;
   CloseGraph;
  End;

End.