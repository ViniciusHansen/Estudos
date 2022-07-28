#include <stdio.h>
#include <string.h>

int main(void){
	char frase[30], *ptr;
	scanf("%[^\n]", frase);

	ptr = frase;
	while (*ptr){	//enquanto o ponteiro tiver valores
		printf("%c\n", *ptr++);
		
	
	}


	
	return 0;
}
