#include <stdio.h>

void troca (int *i, int *j){

	int aux;
	aux = *i;
	*i = *j;
	*j = aux;
}

int main(void){
	//criando ponteiro
	//int x = 2;
	//int *ponteiro = &x;
	//x = 40;
	//printf("%i \n", *ponteiro);

	//aplicação da função troca
	int a=4, b=6;
	troca(&a, &b);  //passa o endereço de memória para os ponteiros na função troca
	printf("a:%i b:%i \n", a, b);

	return 0;
}
