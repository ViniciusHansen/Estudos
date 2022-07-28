#include <iostream>
#include <cstring>
#include <string>

using namespace std;

int main() {
    int n, leds, tamanho;
    char numero[105];
    cin >> n;

    for (int i = 0;i < n; i++) {
	cin >> numero;
	tamanho = strlen(numero);
	leds = 0;
	for (int j = 0; j < tamanho; j++) {
	    if (numero[j] == '1') leds += 2;
	    if (numero[j] == '2' || numero[j] == '3' || numero[j] == '5') leds += 5;
	    if (numero[j] == '4') leds += 4;
	    if (numero[j] == '6' || numero[j] == '9' || numero[j] == '0') leds += 6;
	    if (numero[j] == '7') leds += 3;
	    if (numero[j] == '8') leds += 7;
	}
    cout << leds << " leds" << endl;
    }
    return 0;
}
