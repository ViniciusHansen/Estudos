#include <stdio.h>
#include <stdbool.h>

int main(void){
    int n, nb,pos=0, neg=0;
    FILE *entrada = fopen("dados.in", "r");
    FILE *saida = fopen("resposta.out", "w");

    while (true){
        fscanf(entrada, "%i", &n);
        if (n<=0){
            break;
        }
        else{
            for(int i=0;i<n;i++){
                fscanf(entrada, "%i", &nb);
                if (nb >= 0){
                    pos++;
                }
                else{
                    neg++;
                }
            }
            fprintf(saida,"%i negativos, %i positivos\n",neg,pos);
        }
    n--;
    }
    fclose(entrada);
    fclose(saida);
    return 0;
}
