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

int fibonacci(n)
{
    int x, y, z, count;
    x = 0;
    y = 1;
    z = x + y;
    count = 1;
    do
    {
        printf("%i \n", x);
        z = x + y;
        x = y;
        y = z;
        ++count;
        // printf("\n");
    } while (count < n + 1);
}

int main()
{
    printf("\nFATORIAL \n");
    printf("%d \n", fatorial(4));
    printf("%d \n", fatorial(6));
    printf("%d \n", fatorial(8));
    printf("%d \n", fatorial(10));

    printf("\nFIBONACCI n = 1\n");
    printf("%d \n", fibonacci(1));
    printf("\nFIBONACCI n = 3\n");
    printf("%d \n", fibonacci(3));
    printf("\nFIBONACCI n = 5\n");
    printf("%d \n", fibonacci(5));
}
