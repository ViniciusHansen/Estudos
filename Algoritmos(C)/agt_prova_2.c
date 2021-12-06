#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int x0, y0, x1, y1, a, b, c;
    float d;
    char ponto_reta[10];
    printf("Escreva o X do seu ponto:\n");
    scanf("%i", &x0);
    printf("Escreva o Y do seu ponto:\n");
    scanf("%i", &y0);
    printf("Você deseja comparar este ponto com uma reta ou outro ponto?(reta / ponto)\n");
    scanf("%s", &ponto_reta);
    if (strcmp(ponto_reta, "ponto") == 0) {
        printf("Escreva o X do segundo ponto:\n");
        scanf("%i", &x1);
        printf("Escreva o Y do segundo ponto:\n");
        scanf("%i", &y1);
        d = sqrt(pow(x1 - x0, 2) + pow(y1 - y0, 2));
    } else {
        printf("Escreva o A da sua reta:\n");
        scanf("%i", &a);
        printf("Escreva o B da sua reta:\n");
        scanf("%i", &b);
        printf("Escreva o C da sua reta:\n");
        scanf("%i", &c);
        d = abs(a * x0 + b * y0 + c) / sqrt(pow(a,2) + pow(b,2));
    }

    printf("Distância = %.2f\n", d);
    return 0;
}

