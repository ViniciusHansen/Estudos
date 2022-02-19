#include <stdio.h>
#define D 6

int main(){
    int rota[D]={2,3,1,4,5,0}, total = 0, indice=0 ;
    int dist[D][D]={
    {0,63,210,190,0,190},
    {63,0,160,150,95,0},
    {210,160,0,10,0,0},
    {190,150,10,0,0,0},
    {0,95,0,0,0,80},
    {190,0,0,0,80,0}};

    printf("\nMenu das Cidades:\n");
    printf(" 0.Caceres\n 1.BBugres\n 2.Cuiaba\n 3.VGrande\n 4.Tangara\n 5.PLacerda\n");
    for( indice=0; indice < D-1; indice++){
        printf("\nDistancias: %i km", dist[rota[indice]][rota[indice+1]]);
        total = total + dist[rota[indice]][rota[indice+1]];
    }
    printf("\nDistancia final percorrida: %i", total);

    return 0;
}
