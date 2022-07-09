clear,clc;

// Funções
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
    disp(C2)
    
    c3=20
    t3=90
    C3=polar(complex(c3,t3))
    // não faz sentido 
    // não é isso
    
    printf("Questão 1: \n V1(t) = %i \n V2(t) = %i \n V3(t) = %i", real(C1), real(C2), real(C3));
    
    
    printf("\n---------------------------------------\n")


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
    //Tensão
    Vs = Is * Zc // U=R * i
    [raio2 ang2] = polar(Vs)
    ang2 = real(ang2) * 180/%pi
    
    printf("Questão 2: \n (Corrente) \n    Raio: %.2f \n    angulo: %.2f\n (Tensão) \n    Raio: %.2f \n    angulo: %.2f", raio, ang, raio2, ang2)
    printf("\n---------------------------------------\n")

// Questão 4
    R=5
    Xl=8
    Xc=12
    V = retangular(20,20)
    Zc=complex(R, Xc)
    //V=R*I
    Ic=V/Zc
    Vc= Zc * Ic
    Zl=complex(0,Xl)
    Il=V/Zl
    It= Ic + Il
    disp(It)






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
    
    printf("Questão 5:\n Intensidade da Corrente: %i\n Angulo de defasagem entre\n a corrente e a tensão da fonte: %.2f", raio, ang)
    printf("\n---------------------------------------\n")

    


// Questão 6
// Queremos Zr e Is

    R=1
    Xc=2
    Xl=3
    Zc=complex(0,Xc)
    Zl=complex(0,Xl)
    V=retangular(120,0)
    Zlc=(Zl * Zc)/(Zl + Zc)
    
    Zr=complex(R,imag(Zlc))
    [raio ang] = polar(Zr)
    ang = real(ang) * 180/%pi
    Is = V/Zr
    [raio2 ang2] = polar(Is)
    ang2 = real(ang2) * 180/%pi
    printf("Questão 6:\n Zr=%.2f /_ %.2f \n Is=%.2f /_ %.2f \n", raio, ang, raio2, ang2)

    











