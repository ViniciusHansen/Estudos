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
    char desc[200];
} Evento;

int main(void){
    int count=0, opcao;
    Evento *evento = (Evento *) malloc(sizeof(Evento) * count);
    FILE *arq = fopen("arq.bin", "rb");

    do {
		printf("Escolha uma opcao:\n");
		printf(" 1 - Adicionar evento \n");
		printf(" 2 - \n");
		printf(" 0 - Sair\n");

		scanf("%i", &opcao);
        __fpurge(stdin);

		switch(opcao) {
            case 1: evento[count] = cadastrar(evento, count);
                    count++;
                    evento = realloc(evento, (count+1)*sizeof(evento));
			   break;
            case 2: printf("escreva o mes(número):\n");
                    scanf("%i", &nb_mes);
                    aniversarios_mes(nb_mes, contato);
			   break;
		}

	} while(opcao);


    return 0;
}

Evento cadastrar(Evento evento, int count){
    Evento *temp =  (Evento *) malloc(sizeof(Evento));
    if (p == NULL){
        printf("erro no malloc\n");
    }

    printf("Entre com a data no formato dd/mm/aaaa: \n");
	scanf("%i/%i/%i", &temp->data.dia, &temp->data.mes, &temp->data.ano);
    printf("Entre com o horário de início do evento no formato hh:mm: \n");
	scanf("%i:%i", &temp->inicio.hora, &temp->inicio.minuto);
    printf("Entre com o horário de término do evento no formato hh:mm: \n");
	scanf("%i:%i", &temp->fim.hora, &temp->fim.minuto);
    printf("Local: \n");
    fgets(temp->local, 200, stdin);
    fflush(stdin);
    printf("Descrição: \n");
    fgets(temp->desc, 200, stdin);
    fflush(stdin);

    count++;
    return *temp;
    free(temp);
}



void mostra_eventos(Evento evento, int max){
    for(int i=0;i<max;i++){
        printf("nome: %s\nemail: %s\ntelefone: %ls\n", contato[i].nome, contato[i].email, &contato[i].telefone.numero);
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
    int opcao;
    do {
		printf("Escolha uma opcao:\n");
		printf(" 1 - listar contatos\n");
		printf(" 2 - aniversarios do mes\n");
		printf(" 3 - aniversarios do dia\n");
		printf(" 4 - adicionar contato\n");
		printf(" 5 - remover contato\n");
		printf(" 0 - sair\n");

		scanf("%i", &opcao);
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

