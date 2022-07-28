#include <stdio.h>

int main(void){
    int n, i=0, par=0, impar=0, maior=0;

    scanf("%i", &n);

    while (n > 1){
        if (n > maior){
            maior = n;
        }
        if (n % 2 == 0) {
            par++;
            n = n / 2;
        }else {
            impar++;
            n = 3 * n + 1;
        }
        i++;
    }
    impar++; // conta mais um impar para o numero 1

    printf("Há %i passos e o maior valor é %i.\n Há %i pares e %i impares", i, maior, par, (impar));

    return 0;
}
