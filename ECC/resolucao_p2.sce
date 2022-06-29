clear,clc;


function z = retangular(r,theta)
    x = r * cosd(theta)
    y = r * sind(theta)
    z = complex(x,y)
endfunction
//Questão 1
c1=10
t1=0
C1=polar(complex(c1,t1))

c2=5
t2=45
C2=polar(complex(c2,t2))

c3=20
t3=90
C3=polar(complex(c3,t3))

disp("Questão 1:")
disp("V1(t) = ")
disp(C1)
disp("V2(t) = ")
disp(C2)
disp("V3(t) = ")
disp(C3)
disp("---------------------------------------")
//Questao 2
Vm=10
w=4
phi=0
//capacitor
C =0.1
Xc=1/(w*C)
Zc=complex(0, -Xc)
// Impedancia total
Zt = 5 + Zc
//Corrente total
Is = Vm/Zt
[raio ang] = polar(Is)
ang = real(ang) * 180/%pi
disp("Questão 2:")
disp("Raio:")
disp(raio)
disp("angulo:")
disp(ang)
disp("Corrente:")
disp(Is)

//Tensão
Vs = Is * Zc // U=R * i
disp("tensão:")
disp(Vs)

disp("---------------------------------------")
// Questão 5
R=4
Xl=3
V=complex(20,0)
Zl=complex(R,Xl)
//u=ri
I = V/Zl


[raio ang] = polar(I)
ang = real(ang) * 180/%pi
raio = real(raio)


disp("Questão 5:")
disp("Corrente:")
disp(I)
disp(raio)
disp(ang)














