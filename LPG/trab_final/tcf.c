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
    char local[100];
    char desc[100];
} Evento;

Evento cadastrar(Evento evento[], int count);
void mostra_eventos(Evento evento[], int max);
void eventos_hoje(Evento evento[], int max);
void proximos_eventos(Evento evento[], int count);
Evento* remover_evento(Evento evento[], int max);
Evento* troca(Evento evento[], int cod, int max);

int main(void){
    int count=0, retorno, opcao;
    Evento *evento = (Evento *) malloc(sizeof(Evento));
    FILE *arq = fopen("agenda", "rb");
    while(!feof(arq)){
        retorno = fread(&evento[count], sizeof(Evento), 1, arq);
        printf("%i\n",retorno);
        if(retorno == 1){
            count++;
            evento = realloc(evento, (count+1)*sizeof(Evento));
        }else{
            count--;
            evento = realloc(evento, (count+1)*sizeof(Evento));
        }
    }

    //fseek(arq, 0, SEEK_SET);

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
                    if (evento[count].data.mes < 0 || evento[count].data.mes > 12 || \
                    evento[count].data.dia < 0 || evento[count].data.ano < 0){
                        printf("Erro! Data inválida ou em conflito com outro evento!\n");
                        break;// não faz nada pois o evento será sobreescrito na proxima vez
                    }
                    else{
                        count++;
                        evento = realloc(evento, (count+1)*sizeof(Evento));
                        break;
                    }
            case 2: mostra_eventos(evento, count);
			        break;
            case 3: eventos_hoje(evento, count);
                    break;
            case 4: proximos_eventos(evento, count);
                    break;
            case 5: if (count==0){
                        printf("Erro!\nLista de Eventos vazia\n");
                        break;
                    }
                    else{
                        evento = remover_evento(evento, count);
                        count--;
                        evento = realloc(evento, (count+1)*sizeof(Evento));
                        break;
                    }
            case 6: fclose(arq);
                    FILE *out = fopen("agenda","wb");
                    fseek(arq, 0, SEEK_SET);
                    fwrite(evento, sizeof(Evento), count, out);
                    fclose(out);
                    free(evento);
                    return 0;
		}

	} while(opcao);


    return 1;
}

Evento cadastrar(Evento evento[], int count){
    Evento *temp = (Evento *) malloc(sizeof(Evento));
    if (temp == NULL){
        printf("erro no malloc\n");
    }
    __fpurge(stdin);

    printf("Entre com a data no formato dd/mm/aaaa: \n");
	scanf("%i/%i/%i", &temp->data.dia, &temp->data.mes, &temp->data.ano);
    __fpurge(stdin);
    printf("Entre com o horário de início do evento no formato hh:mm: \n");
	scanf("%i:%i", &temp->inicio.hora, &temp->inicio.minuto);
    __fpurge(stdin);
    printf("Entre com o horário de término do evento no formato hh:mm: \n");
	scanf("%i:%i", &temp->fim.hora, &temp->fim.minuto);
    __fpurge(stdin);
    printf("Local: \n");
    fgets(temp->local, 100, stdin);
    printf("Descrição: \n");
    fgets(temp->desc, 100, stdin);


    for(int i=0;i<=count;i++){
        if(temp->data.dia == evento[i].data.dia && \
        temp->data.mes == evento[i].data.mes && \
        temp->data.ano == evento[i].data.ano && \
        temp->inicio.hora == evento[i].inicio.hora && \
        temp->inicio.minuto == evento[i].inicio.minuto && \
        temp->fim.hora == evento[i].fim.hora && \
        temp->fim.minuto == evento[i].fim.minuto){
            temp->data.ano = -99999; //se ja existir , vamos invalidar a data para descartar o evento na função main
        }
    }

    return *temp;
}

void mostra_eventos(Evento evento[], int max){
    if (max==0){
        printf("Erro!\nLista de Eventos vazia\n");
        return;
    }
    for(int i=0;i<max;i++){
        printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim: \
                %i:%i \n Local: %s \n, Descrição: %s \n\n", evento[i].data.dia, \
                evento[i].data.mes, evento[i].data.ano, evento[i].inicio.hora, \
                evento[i].inicio.minuto, evento[i].fim.hora, evento[i].fim.minuto, \
                evento[i].local, evento[i].desc);
    }
}

void eventos_hoje(Evento evento[], int max){
    if (max==0){
        printf("Erro!\nLista de Eventos vazia\n");
        return;
    }
    int dia, mes, ano;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", &dia, &mes, &ano);
    printf("Estes são os eventos agendados para essa data:\n");
    for(int i=0;i<max;i++){
        if (evento->data.dia == dia && evento->data.mes == mes && evento->data.ano == ano){
            printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim: \
                %i:%i \n Local: %s \n, Descrição: %s \n\n", evento[i].data.dia, \
                evento[i].data.mes, evento[i].data.ano, evento[i].inicio.hora, \
                evento[i].inicio.minuto, evento[i].fim.hora, evento[i].fim.minuto, \
                evento[i].local, evento[i].desc);

        }
    }
}

void proximos_eventos(Evento evento[], int max){
    if (max==0){
        printf("Erro!\nLista de Eventos vazia\n");
        return;
    }
    int dia, mes, ano, count_aux=0;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", &dia, &mes, &ano);
    printf("Estes são os 5 próximos eventos a partir dessa data:\n");

    for(int i=0;i<max;i++){
        if (evento->data.dia >= dia && evento->data.mes >= mes && \
                evento->data.ano >= ano || count_aux >= 5 ){
            printf("Data: %i/%i/%i \n Horário de início: %i:%i \n Horário fim: \
                %i:%i \n Local: %s \n, Descrição: %s \n\n", evento[i].data.dia, \
                evento[i].data.mes, evento[i].data.ano, evento[i].inicio.hora, \
                evento[i].inicio.minuto, evento[i].fim.hora, evento[i].fim.minuto, \
                evento[i].local, evento[i].desc);
            count_aux++;
        }
    }
}

Evento* remover_evento(Evento evento[], int max){
    int dia, mes, ano, hora, minuto;
    printf("Insira a data que deseja buscar (dd/mm/aaaa):\n");
    scanf("%i/%i/%i", &dia, &mes, &ano);
    printf("Insira o horário de início do evento a ser deletado (hh:mm):\n");
    scanf("%i:%i", &hora, &minuto);

    for(int i=0;i<max;i++){
        if (evento->data.dia == dia && evento->data.mes == mes &&
                evento->data.ano == ano && evento->inicio.hora == hora &&
                evento->inicio.minuto == minuto){
            return troca(evento, i, max);
        }
        else{
            printf("Evento não encontrado!\n");
            exit;
        }
    }
}

Evento* troca(Evento evento[], int cod, int max){
    Evento temp;
    temp = evento[cod];
    evento[cod] = evento[max-1];
    evento[max-1] = temp;
    return evento;
}

