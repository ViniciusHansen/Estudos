#include <stdio.h>
#include <string.h>

void main() {
    char tipo_comida[20], refri, nome[20], endereco[50], forma_pgto[20], telefone[20], fritas;
    int restaurante, sabor, valor_refri, qtd_burger, valor_fritas;
    float frete, valor_sabor, valor_burger, conta;

    valor_burger = 19.90;
    frete = 7.50;
    valor_sabor = 39.90;
    valor_refri = 8;
    valor_fritas = 8;

    printf("Digite o tipo de comida: \n");
    scanf("%s", &tipo_comida);

    if (strcmp(tipo_comida, "pizza") == 0) {
        printf("Escolha um restaurante: \n");
        printf("1. Di Roma \n");
        printf("2. Baggio \n");
        printf("3. Pizzaria do Fritz \n");
        printf("4. Oficina das Pizzas \n");
        scanf("%i", &restaurante);
        printf("Escolha o sabor: \n");
        printf("1. 4 Queijos \n");
        printf("2. Frango \n");
        printf("3. Calabresa \n");
        printf("4. Americana \n");
        scanf("%i", &sabor);
        printf("Quer refrigerante? (s/n) \n");
        scanf(" %c", &refri);
        if (refri == 'n') {valor_refri = 0;}
        printf("Nome: \n");
        scanf("%s", &nome);
        printf("Endereço: \n");
        scanf("%s", &endereco);
        printf("Telefone: \n");
        scanf("%s", &telefone);
        printf("Forma de Pagamento: \n");
        scanf("%s", &forma_pgto);
        conta = valor_sabor + valor_refri + frete;
    } else if (strcmp(tipo_comida, "hamburguer") == 0) {
        printf("Quantas Unidades?");
        scanf("%i", &qtd_burger);
        printf("Quer Fritas? (s/n)");
        scanf(" %c", &fritas);
        if (fritas == 'n') {valor_fritas = 0;}
        conta = valor_burger * qtd_burger + valor_fritas + frete;
    }

    printf("Sua conta é %f, volte sempre! \n", conta);
}
