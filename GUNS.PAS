Program Sweet_Child_of_mine;
Uses Crt;

Const
C0=133; C0sos=140; D0=146; D0sos=156; E0=166; F0=175; F0sos=186; G0=196; G0sos=209; A0=221; A0sos=234; B0=246;
C=263; Csos=277; D=290; Dsos=310; E=330; F=349; Fsos=370; G=390; Gsos=415; A=440; Asos=465; B=490; C2 = 1043;
C1=523; C1sos=550; D1=577; D1sos=617; E1=657; F1=695; F1sos=736; G1=777; G1sos=827; A1=877; A1sos=927; B1=977;
corchea=110; negra=220; blanca=440; redonda=880;

Procedure Sonar(Nota,Dur : Word);
Begin
  Sound(Nota);
  Delay(Dur);
End;

Procedure Detener(Dur : Word);
Begin
  NoSound;
  Delay(Dur);
End;

Procedure Sweet(R,T : Word);
Begin
  Sonar(R,negra);Sonar(T,negra);Sonar(A,negra);Sonar(G,negra);
  Sonar(G1,negra);Sonar(A,negra);Sonar(F1sos,negra);Sonar(A,negra);
  Sonar(R,negra);Sonar(T,negra);Sonar(A,negra);Sonar(G,negra);
  Sonar(G1,negra);Sonar(A,negra);Sonar(F1sos,negra);Sonar(A,negra);
End;

Procedure Guitar;
Begin
  Sweet(D,D1);Sweet(E,D1);Sweet(E,E1);Sweet(D,D1);Detener(0);
End;

Procedure Bass;
Begin
  Sonar(D,blanca+negra);Sonar(Fsos,blanca);Sonar(D,negra);Sonar(Fsos,negra);
  Sonar(G,negra);Sonar(A,blanca);Sonar(B,negra);Sonar(A,negra);Sonar(G,negra);
  Sonar(Fsos,negra);Sonar(D,negra);Sonar(Fsos,negra);Sonar(E,blanca+negra);
  Sonar(G,blanca+negra+corchea);Sonar(E,negra);Sonar(G,negra);Sonar(Fsos,negra);Sonar(E,negra);
  Sonar(G,blanca);Sonar(Fsos,negra);Sonar(E,negra);Sonar(D,negra);Sonar(G,redonda+blanca+negra);
  Sonar(D,negra);Sonar(G,redonda+blanca+negra);
  Sonar(D,negra);Sonar(G,negra);Sonar(Fsos,negra);Sonar(E,negra);Sonar(G,blanca);Sonar(Fsos,negra);
  Sonar(E,negra);Sonar(D,negra);Sonar(G,negra);Sonar(Fsos,negra);Sonar(E,negra);Sonar(G,blanca);
  Sonar(Fsos,negra);Sonar(E,negra);Sonar(D,negra);Detener(10);
  End;

Procedure Estrofa;
  Begin
{   Sonar(A1,10);Sonar(A1,10);Sonar(A1,10);Sonar(A1,10);
   Sonar(A1,negra);Sonar(G1,negra);Sonar(F1sos,negra);
   Sonar(G1,negra);Sonar(A1,negra);Sonar(G1,negra);Sonar(F1sos,negra);}
  End;

Begin
   ClrScr;
   Guitar;Bass;Guitar;
End.