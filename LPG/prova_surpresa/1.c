#include <stdio.h>


int main(void){
    int n,count=0;

    scanf("%i", &n);

    int matriz[n][n];
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            matriz[i][j]= i+j;
        }
    }
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            printf("%3d", matriz[i][j]);
            count++;
            if (count == n){
                printf("\n");
                count = 0;
            }
        }
    }
    printf("\n");
    return 0;
}

