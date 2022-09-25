#include <iostream>
#include <string>
#include<bits/stdc++.h>

using namespace std;

void swap(int* xp, int* yp){
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void bubbleSort(int arr[], int n){
    int i, j;
    for (i = 0; i < n - 1; i++)

        for (j = 0; j < n - i - 1; j++)
            if (arr[j] > arr[j + 1])
                swap(&arr[j], &arr[j + 1]);
}

int main() {
    int n, i=0, j=0, notas[3];
    float prova, soma=0.0;
    int p=0, s=0;
    string nomeAluno;


    cin >> n;
    for(i=0;i<n;i++){
        cin >> nomeAluno;
        j=0;
        while(std::cin >> prova && prova != '\n'){
            p = prova*100;
            if(j==3){
                notas[0] = p;
                break;
            }
            notas[j]=p;
            bubbleSort(notas,j);
            j++;
        }

        if(notas[1] == 0)
            j++;

        for(i=0;i<j;i++)
            soma+=notas[i];

        soma /= j;
        soma /= 100;
        std::cout << nomeAluno <<": "<< fixed << std::setprecision(1) << soma << std::endl;
        std::cin.clear();
    }
    return 0;
}
