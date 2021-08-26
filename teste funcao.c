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

int main()
{
    printf("%d \n", fatorial(4));
    printf("%d \n", fatorial(6));
    printf("%d \n", fatorial(8));
    printf("%d \n", fatorial(10));
}
