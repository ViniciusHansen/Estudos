#include <stdio.h>

int fatorial(int numero)
{
    int fator;

    if (numero < 1)
    {
        return 1;
    }

    fator = numero;

    while (numero > 1)
    {
        fator = fator * (numero - 1);
        numero = numero - 1;
    }
    return fator;
}

void fibonacci(n)
{
    int x, y, z;
    x = 0;
    y = 1;

    for (int count = 0; count < n; count++)
    {
        z = x + y;
        printf("%i \n", x);
        x = y;
        y = z;
    }
}

void main(void)
{
    printf("\n FATORIAL \n");
    printf("%d \n", fatorial(4));
    printf("%d \n", fatorial(6));
    printf("%d \n", fatorial(8));
    printf("%d \n", fatorial(10));

    printf("\n FIBONACCI \n");
    int n = 21;
    fibonacci(n);
}
