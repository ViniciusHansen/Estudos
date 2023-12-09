// Autores: Vinicius Hansen & João Pedro Prudêncio

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "utils.c"

typedef struct Node {
    unsigned long time_chegada;
    struct Node* next;
} Node;

Node* head = NULL;
pthread_mutex_t mutex;
pthread_cond_t cond;

unsigned long total_residencia = 0;
unsigned long total_espera = 0;
int total_requisicoes = 0;
int requisicoes_rejeitadas = 0;
int maxreqs;
int nreq;

void insere_fila(unsigned long time_chegada) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->time_chegada = time_chegada;
    newNode->next = NULL;
    if (head == NULL) {
        head = newNode;
    } else {
        Node* temp = head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = newNode;
    }
    pthread_cond_signal(&cond);
}

unsigned long get_elemento() {
    if (head == NULL) return 0;
    Node* temp = head;
    unsigned long time_chegada = temp->time_chegada;
    head = head->next;
    free(temp);
    return time_chegada;
}

void* consumidor(void* arg) {
    int tserv = *((int*) arg);
    while (1) {
        pthread_mutex_lock(&mutex);
        while (head == NULL) {
            pthread_cond_wait(&cond, &mutex);
        }
        unsigned long time_chegada = get_elemento();
        pthread_mutex_unlock(&mutex);

        if (time_chegada == 0) break; // Condição de saída

        unsigned long time_antes = get_time_msec();
        exp_msleep(tserv); // simula processamento
        unsigned long time_depois = get_time_msec();
        unsigned long time_exec = time_depois - time_antes;
        unsigned long time_espera = time_antes - time_chegada;

        pthread_mutex_lock(&mutex);
        total_residencia += time_exec;
        total_espera += time_espera;
        total_requisicoes++;
        pthread_mutex_unlock(&mutex);
    }
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
   if (argc != 6) {
        fprintf(stderr, "Uso: %s tcheg tserv nreq nserv maxreqs\n", argv[0]);
        return EXIT_FAILURE;
    }

    int tcheg = atoi(argv[1]);
    int tserv = atoi(argv[2]);
    nreq = atoi(argv[3]);
    int nserv = atoi(argv[4]);
    maxreqs = atoi(argv[5]);

    pthread_t threads[nserv];
    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&cond, NULL);

    for (int i = 0; i < nserv; i++) {
        pthread_create(&threads[i], NULL, consumidor, &tserv);
    }

    // Geração da fila (gerador)
    for (int req = 0; req < nreq; req++) {
        exp_msleep(tcheg); // simula chegada de requisições
        unsigned long time_chegada = get_time_msec();

        pthread_mutex_lock(&mutex);
        if (maxreqs == 0 || total_requisicoes + requisicoes_rejeitadas < maxreqs) {
            insere_fila(time_chegada);
        } else {
            requisicoes_rejeitadas++;
        }
        pthread_mutex_unlock(&mutex);
    }

    // Inserindo condição de saída para as threads
    for (int i = 0; i < nserv; i++) {
        pthread_mutex_lock(&mutex);
        insere_fila(0);
        pthread_mutex_unlock(&mutex);
    }

    for (int i = 0; i < nserv; i++) {
        pthread_join(threads[i], NULL);
    }

    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond);

    double tempo_medio_residencia = (double)total_residencia / total_requisicoes;
    double tempo_medio_espera = (double)total_espera / total_requisicoes;
    double vazao = (double)total_requisicoes / ((double)total_residencia / 1000);
    double indice_rejeicao = ((double)requisicoes_rejeitadas / nreq) * 100;

    printf("tempo medio de residencia=%.3f ms\n", tempo_medio_residencia);
    printf("tempo medio de espera=%.3f ms\n", tempo_medio_espera);
    printf("vazao=%.2f req/s\n", vazao);
    printf("indice de rejeicao=%.2f%%\n", indice_rejeicao);

    return EXIT_SUCCESS;
}
