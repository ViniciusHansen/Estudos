#include <stdio.h>

typedef struct{
	int idade, filhos;
	float salario;
	char sexo;
} pesquisa;

int main(void){
	pesquisa a[20];
	int mulheres_500=0;
	float media_salario=0, media_idades=0;
	for (int i=0;i<20;i++){
		printf("Digite a idade seguido do número de filhos:\n");
		scanf("%i %i", &a[i].idade, &a[i].filhos);
		printf("sexo (f ou m):\n");
		scanf(" %c", &a[i].sexo);
		printf("digite o salario:\n");
		scanf("%f", &a[i].salario);
	}
	//media salarial, de idade e mulheres q ganham mais de 500

	for (int j=0;j<20;j++){
		if (a[j].sexo == 'f' && a[j].salario >= 500){mulheres_500++;}
		media_salario += a[j].salario;
		media_idades += a[j].idade;
	}
	media_salario /= 20;
	media_idades /= 20;

	printf("Média de Salarios=%f, Média de idade=%f, Mulheres que ganham mais de 500 reais=%i", media_salario, media_idades, mulheres_500);





	return 0;
}
