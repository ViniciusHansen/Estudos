#include <stdio.h>
#include <stdbool.h>

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
    }
    else {
        return false;
    }
}

int main(void){
    int n1, n2, i;
    scanf("%i", &n1);
    scanf("%i", &n2);

    for (i = n1; i < n2; i++) {
        if (primo(i) == true) {
            printf("%i ", i);
        }
    }



    return 0;
}
