#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int main(void){
    int n, nb, *seq, i=0, pos=0, neg=0;
    FILE *entrada = fopen("dados.in", "r");
    FILE *saida = fopen("resposta.out", "w");

    while (true){
        fscanf(entrada, "%i", &n);
        if (n<=0){
            break;
        }
        else{
            seq = malloc(sizeof(int) * n);
            for(int j=0;j<n;j++){
                fscanf(entrada, "%i", &seq[j]);
            }

            for(i=0;i<n;i++){
                if (seq[i] >= 0){
                    pos++;
                }
                else{
                    neg++;
                }
            }
            free(seq);
            fprintf(saida,"%i negativos, %i positivos\n",neg,pos);
        }
    n--;
    }
    fclose(entrada);
    fclose(saida);
    return 0;
}
