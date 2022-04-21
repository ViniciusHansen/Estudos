#include <stdio.h>
#include <time.h>
#include <stdlib.h>


float vet[100];

void ordena(float *ptr, int (*ordem)(float,float)){
	for (int i=0;i<100;i++){
		for (int j=0;j<99;j++){
			if (ordem(ptr[j], ptr[j+1])){
				int aux=ptr[j];
				ptr[j] = ptr[j+1];
				ptr[j+1]=aux;
			}
		}
	}
}

int maior (float a, float b){return a>b;}       // se a>b retorna 1, senão retorna 0
int menor (float a, float b){return a<b;}

int main(void){
	char opcao;

	srand(time(NULL));                          // cria aleatoriedade
	for (int i=0;i<100;i++){                    // preenche o vetor com valores aleatórios
		vet[i] = rand()%10000 / 100.0;
	}

	printf("[C]rescente ou [D]ecrescente?\n");  // "loop" de escolha para ordenar
	do{
		opcao=getchar();
	} while ((opcao != 'd' && opcao !='D') && (opcao != 'c' && opcao !='C'));


	if (opcao == 'c' || opcao =='C'){
        ordena(vet, maior);
    }else{
	    ordena(vet, menor);
	}


	for (int i=0;i<100;i++){
		printf("%.2f ", vet[i]);
	}
	printf("\n");

    return 0;
}



