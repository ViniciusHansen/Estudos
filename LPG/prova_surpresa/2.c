#include <stdio.h>
#include <stdlib.h>

typedef struct {
   char nome[100];
   struct { int dia, mês, ano; } data_nascimento;
   float notas[5];
} Aluno;

int main(void){
    int i, media=0, n=0;
    FILE *in = fopen("in.bin","rb");
    FILE *out = fopen("out.txt","w");
    Aluno *aluno = malloc(sizeof(Aluno)*(n+1));

    while(!feof(in)){
        fread(&aluno, sizeof(Aluno), (n+1), in);
        n++;
        for(i=0;i<5;i++){
            media += aluno->notas[i];
        }
        media /= 5;
        if(media >= 7){
            fprintf(out, "%s\n", aluno->nome);
        }
        media = 0;
        aluno = realloc(aluno, sizeof(Aluno)*(n+1));
    }

    free(aluno);
    fclose(in);
    fclose(out);
    return 0;
}
