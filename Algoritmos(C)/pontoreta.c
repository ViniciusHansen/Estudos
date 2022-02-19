#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int x0=0, y0=0, x1=0, y1=0, a=0, b=0, c=0;
    float d;
    char tipo1[20], tipo2[20];

    scanf("%s", tipo1);
    scanf("%i", &x0);
    scanf("%i", &y0);
    scanf("%s", tipo2);

    if (strcmp(tipo2, "P") == 0) {
        scanf("%i", &x1);
        scanf("%i", &y1);
        d = sqrt(pow(x1 - x0, 2) + pow(y1 - y0, 2));
    } else {
        scanf("%i", &a);
        scanf("%i", &b);
        scanf("%i", &c);
        d = abs((a * x0) + (b * y0) + c) / sqrt(pow(a,2) + pow(b,2));
    }

    printf("%.2f\n", d);

    return 0;
}

