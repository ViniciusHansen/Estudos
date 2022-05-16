#include <stdio.h>

int main(void){
    const int NUM_NOTAS = 5;
    int notas[] = {50,20,10,5,2};
    //int gavetas[] = {3,3,3,3,3};
    int valor,i;

    printf("Entre com o valor a sacar: ");
    scanf("%d",&valor);

      for(i=0; i<NUM_NOTAS; i++){
        int qtd = valor/notas[i];
        if(qtd>0){
          printf ("%d nota(s) de R$  %d,00\n",qtd, notas[i]);
          valor -= qtd*notas[i];
        }
      }

  return 0;
}
