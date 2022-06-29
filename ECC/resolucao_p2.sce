clear,clc;

z=1 +%i
Z = complex(2,1)
z1= 1 + 2*%i
z4 = z/z1


function z = retangular(r,theta)
    x = r * cosd(theta)
    y = r * sind(theta)
    z = complex(x,y)
endfunction

//Questao 1
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
disp("Raio:")
disp(raio)
disp("angulo:")
disp(ang)
disp("Corrente:")
disp(Is)
//prinf("A Corrente é");

//Tensão
Vs = Is * Zc // U=R * i
disp("tensão:")
disp(Vs)

function capacitancia(Vm, w, phi)
    
endfunction


//disp(ret);

//printf("%i", c);
