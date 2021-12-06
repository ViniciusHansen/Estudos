#include <stdio.h>

int main(){
    int a, b, c, maior, maior_pos, menor, menor_pos, total_positivos, i;
    scanf("%i", &a);
    scanf("%i", &b);
    scanf("%i", &c);
    int entrada[3] = {a, b, c};
    maior = 0;
    menor = 9999999;
    total_positivos = 0;
    for (i = 0;i < 3; i++){
        if (entrada[i] > maior){
            maior = entrada[i];
            maior_pos = i + 1;
        }else if (entrada[i] < menor){
            menor = entrada[i];
            menor_pos = i + 1;
        }if (entrada[i] >= 0) {
            total_positivos++;
        }

    }
    printf("Maior: %i ( na posição %i)\n", maior, maior_pos);
    printf("Menor: %i ( na posição %i)\n", menor, menor_pos);
    printf("Total de positivos: %i\n", total_positivos);
    return 0;
}




