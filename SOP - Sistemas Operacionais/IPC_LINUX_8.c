#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include <semaphore.h>
#define MAX 2000

int n = 1;
sem_t XtoZ, ZtoY;

//XZY

void X(void *arg) {
	n = n * 16;
	sem_post(&XtoZ);
}


void Y(void *arg) {
	sem_wait(&ZtoY);
	n = n / 7;
}


void Z(void *arg) {
	sem_wait(&XtoZ);
	n = n + 40;
	sem_post(&ZtoY);	
}

int main(void) {
	pthread_t t1, t2, t3;
	sem_init(&XtoZ, 0, 0);
	sem_init(&ZtoY, 0, 0);
	int rc;
	n = 1;
	rc = pthread_create(&t1, NULL, (void *)X, NULL);
	rc = pthread_create(&t3, NULL, (void *)Z, NULL);
	rc = pthread_create(&t2, NULL, (void *)Y, NULL);
	rc = pthread_join(t1, NULL);
	rc = pthread_join(t3, NULL);
	rc = pthread_join(t2, NULL);
	printf("n=%d\n", n);
	sem_destroy(&XtoZ);
	sem_destroy(&ZtoY);
	return 0;
}
