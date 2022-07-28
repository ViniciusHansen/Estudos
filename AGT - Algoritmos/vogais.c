#include <stdio.h>
#define S 30

int main(void){
    char s[S];
    int soma_vogal = 0, c = 0;

    scanf("%[^\n]", s);

    while (s[c] != '\0') {
        if (s[c] == 'a' || s[c] == 'A' || s[c] == 'e' || s[c] == 'E' || s[c] == 'i' || s[c] == 'I' || s[c] =='o' || s[c]=='O' || s[c] == 'u' || s[c] == 'U') {
            soma_vogal++;
        }
    c++;
    }

    printf("%i", soma_vogal);

    return 0;
}
