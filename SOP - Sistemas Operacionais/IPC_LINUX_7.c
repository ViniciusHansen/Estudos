#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include <semaphore.h>
#define MAX 2000

int n;
sem_t sem;

void f1(void *argp) {
	int i, temp;
	for (i = 0; i < MAX; i++) {
		sem_wait(&sem);
		temp = n;
		temp++;
		n = temp;
		sem_post(&sem);
	}
}

void f2(void *argp) {
	int i, temp;
	for (i = 0; i < MAX; i++) {
		sem_wait(&sem);
		temp = n;
		temp--;
		n = temp;
		sem_post(&sem);
	}
}

int main(void) {
	pthread_t t1, t2;
	sem_init(&sem, 0, 1);
	int rc;
	n = 0;
	rc = pthread_create(&t1, NULL, (void *)f1, NULL);
	rc = pthread_create(&t2, NULL, (void *)f2, NULL);
	rc = pthread_join(t1, NULL);
	rc = pthread_join(t2, NULL);
	printf("n=%d\n", n);
	sem_destroy(&sem);
	return 0;
}
