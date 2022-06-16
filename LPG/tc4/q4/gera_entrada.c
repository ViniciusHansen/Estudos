#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(void){
    int rand_num, temp_num, n, casos, lower=-100, upper=100, count=1;
    srand(time(0));
    FILE *arq = fopen("entrada.bin", "wb");
    printf("Quantos casos de teste?\n");
    scanf("%i", &casos);
    while (casos){
        n = (rand() % 30) + 1;
        fprintf(arq, "%i ", n);
        for (int i=0;i<n;i++){
            temp_num = (rand() % (upper - lower + 1)) + lower;
            //fprintf(arq, "%i ", temp_num);
            fwrite(&temp_num, sizeof(int),1, arq);
        }
        //fprintf(arq, "\n");
        casos--;
    }
    //fprintf(arq,"0\n");
    fclose(arq);
    return 0;
}
