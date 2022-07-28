#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int main(void){
    int n, nb, *v, i=0, pos=0, neg=0;
    FILE *entrada = fopen("entrada.bin", "rb");

    fseek(entrada,0 ,SEEK_SET);
    while (!feof(entrada)){
            fread(&n, sizeof(int),1,entrada);
            printf("%i\n",n);
            v = malloc(sizeof(int) * n);
            for (int j=0;j<n;j++){
                fread(&v[j], sizeof(v[j]), 1, entrada);
            }

            /*
            for(i=0;i<n;i++){
                if (v[i] >= 0){
                    pos++;
                }
                else{
                    neg++;
                }
            }
            free(v);
            printf("%i negativos, %i positivos\n",neg,pos);
*/
            for (int i=0;i<n;i++){
                printf("%i ", v[i]);
            }
            printf("\n");
            free(v);
  }
    fclose(entrada);
    return 0;
}
