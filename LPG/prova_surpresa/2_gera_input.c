#include <stdio.h>

typedef struct {
   char nome[100];
   struct { int dia, mes, ano; } data_nascimento;
   float notas[5];
} Aluno;

int main(void){
    FILE *out = fopen("in.bin","wb");

    Aluno aluno={
        nome = "eduardo";
        data_nascimento={
            dia=23;
            mes=8;
            ano=2002;
        }
        notas = {7.0, 8.4, 9.0, 9.8, 6.0};
    }

    fwrite(aluno ,1, sizeof(Aluno),out);










    return 0;
}
