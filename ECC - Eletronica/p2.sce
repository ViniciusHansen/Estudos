clear,clc;

// Funções
    function z = retangular(r,theta)
        x = r * cosd(theta)
        y = r * sind(theta)
        z = complex(x,y)
    endfunction


//Questão 1
    C1=retangular(10,0)
    [raio ang] = polar(C1)
    ang = real(ang) * 180/%pi
    C2=retangular(5,45)
    [raio2 ang2] = polar(C2)
    ang2 = real(ang2) * 180/%pi
    C3=retangular(20,90)
    [raio3 ang3] = polar(C3)
    ang3 = real(ang3) * 180/%pi

    printf("Questão 1: \n V1(t) = %.2f /_ %.2f \n V2(t) = %.2f /_ %.2f \n V3(t) = %.2f /_ %.2f",raio, ang, raio2, ang2, raio3, ang3 );
    
    
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
    
    printf("Questão 2: \n Corrente = %.2f /_ %.2f\n Tensão= %.2f /_ %.2f\n", raio, ang, raio2, ang2)
    printf("\n---------------------------------------\n")

// Questão 4
    //Queremos Vc e It(Is)
    R=5
    Xl=8
    Xc=12
    V = retangular(20,20)
    Zc=complex(R, Xc)
    //V=R*I
    Ic=V/Zc
    Vc= (V * complex(0, Xc))/Zc
    Zl=complex(0,Xl)
    Il=V/Zl
    It= Ic + Il
    [raio ang]= polar(It)
    ang = real(ang) * 180/%pi
    [raio2 ang2]= polar(Vc)
    ang2 = real(ang2) * 180/%pi
    
    printf("Questão 4:\n Itotal= %.2f /_ %.2f\n Vc= %.2f /_ %.2f\n", raio, ang, raio2, ang2)
    printf("\n---------------------------------------\n")




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
    
    printf("Questão 5:\n Intensidade da Corrente: %i\n Angulo de defasagem entre\n a corrente e a tensão da fonte: %.2f\n", raio, ang)
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
    printf("\n---------------------------------------\n")

// Questão 7
    R1=3
    R2=8
    L=0.0106
    C=0.000446
    f=60
    V=retangular(100,0)
    Xl=2*%pi*f*L        //imaginario
    Xc=(-1)/(2*%pi*f*C) //imaginario
    Zl=complex(R1,Xl)
    Zc=complex(R2,Xc)
    Zeq= (Zl*Zc)/(Zl+Zc)
    [raio ang] = polar(Zeq)
    ang = real(ang) * 180/%pi
    //correntes
    I1= V/Zl
    [raio2 ang2]=polar(I1)
    I2= V/Zc
    [raio3 ang3]=polar(I2)
    printf("Questão 7:\n Zeq= %.2f /_ %.2f \n I1= %.2f /_ %.2f \n I2 = %.2f /_ %.2f \n", raio, ang, raio2, ang2, raio3, ang3)
    printf("\n---------------------------------------\n")











