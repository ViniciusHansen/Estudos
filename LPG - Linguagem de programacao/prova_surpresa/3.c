#include <stdio.h>

int somatorio(int start, int end);


int main(){
    int start=1, end, sum;

    printf("Entre com x: ");
    scanf("%d", &end);

    printf("%i\n", somatorio(start, end));

    return 0;
}



int somatorio(int start, int end){
    if(start > end)
        return 0;
    else
        return (start + somatorio(start +2,end));
}
