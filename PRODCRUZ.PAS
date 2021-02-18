Program Producto_Cruz;
Uses
  Crt;
Type
  vec = array [1..50] of Integer;
Var
  a,b,x:vec;
  f:Word;

Procedure dimencion(Var a:Word);
Begin
  Write('Dimencion del Vector = '); Readln(a);
End;

Procedure Lee_Vector(Var A:vec; Dim:word; nombre:char);
Var
  I:Word;

Begin
  For i:=1 to Dim do  Begin
    Write(nombre,'(',i,') = '); Readln(a[i]); End;
End;
Procedure ProdCruz(a,b:vec; f:word; Var x:vec);

Begin
  X[1]:= a[2]*b[3] - a[3]*b[2];
  x[2]:= a[3]*b[1] - a[1]*b[3];
  x[3]:= a[1]*b[2] - a[2]*b[1];
  Write('(',x[1],';',x[2],';',x[3],')');
End;


Begin
  Clrscr;
  f:=3;
  Lee_Vector(a,f,'a');
  Lee_Vector(b,f,'b');
  Write('a x b = ');
  ProdCruz(a,b,f,x);
  Readln;
End.