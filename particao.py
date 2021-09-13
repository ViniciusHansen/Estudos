"""
Partição

Dado um vetor de inteiros, faça um algorítmo que retorne a primeira posição do vetor na qual a soma de todos os elementos a sua esquerda seja igual a soma de todos os elementos a sua direita.

Assuma que o vetor sempre terá uma posição que satisfaça ao solicitado.

Exemplo 1:
Input: [22, 5, 18, 7, 1, 10, 2, 7, 3, 6, 4, 20]
Output: 4
Explicação: Como 22 + 5 + 18 + 7 = 52 e 10 + 2 + 7 + 3 + 6 + 4 + 20 = 52
Então 4 é o indice procurado.

Exemplo 2:
Input: [15, 5, 7, 8, 10, 2, 9, 1, 4, 4, 2, 7, 13, 2, 3]
Output: 5
Explicação: Como 15 + 5 + 7 + 8 + 10 = 45 e 9 + 1 + 4 + 4 + 2 + 7 + 13 + 2 + 3 = 45
Então 5 é o indice procurado.
"""


def particao(lista):
    for index, element in enumerate(lista):
        # soma dos elementos a esquerda
        count = index
        sum_left = 0
        while count > 0:
            sum_left += lista[count - 1]
            count -= 1

        # soma dos elementos a direta
        count = index
        sum_right = 0
        while count < len(lista) - 1:
            sum_right += lista[count + 1]
            count += 1

        if sum_left == sum_right:
            break

    return(index)


input = [22, 5, 18, 7, 1, 10, 2, 7, 3, 6, 4, 20]
input2 = [15, 5, 7, 8, 10, 2, 9, 1, 4, 4, 2, 7, 13, 2, 3]


def main():
    print(particao(input))


if __name__ == "__main__":
    main()
