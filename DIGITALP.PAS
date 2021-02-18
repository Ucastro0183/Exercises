Uses CRT;
Var i:LongINt;

Function Pd(n:LongINt):LongINt;
Var A,Um, C, D, U : LongINt;
Begin
  A:=N;
  If N>9 Then Begin
    Um:= N div 1000;
    N := N-1000* Um;
    C := N div 100 ;
    N := N-100 * C ;
    D := N div 10;
    U := N-10  * D ;
    A:=1;
    If Um<>0 Then A:= A * Um;
    If C <>0 Then A:= A * C;
    If D <>0 Then A:= A * D;
    If U <>0 Then A:= A * U;
  End;
  Pd:=A;
End;

Begin
  Clrscr;
  i:=1800;
  Repeat
    i:=Pd(i);
  Until i=Pd(i);
  WriteLn(i);
End.








