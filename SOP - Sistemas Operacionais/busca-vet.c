#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NELEM 40000000

long v[NELEM];

void *busca_inc(void *arg) {
     long n = (long) arg;
     long i, ret = -1;

     for (i = 0; i < NELEM; i++) {
	  if (v[i] == n) {
	       ret = i;
	       break;
	  }
     }
     pthread_exit((void *)ret);
}

int main(int argc, char *argv[])
{
     pthread_t t1;
     int rc;
     long i, n;
     void *retval;

     if (argc < 2) {
	  fprintf(stderr, "e o n, querido?\n");
	  exit(1);
     }
     n = atoi(argv[1]);
     for (i = 0; i < NELEM; i++)
	  v[i] = i+1;
     //i = busca_inc(n);
     rc = pthread_create(&t1, NULL, busca_inc,(void *) n);
     rc = pthread_join(t1, &retval);
     i = (long) retval;
     if (i >= 0)
	  printf("O numero %ld esta' na posicao %ld do vetor\n", n, i);
     else
	  printf("O numero %ld nao foi encontrado no vetor\n", n);
     return 0;
}

