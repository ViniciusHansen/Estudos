#include <stdio.h>

char* estacao(int dia,int mes){
    //primavera 23/09 até 20/12
    //verao 21/12 20/03
    //outono 21/03 até 20/06
    //inverno 21/06 até 22/09
    if (mes==10 || mes == 11 || (dia >= 23 && mes==9) || (dia<=20 && mes==12)){printf("primavera\n");}
    if (mes==1 || mes == 2 || (dia>=21 && mes==12) || (dia <=20 && mes==3)){printf("verao\n");}
    if (mes==4 || mes == 5 || (dia >=21 && mes==3) || (dia<=20 && mes==6)){printf("outono\n");}
    if (mes==7 || mes == 8 || (dia>=21 && mes==6) || (dia<=22 && mes==9)){printf("inverno\n");}

}


int main(void){
    int dia, mes;
    scanf("%i %i", &dia, &mes);
    estacao(dia,mes);

    return 0;
}
