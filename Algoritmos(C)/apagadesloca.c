#include <stdio.h>

int main (void){
    int v[10], i=0, n, v2[9];
    for (int j =0; j < 10; j++){
        scanf("%i", &v[j]);
    }
    scanf("%i", &n);


    while (i < 10) {
        if (i >= n){
            v2[i] = v[i + 1];
            i++;
        }
        else {
            v2[i] = v[i];
            i++;
        }
    }


    for (i = 0; i < 9; i++){
        printf("%i \n", v2[i]);
    }






    return 0;
}

