Program ACM_B_1991;
Var
  t, t1 : text;

Begin
  Assign(t,'B_1991.in');
  Assign(t1,'B_1991.out');
  Reset(t);
  Rewrite(t1);
  Repeat
  until eof(t);
  Close(t);
  Close(t1);
End.