#include <stdio.h>
#include <stdlib.h>
#include <stdio_ext.h>
#include <string.h>

typedef struct{
    int dia;
    int mes;
    int ano;
} Data;

typedef struct{
    int hora;
    int minuto;
} Hora;


typedef struct{
    Data data;
    Hora inicio;
    Hora fim;
    char local[200];
    char descrição[200];
} Evento;


void busca_contato(contact contato[], int max){
    char nome_busca[100];
    printf("Insira o nome do contato que deseja buscar:\n");
    fgets(nome_busca, 100, stdin);
    for(int i=0;i<max;i++){
        if (strcmp(nome_busca,contato[i].nome)==0){
            printf("nome: %s\nemail: %s\ntelefone: %ls\n", contato[i].nome, contato[i].email, &contato[i].telefone.numero);
        }
    }
}

void aniversarios_mes(int nb_mes, contact contato[]){
    for(int i=0;i<N;i++){
        if (nb_mes == contato[i].data.mes){
            printf("Nome: %s\n", contato[i].nome);
        }
    }
}

void aniversarios_dia(int dia, int nb_mes, contact contato[]){
    for(int i=0;i<N;i++){
        if (nb_mes == contato[i].data.mes && dia == contato[i].data.dia){
            printf("Nome: %s\n", contato[i].nome);
        }
    }
}



contact add_contato(contact contato[], int count){

    contact *p =  (contact *) malloc(sizeof(contact));
    if (p == NULL){
        printf("erro no malloc\n");
    }

    printf("Entre com os dados da pessoa: \nNome: \n");
	fgets(p->nome, 20, stdin);
    fflush(stdin);
    printf("Email: \n");
	fgets(p->email, 20, stdin);
    fflush(stdin);
	printf("Rua: \n");
	fgets(p->endereco.rua, 20, stdin);
    fflush(stdin);
    printf("Número: \n");
    scanf("%ls", &p->endereco.numero);
    __fpurge(stdin);
	printf("Complemento: \n");
	fgets(p->endereco.complemento, 20, stdin);
    fflush(stdin);
	printf("Bairro: \n");
	fgets(p->endereco.bairro, 20, stdin);
    fflush(stdin);
	printf("CEP: \n");
    __fpurge(stdin);
    scanf("%ls", &p->endereco.cep);
    __fpurge(stdin);
	printf("Cidade: \n");
	fgets(p->endereco.cidade, 20, stdin);
    fflush(stdin);
	printf("Estado: \n");
	fgets(p->endereco.estado, 20, stdin);
    fflush(stdin);
	printf("País: \n");
	fgets(p->endereco.pais, 20, stdin);
    fflush(stdin);
    printf("Fone (DDD): \n");
    __fpurge(stdin);
	scanf("%ls", &p->telefone.ddd);
    __fpurge(stdin);
    printf("Fone (numero): \n");
	while (getchar() != '\n'){
        scanf("%ls", &p->telefone.numero);
    }
    __fpurge(stdin);


    count++;
    return *p;

    free(p);
}

contact* troca(contact contato[], int cod, int max){
    contact temp;
    temp = contato[cod];
    contato[cod] = contato[max-1];
    contato[max-1] = temp;
    return contato;
}

contact* rm_contato(contact contato[], int max){
    int i, cod;
    for (i = 0; i < max; i++){
        printf("[%d] - %s\n", i, contato[i].nome);
    }

    printf("\n Digite o codigo do contato para deletar: ");
    scanf("%d", &cod);

    return troca(contato, cod, max);
}



int main(void){
    int count=0;
    contact *contato = (contact *) malloc(sizeof(contact) * (count+1));
    char nome_busca[100];
    int opcao, nb_mes, dia;
    do {
		printf("Escolha uma opcao:\n");
		printf(" 1 - listar contatos\n");
		printf(" 2 - aniversarios do mes\n");
		printf(" 3 - aniversarios do dia\n");
		printf(" 4 - adicionar contato\n");
		printf(" 5 - remover contato\n");
		printf(" 0 - sair\n");

		scanf("%i", &opcao);
		//fflush(stdin;)
        __fpurge(stdin);

		switch(opcao) {
            case 1: busca_contato(contato, count);
			   break;
            case 2: printf("escreva o mes(número):\n");
                    scanf("%i", &nb_mes);
                    aniversarios_mes(nb_mes, contato);
			   break;
            case 3: printf("escreva a data (dd/mm):\n");
                    scanf("%i/%i", &dia, &nb_mes);
                    aniversarios_dia(dia, nb_mes, contato);
			   break;
			case 4:
                    contato[count] = add_contato(contato, count);
                    count++;
                    contato = realloc(contato, (count+1) * sizeof(contato));
			   break;
            case 5:
                    contato = rm_contato(contato, count);
                    count--;
                    contato = realloc(contato, (count+1) * sizeof(contato));
               break;
		}

	} while(opcao);
    return 0;
}
