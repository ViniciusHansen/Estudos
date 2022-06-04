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

void busca_contato(void){
    char nome_busca[100];
    printf("Insira o nome do contato que deseja buscar:\n");
    fgets(nome_busca, 100, stdin);
    for(int i=0;i<N;i++){
        if (strcmp(nome_busca,contato[i].nome)==0){
            printf("nome: %s\n
                    email: %s\n
                    telefone: %s\n",
                    contato[i].nome, contato[i].email, contato[i].tel);
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

void add_contato(contact contato){

    contact *p =  (contact *) malloc(sizeof(contact));
    if (p == NULL){
        printf("erro no malloc\n");
        return 1;
    }

    printf("Entre com os dados da pessoa:\n
            Nome: \n");
	fgets(contato.nome, 20, stdin);
	printf("Email: ");
	fgets(r.email, 20, stdin);
	printf("Fone: ");
	fgets(r.telefone, 20, stdin);

    contato[u]=*p;
    u++;
//work in progress
}


int main(void){
    contact contato[N];
    char nome_busca[100];
    int nb_mes, dia, u=0;
    do {
		printf("Escolha uma opcao:\n");
		printf(" 1 - listar contatos\n");
		printf(" 2 - aniversarios do mes\n");
		printf(" 3 - aniversarios do dia\n");
		printf(" 4 - adicionar contato\n");
		printf(" 0 - sair\n");

		scanf("%i", &opcao);
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
			case 4: add_contato(contato);
			   break;
			case 5: exclui_registro(f);
			   break;
		}

	} while(opcao);






    return 0;
}

