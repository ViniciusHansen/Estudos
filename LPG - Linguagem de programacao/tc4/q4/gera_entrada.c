#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(void){
    int *v, rand_num, temp_num, n, casos, lower=-100, upper=100, count=1;
    srand(time(0));
    FILE *arq = fopen("entrada.bin", "wb+");
    printf("Quantos casos de teste?\n");
    scanf("%i", &casos);
    fseek(arq, 0, SEEK_SET);
    while (casos){
        n = (rand() % (30 - 1 + 1)) + 1;
        v = malloc(sizeof(int) * n);
        v[0] = n;
        fwrite(&v[0], sizeof(v[0]),1, arq);
        for (int i=1;i<n;i++){
            v[i] = (rand() % (upper - lower + 1)) + lower;
            fwrite(&v[i], sizeof(v[i]),1, arq);
        }
        free(v);
        casos--;
    }
    fclose(arq);
    return 0;
}
