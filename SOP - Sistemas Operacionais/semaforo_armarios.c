#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#define NARM 10


int armarios[NARM], ocupados = 0;
sem_t sem_armarios;

void estuda(){
    sleep(1);
    return;
}

void* usuario(void* arg){
    int i = *((int*)arg);
    int a; //numero do armario ocupado pelo user

    sem_wait(&sem_armarios); // trava a seção critica

    ocupados++;
    printf("ocupa\n");
    for (a = 0; (a < NARM) && (armarios[a] != 0); a++)
        ; //percorre o vetor até achar um armario livre
    armarios[a] = i;
    estuda();
    armarios[a] = 0;
    ocupados--;
    printf("desocupa\n");

    sem_post(&sem_armarios); // Libera a seção critica

    return NULL;
}

int main(){
    pthread_t threads[NARM];
    int ids[NARM];

    sem_init(&sem_armarios, 0, NARM); // inicializa semaforo com o numero de armarios

    for (int i =0; i< NARM; i++){
        ids[i] = i + 1;
        pthread_create(&threads[i], NULL, usuario, &ids[i]);
        pthread_join(threads[i],NULL);
    }

//    for (int i = 0; i < NARM; i++){
//        pthread_join(threads[i],NULL);
//    }

    sem_destroy(&sem_armarios);

    return 0;


}
