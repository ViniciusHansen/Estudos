#include <math.h>
#include <sys/time.h> // Para gettimeofday
#include <unistd.h>   // Para usleep e srandom
#include <time.h>     // Para time
/*
 * Obtem o tempo corrente em msec.
 */
unsigned long get_time_msec(void)
{
     struct timeval tv;
     unsigned long time_msec;

     int rc = gettimeofday(&tv, NULL);
     if (rc != 0) {
	  perror("erro em gettimeofday()");
	  exit(1);
     }
     time_msec = 1000L*tv.tv_sec + tv.tv_usec/1000;
     return time_msec;
}

/*
 * Dorme um numero aleatorio de msec, seguindo uma distribuicao
 * exponencial. O parametro t e' o tempo medio da distribuicao.
 * O valor de retorno e' o tempo de sleep, em msec.
 */
unsigned long exp_msleep(int t)
{
     unsigned long sleep_time;
     float rnd;
     static int init = 0;

     if (!init) {
	  init = 1;
	  srandom(time(NULL));
     }
     rnd = (1.0f * random())/RAND_MAX;
     sleep_time = (unsigned long) round(-t * logf(1.0f - rnd));
     usleep(sleep_time * 1000);
     return sleep_time;
}

