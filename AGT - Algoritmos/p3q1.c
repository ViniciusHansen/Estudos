#include <stdio.h>
#define L 3
#define C 12

int main(void) {
    float soma=0,soma2=0,soma3=0, clima[L][C] = {
        {29.3, 29.1, 28.2, 26, 23.8, 22.1, 21.3, 21.7, 22.6, 24.2, 26.3, 27.7},
        {21, 21.1, 20.1, 17.6, 15.3, 14, 12.9, 13.6, 15.1, 17, 18.5, 19.5},
        {258, 234, 216, 122.1, 111.3, 98.6, 107.7, 98, 137, 173.4, 159, 208.1}
        };

    for (int i=0; i<12;i++){
        soma += clima[0][i];
        soma2 += clima[1][i];
        soma3 += clima[2][i];
    }
    printf("T. Maxima = %.1f\n", soma/12);
    printf("T. Minima = %.1f\n", soma2/12);
    printf("Precipitação = %.1f\n", soma3/12);



    return 0;
}
