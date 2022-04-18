#include <stdio.h>
#include <time.h>
#include <stdlib.h>

// ver no moodle


float vet[100];

void ordena(float *ptr, int (*ordem)(float,float)){
	for (int i=0;i<100;i++){
		for (int j=0;j<99;j++){
			if (ordem(vet[j], vet[j+1])){
				int aux=vet[j];
				vet[j] = vet[j+1];
				vet[j+1]=aux;
			}
		}
	}
}

int maior (float a, float b){return a>b;}
int menor (float a, float b){return a<b;}

int main(void){
	char opcao;
	srand(time(NULL));
	for (int i=0;i<100;i++){
		vet[i] = rand()%10000 / 100.0;
	}
	printf("[C]rescente ou [D]ecrescente?\n");
	do{
		opcao=getchar();
	} while ((opcao != 'd' && opcao !='D') && (opcao != 'c' && opcao !='C'));
	
	
	if (opcao == 'c' || opcao =='C'){ordena(vet);}else{
	
	}
		
	
	for (int i=0;i<100;i++){
		printf("%.2f ", vet[i]);
	}	
	printf("\n");
	return 0;
}



