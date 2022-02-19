#include <stdio.h>
#define N 6

int main(void){
    int i=0, j=0, v[N], v2[N], iguais=0, maiores=0;

    printf("Insira o Vetor A:\n");
    for (i=0;i<N;i++){
        scanf("%i", &v[i]);
    }

    printf("Insira o Vetor B:\n");
    for (i=0;i<N;i++){
        scanf("%i", &v2[i]);
    }


    for (i=0;i<N;i++){
        for (j=0;j<N;j++){
            if (v[i] == v2[j]){
                iguais++;
            }else if (v[i] < v2[j]){
                maiores++;
            }
        }
        printf("A[%i]=%i Total iguais em B=%i ; Total de maiores em B=%i\n", i, v[i], iguais, maiores);
        iguais = 0;
        maiores = 0;
    }



    return 0;
}
