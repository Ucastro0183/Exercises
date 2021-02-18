uses Graph,u_bart1,u_bart2,u_bart3,u_bart4;
const dirbart1:pointer=@bart1;
      dirbart2:pointer=@bart2;
      dirbart3:pointer=@bart3;
      dirbart4:pointer=@bart4;
var
 grDriver: Integer;
 grMode  : Integer;
 ErrCode : Integer;
begin
 grDriver := Detect;
 InitGraph(grDriver, grMode,'C:\TP\BGI');
 ErrCode := GraphResult;
 if ErrCode = grOk then
 begin
   {se coloca la imagen con PutImage}
   setrgbpalette(20,50,40,0);
   PutImage(0,240,dirbart3^,CopyPut);
   PutImage(0,0,dirbart1^,CopyPut);
   PutImage(320,0,dirbart2^,CopyPut);
   PutImage(320,240,dirbart4^,CopyPut);
   Readln;
   CloseGraph;
 end
 else
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.
