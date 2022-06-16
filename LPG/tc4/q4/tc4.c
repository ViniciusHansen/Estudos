#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int main(void){
    int n, nb, *seq, i=0, pos=0, neg=0;
    FILE *entrada = fopen("entrada.bin", "rb");

    while (!feof(entrada)){
            seq = malloc(sizeof(int) * n);
            for(int j=0;j<n;j++){
                fseek(entrada,0 ,SEEK_SET);
                fread(&seq[j], sizeof(int),1,entrada);
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
            printf("%i negativos, %i positivos\n",neg,pos);
    }
    fclose(entrada);
    return 0;
}
