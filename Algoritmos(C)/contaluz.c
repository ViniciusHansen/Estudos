#include <stdio.h>
#include <string.h>

int main (void){
    int kwh;
    char bandeira[20];

    scanf("%i", &kwh);
    scanf(" %99[^\n]", bandeira);

    if (strcmp(bandeira, "VERDE") == 0){
        printf("%.2f\n",(kwh * .45));
        printf("VERDE\n");
    }
    if (strcmp(bandeira, "AMARELA") == 0){
        printf("%.2f\n",(kwh *.45 + 4.5));
        printf("AMARELA\n");
    }
    if (strcmp(bandeira, "VERMELHA 1") == 0){
        printf("%.2f\n",(kwh *.45 + 9));
        printf("VERMELHA 1\n");
    }
    if (strcmp(bandeira, "VERMELHA 2") == 0){
        printf("%.2f\n",(kwh *.45 + 13.5));
        printf("VERMELHA 2\n");
    }




    return 0;
}
