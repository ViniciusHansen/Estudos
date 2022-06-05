#include <stdio.h>
#include <stdlib.h>
#include <stdio_ext.h>
#include <string.h>
#define N 100


typedef struct
{
    char rua[100];
    int numero;
    char complemento[100];
    char bairro[100];
    int cep;
    char cidade[100];
    char estado[100];
    char pais[100];
} endereco;

typedef struct
{
    int ddd;
    int numero;
} tel;

typedef struct
{
    int dia;
    int mes;
    int ano;
} date;

typedef struct
{
    char nome[100];
    char email[100];
    tel telefone;
    endereco endereco;
    date data;
} contact;


contact contato[N];
int count=0;

void busca_contato(void){
    char nome_busca[100];
    printf("Insira o nome do contato que deseja buscar:\n");
    fgets(nome_busca, 100, stdin);
    for(int i=0;i<N;i++){
        if (strcmp(nome_busca,contato[i].nome)==0){
            printf("nome: %s\nemail: %s\ntelefone: %i\n", contato[i].nome, contato[i].email, &contato[i].telefone);
        }
    }
}

void aniversarios_mes(int nb_mes){
    for(int i=0;i<N;i++){
        if (nb_mes == contato[i].data.mes){
            printf("Nome: %s\n", contato[i].nome);
        }
    }
}

void aniversarios_dia(int dia, int nb_mes){
    for(int i=0;i<N;i++){
        if (nb_mes == contato[i].data.mes && dia == contato[i].data.dia){
            printf("Nome: %s\n", contato[i].nome);
        }
    }
}



void add_contato(void){
    contact novo_contato;

    printf("Entre com os dados da pessoa: \nNome: \n");
	fgets(novo_contato.nome, 20, stdin);
    fflush(stdin);
    printf("Email: \n");
	fgets(novo_contato.email, 20, stdin);
    fflush(stdin);
	printf("Rua: \n");
	fgets(novo_contato.endereco.rua, 20, stdin);
    fflush(stdin);
    printf("Número: \n");
    scanf("%i", &novo_contato.endereco.numero);
    fflush(stdin);
	printf("Complemento: \n");
	fgets(novo_contato.endereco.complemento, 20, stdin);
    fflush(stdin);
	printf("Bairro: \n");
	fgets(novo_contato.endereco.bairro, 20, stdin);
    fflush(stdin);
	printf("CEP: \n");
    scanf("%i", &novo_contato.endereco.cep);
    fflush(stdin);
	printf("Cidade: \n");
	fgets(novo_contato.endereco.cidade, 20, stdin);
    fflush(stdin);
	printf("Estado: \n");
	fgets(novo_contato.endereco.estado, 20, stdin);
    fflush(stdin);
	printf("País: \n");
	fgets(novo_contato.endereco.pais, 20, stdin);
    fflush(stdin);
    printf("Fone (DDD): \n");
	scanf("%i", &novo_contato.telefone.ddd);
    //fflush(stdin);
    printf("Fone (numero): \n");
	scanf("%i", &novo_contato.telefone.numero);
    fflush(stdin);


    //contact *p =  (contact *) malloc(sizeof(contact));
    //if (p == NULL){
    //    printf("erro no malloc\n");
    //}


    contato[count]=novo_contato;

    count++;
    //free(p);
//work in progress
}



int main(void){
    char nome_busca[100];
    int opcao, nb_mes, dia;
    do {
		printf("Escolha uma opcao:\n");
		printf(" 1 - listar contatos\n");
		printf(" 2 - aniversarios do mes\n");
		printf(" 3 - aniversarios do dia\n");
		printf(" 4 - adicionar contato\n");
		printf(" 0 - sair\n");

		scanf("%i", &opcao);
		//fflush(stdin;)
        __fpurge(stdin);

		switch(opcao) {
            case 1: busca_contato();
			   break;
            case 2: printf("escreva o mes(número):\n");
                    scanf("%i", nb_mes);
                    aniversarios_mes(nb_mes);
			   break;
            case 3: printf("escreva a data (dd/mm):\n");
                    scanf("%i/%i", dia, nb_mes);
                    aniversarios_dia(dia, nb_mes);
			   break;
			case 4: add_contato();
			   break;
		}

	} while(opcao);
    return 0;
}

