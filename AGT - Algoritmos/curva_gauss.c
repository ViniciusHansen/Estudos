#include <stdio.h>

int main (void){
    int i, maior_pos;
    float v[10], v2[10], maior = 0;
    for (i = 0; i < 10; i++){
        scanf("%f", &v[i]);
    }
    for (i = 0; i < 10; i++){
        if (v[i] > maior) {
            maior = v[i];
            maior_pos = i;
        }
    }
    for (i = 0; i < 10; i++){
        if (v[i] == maior){
            v2[i] = 10;
        }else {
            v2[i] = v[i] * (10.0/maior);
        }
    }
    printf("%.1f\n", maior);
    printf("%i\n", maior_pos);
    printf("%.3f\n", (10.0/maior));
    printf ("Notas Originais | Notas Ajustadas\n");
    for (i = 0; i < 10; i++){
        printf("%.1f | %.1f\n", v[i], v2[i]);
    }




    return 0;
}
