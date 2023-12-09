// Autores: Vinicius Hansen e João Pedro Prudencio

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "utils.c"


void* processa_requisicao(void* arg){
    int tserv = *((int*) arg);
    unsigned long time_antes = get_time_msec();
    exp_msleep(tserv); /* simula processamento */
    unsigned long time_depois = get_time_msec();
    unsigned long time_exec = time_depois - time_antes;
    pthread_exit( (void*) time_exec);
}


int main(int argc, char *argv[]) {
    if (argc != 6) {
        fprintf(stderr, "Uso: %s tcheg tserv nreq nserv maxreqs\n", argv[0]);
        return EXIT_FAILURE;
    }

    int tcheg = atoi(argv[1]); // tempo médio entre chegadas de requisições (ms)
    int tserv = atoi(argv[2]); // tempo médio de serviço (ms)
    int nreq = atoi(argv[3]);  // total de requisições
    int nserv = atoi(argv[4]); // total servidores
    int maxreqs = atoi(argv[5]);// máximo de requisições (fila + atendidas) (0 = infinito)

    //implemntar lista encadeada
    // geração da fila (gerador)
    for (int req = 0; req < nreq; req++) {
        //sleep
        //insere_filea(req);
    }


    // fazer várias threads consumidoras
        // get_elemento da lista

    // quando o produtor produzir um processo, ele deve acordar um consumidor
    // quando a fila estiver vazia, botar os consumidores para dormir

    // quando um consumidor for utilizar um indice da lista ele da lock apenas nesse indice

    //cria uma thread para cada servidor
    pthread_t threads[nserv]; // array de threads
    for (int i = 0; i < nserv; i++)
        pthread_create(&threads[i], NULL, processa_requisicao,&tserv); // cria thread


    // Fila de requisições
    for (int req = 0; req < nreq; req++) {
        void *retorno;
        pthread_join(threads[req], &retorno);
        unsigned long time_exec = (unsigned long) retorno;
        printf("tempo de residencia: %lu", time_exec);

    }


    return EXIT_SUCCESS;
}

