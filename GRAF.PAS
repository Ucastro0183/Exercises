Program Test;
Uses
  Crt,Graph;
  {******************* Presentaci¢n de Programa **************************}
  Procedure Presentacion;
  Var
    GDriver,GMode,GErr,I : Integer;
    R,G,B : Integer;
    Function F(X:Real):Real;
    Begin
      F := 5*Sin(X)*Sin(X)*Sin(X)*Sin(X) - 3.2*Sin(X)*Sin(X)*Sin(X) + 2*Sin(X)*Sin(X) - Sin(X);
    End;

    Procedure PTOX;
    Var
      K,H : LongInt;
      M,N,X,Y : Real;
    Begin
      M := 5*Pi/615;
      N := -390/12.43;
      For K := 0 To 640 Do
        Begin
        X := K*M-25*M;
        Y := F(X);
        H := Round(Y*N)+460;
        If H > 90 Then
        PutPixel(K,H,1);
        End;
    End;

    Procedure Ejes;
    Var
      J : Integer;
    Begin
      For J:=0 To 640 Do
        Begin
          PutPixel(J,460,0);
        End;
      For J:=91 To 480 Do
        Begin
          PutPixel(25,J,0);
        End;
      SetColor(0);
      OutTextXY(570,470,'T(Min)');
      OutTextXY(05,95,'C');
      OutTextXY(02,107,'___');
      OutTextXY(02,105,'Mol');
      OutTextXY(02,117,'Lts');
    End;
  Begin
    GDriver := Detect;
    InitGraph(GDriver,GMode,'c:\bp\bgi');
    GErr := IOResult;
    If IOResult <> GrOk Then
      Halt(1);
    SetFillStyle(1,15);
    Bar(0,0,640,480);
    SetFillStyle(1,Yellow);
    Bar(0,0,640,30);
    SetFillStyle(1,Blue);
    Bar(0,31,640,60);
    SetFillStyle(1,Red);
    Bar(0,61,640,90);
    SetColor(15);
    OutTextXY(200,43,'UNIVERSIDAD CENTRAL DE VENEZUELA');
    Ejes;
    PTOX;
    Repeat
      For I := 0 To 80 Do
        Begin
          Ejes;
          SetColor(15); OutTextXY(640-10*(I-1),100,'Pulse cualquier tecla para continuar');
          SetColor(00); OutTextXY(640-10*I,100,'Pulse cualquier tecla para continuar');
          Delay(100);
          If KeyPressed Then Break;
        End;
    Until KeyPressed;
    SetFillStyle(1,0);
    Bar(0,0,640,480);
    SetTextStyle(4,0,4);
    For R := 0 To 63 Do
    Begin
      G:=R; B:=R; SetColor(63); Delay(90);
      SetRGBPalette(63,R,G,B);
      OutTextXY(160,200,'    PROYECTO DE');
      OutTextXY(150,250,'METODOS NUMERICOS');
    End;
    Delay(500);
    For R := 63 DownTo 0 Do
    Begin
      G:=R; B:=R; SetColor(63); Delay(90);
      SetRGBPalette(63,R,G,B);
      OutTextXY(160,200,'    PROYECTO DE');
      OutTextXY(150,250,'METODOS NUMERICOS');
    End;
    Delay(500);
    CloseGraph;
  End;
Begin
  Presentacion;
End.
