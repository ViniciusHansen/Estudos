#include <stdio.h>
#include <assert.h>

int main (void){
    char naipe1, naipe2, naipe3;
    int carta1, carta2, carta3;
    scanf(" %c%i", &naipe1, &carta1);
    scanf(" %c%i", &naipe2, &carta2);
    scanf(" %c%i", &naipe3, &carta3);
    assert (naipe1 == 'E' || naipe1 == 'O' || naipe1 == 'P' || naipe1 == 'C');
    assert (naipe2 == 'E' || naipe2 == 'O' || naipe2 == 'P' || naipe2 == 'C');
    assert (naipe3 == 'E' || naipe3 == 'O' || naipe3 == 'P' || naipe3 == 'C');
    assert (carta1 > 0 && carta1 <= 13);
    assert (carta2 > 0 && carta2 <= 13);
    assert (carta3 > 0 && carta3 <= 13);

    if (carta3 == carta2 + 1 && carta2 == carta1 + 1 && naipe1 == naipe2 && naipe2 == naipe3){
        printf("SEQUENCIA");
    }else {
        printf("NADA");
    }

    return 0;
}
