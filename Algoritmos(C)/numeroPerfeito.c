#include <stdio.h>

int main(void) {
    int n, divisores[20], soma_array = 0, i = 1, j = 0;
    scanf("%i", &n);

    while (i < n) {
        if (n % i == 0) {
            divisores[j] = i;
            j++;
        }
        i++;
    }
    for (int count = 0; count < j; count++){
        soma_array += divisores[count];
    }

    if (soma_array == n) {
        printf("PERFEITO");
    } else {
        printf("NAO PERFEITO");
    }

    return 0;
}
