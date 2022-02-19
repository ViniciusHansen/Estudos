#include <stdio.h>

int identificaTriangulo ( float a, float b, float c){
    if (a == b && b == c){
        //equilatero
        return 0;
    }
    else if (a == b || c == b || a == c){
        //isosceles
        return 1;
    }
    else{
        //escaleno
        return 2;
    }
}

int main (void){
    float t1,t2,t3;
    scanf("%f", &t1);
    scanf("%f", &t2);
    scanf("%f", &t3);

    if ((t1 < t2+t3) && (t2 < t1+t3) && (t3 < t1+t2)){
        if (identificaTriangulo(t1, t2, t3) == 0){
            printf("Equilátero\n");

        }
        if (identificaTriangulo(t1, t2, t3) == 1){
            printf("Isósceles\n");

        }
        if (identificaTriangulo(t1, t2, t3) == 2){
            printf("Escaleno\n");

        }

    }else{
        printf("nao forma triângulo\n");
    }

    return 0;
}

