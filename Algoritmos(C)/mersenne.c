#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool primo(int nb) {
    int mult = 0, j;
    if (nb == 0 || nb == 1) {
        return false;
    }
    for (j = 2; j < nb; j++){
        if (nb % j == 0) {
            mult++;
        }
    }
    if (mult == 0) {
        return true;
    } else {
        return false;
    }
}


int main(void) {
    int p=0, casos, d, i=0;
    scanf("%i", &casos);


    while (i < casos){
        if (primo((pow(2, p)) - 1) == true){
            d = pow(2, (p - 1)) * ((pow(2, p)) - 1);
            printf("%i\n", d);
            i++;
        }
        p++;
    }

    return 0;
}
