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
		printf("Escolha uma opção:\n");
		printf(" 1 - Cadastrar um novo evento na agenda\n");
		printf(" 2 - Mostrar todos os eventos da agenda\n");
		printf(" 3 - Mostrar todos os eventos de uma data\n");
		printf(" 4 - A partir da data atual, mostrar os 5 (cinco) próximos eventos\n");
		printf(" 5 - Remover evento\n");
		printf(" 6 - Sair do programa\n");

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
            case 0: free(evento);
                    return 0;
		}

	} while(opcao);


    return 1;
}

Evento* cadastrar(Evento evento, int count){
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
        printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim:
                %i:%i \n Local: %s \n, Descrição: %s \n\n", &evento[i]->data.dia,
                &evento[i]->data.mes, &evento[i]->data.ano, &evento[i]->inicio.hora,
                &evento[i]->inicio.minuto, &evento[i]->fim.hora, &evento[i]->fim.minuto,
                evento[i]->local, evento[i]->desc);
    }
}

void eventos_hoje(Evento evento, int max){
    int dia, mes, ano;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", dia, mes, ano);
    printf("Estes são os eventos agendados para essa data:\n");
    for(int i=0;i<max;i++){
        if (&evento.data.dia == dia && &evento.data.mes == mes && &evento.data.ano == ano){
            printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim:
                %i:%i \n Local: %s \n, Descrição: %s \n\n", &evento[i]->data.dia,
                &evento[i]->data.mes, &evento[i]->data.ano, &evento[i]->inicio.hora,
                &evento[i]->inicio.minuto, &evento[i]->fim.hora, &evento[i]->fim.minuto,
                evento[i]->local, evento[i]->desc);

        }
    }
}

void proximos_eventos(Evento evento, int count){
    int dia, mes, ano, count_aux=0;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", dia, mes, ano);
    printf("Estes são os 5 próximos eventos a partir dessa data:\n");
    for(int i=0;i<max;i++){
        if (&evento.data.dia >= dia && &evento.data.mes >= mes &&
                &evento.data.ano >= ano || count_aux >= 5 ){
            printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim:
                %i:%i \n Local: %s \n, Descrição: %s \n\n", &evento[i]->data.dia,
                &evento[i]->data.mes, &evento[i]->data.ano, &evento[i]->inicio.hora,
                &evento[i]->inicio.minuto, &evento[i]->fim.hora, &evento[i]->fim.minuto,
                evento[i]->local, evento[i]->desc);
            count_aux++;
        }
    }
}

Evento* remover_evento(Evento evento[], int max){
    int dia, mes, ano, hora, minuto;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", dia, mes, ano);
    printf("Insira o horário de início do evento a ser deletado (hh:mm):\n");
    scanf("%i:%i", hora, minuto);

    for(int i=0;i<max;i++){
        if (&evento.data.dia == dia && &evento.data.mes == mes &&
                &evento.data.ano == ano && &evento.inicio.hora == hora &&
                &evento.inicio.minuto == minuto){
            return troca(evento, i, max);
        }
    }
}


// referencia
contact* troca(contact contato[], int cod, int max){
    contact temp;
    temp = contato[cod];
    contato[cod] = contato[max-1];
    contato[max-1] = temp;
    return contato;
}

