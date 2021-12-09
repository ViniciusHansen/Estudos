# Lista de exercícios - Estruturas de repetição for

# ATENÇÃO !!!
# Todos os exercícios devem ser resolvidos com "for".
# Utilizar "for item in lista" sempre que possível.
# Utilizar "for i, item in enumerate(item) sempre que possível.


def soma_das_temperaturas(lista):
    """Retorna a soma dos elementos de uma lista.

    Argumentos:
        lista (lista de floats): Uma lista de valores float.

    Retorna:
        float: a soma dos elementos da lista.
    """
    soma_notas = 0
    for valor_cedula in lista:
        soma_notas += valor_cedula
    return soma_notas


def quantidade_de_impares(valor_inicial, valor_final):
    """Determine a quantidade de números ímpares num intervalo, excluindo os valores limite do intervalo.

    Argumentos:
        valor_inicial (int): o limite inferior do intervalo, excluindo-o;
        valor_final (int): o limite superior do intervalo, excluindo-o;

    Retorna:
        int: a quantidade de números dentro do intervalo dado.
    """
    impar = []
    for number in range(valor_inicial, valor_final):
        if number % 2 != 0 and number != 1:
            impar.append(number)
    return len(impar)


def soma_dos_inteiros(valor1, valor2):
    """Calcule a soma dos números inteiros no intervalo dado.
    Considere que os limites do intervalo podem ser informados
    como números negativos ou fora de ordem.
    Ex: 1 e 5 ou 5 e 1, retorna 9

    Argumentos:
        valor1 (int): um dos limite do intervalo, excluindo-o;
        valor2 (int): o outro limite do intervalo, excluindo-o;

    Retorna:
        float: a soma dos valores dentro do intervalo dado.
    """
    somar = []
    for numero in range(valor1, valor2):
        if numero != valor1 and numero != valor2:
            somar.append(numero)
    for numero in range(valor2, valor1):
        if numero != valor1 and numero != valor2:
            somar.append(numero)
    return sum(somar)


def serie(n):
    """Dado n, calcule o valor de
    s = 1 + 1/2 + 1/3 + 1/4 + ... + 1/n

    Argumento:
        n (int): o valor final da série;

    Retorna:
        float: a soma dos valores da série, segundo a fórmula e o valor de n informados.
    """
    divisores = []
    s = []
    for divisor in range(1, n+1):
        divisores.append(divisor)
    for numero in divisores:
        s.append(numero ** (-1))
    return round(sum(s), 2)


def ordenamento_contrario(lista):
    """Inverta a ordem dos elementos da lista.

    Argumento:
        lista (list): uma lista de elementos, independente de tipo.

    Retorna:
        list: uma lista com os elementos em ordem inversa.
    """
    reversa = []
    for item in reversed(lista):
        reversa.append(item)
    return reversa


def intercalamento_listas(lista1, lista2):
    """Usando 'lista1' e 'lista2', ambas do mesmo comprimento,
        crie uma nova lista composta pelo intercalamento entre as duas.
        Intercalar significa que a nova lista terá o 1o elemento da 1a lista,
        seguido do 1o elemento da 2a lista, seguido do 2o elemento da 1o lista,
        seguido do 2o elemento da 2a lista e assim por diante.

    Argumentos:
        lista1 (list): uma lista de elementos, independente de tipo;
        lista2 (list): uma lista de elementos, independente de tipo;

    Retorna:
        list: uma lista com os elementos intercalados das duas listas recebidas.
    """
    intercalado = []
    for item1, item2 in zip(lista1, lista2):
        intercalado.append(item1)
        intercalado.append(item2)
    return intercalado


def im_pares(lista):
    """Separe em listas os pares e impares, dos inteiros da lista recebida.

    Argumento:
        lista (lista de inteiros): uma lista de elementos int;

    Retorna:
        uma tupla com duas listas de inteiros sendo a primeira uma lista com os pares
        e a segunda uma ista com os ímpares.
    """
    par = []
    impar = []
    for number in lista:
        if number % 2 == 0:
            par.append(number)
        else:
            impar.append(number)
    return (par, impar)


def maior_menor(lista):
    """Calcule o maior e o menor número da lista recebida.

    Argumento:
        lista (list): uma lista de elementos float;

    Retorna:
        uma tupla com dois números inteiros, o maior e o menor da lista.
    """
    menor = lista[0]
    maior = lista[0]
    for valor in lista:
        if valor > maior:
            maior = valor
    for valor in lista:
        if valor < menor:
            menor = valor
    return (maior, menor)


def dar_troco(valor_a_pagar, valor_em_dinheiro):
    """Calcule o troco a devolver ao cliente com notas de 1,2,5,10,20,50.
        A resposta deve conter a quantidade de cada valor_cedula, sem considerar centavos.

    Argumentos:
        valor_a_pagar (float): o valor da conta
        valor_em_dinheiro (float): o valor que foi dado para pagar a conta.

    Retorna:
        uma lista de uma tuplas, onde cada dupla contém dois valores:
        o valor da valor_cedula e a quantidade daquela valor_cedula.
        Se a quantidade de notas for igual a zero, não deve aparecer na lista.
    """
    final = []
    cedulas = [50, 20, 10, 5, 2, 1]
    troco = valor_em_dinheiro - valor_a_pagar

    if valor_a_pagar == valor_em_dinheiro:
        return []
    for valor_cedula in cedulas:
        qtde_cedulas = troco // valor_cedula
        if qtde_cedulas > 0:
            final.append((valor_cedula, qtde_cedulas))
            troco -= valor_cedula * qtde_cedulas
        if troco % valor_cedula == 0:
            break
    return final


def media_anual(temperaturas):
    """Receba uma lista com as temperaturas médias de cada mês
    e devolva uma lista com os números correspondentes aos meses
    que possuem temperatura superior á média anual.

    Argumentos:
        temperaturas (lista de floats): as temperaturas médias de cada mês no ano, em ordem.

    Retorna:
        lista de inteiros: uma lista com o número correspondente ao mês em que a
        temperatura média foi maior que a temperatura média anual.
    """
    media_temp = sum(temperaturas) / len(temperaturas)
    meses_acima = []
    for m, mes in enumerate(temperaturas):
        if mes > media_temp:
            meses_acima.append(m)
    return meses_acima


def maiores_13(idades, alturas):
    """Receba as idades e alturas de diversas pessoas, em duas
        listas separadas e de igual comprimento.
        Calcule a media das alturas e retorne as alturas daqueles que
        possuem 'idades' maior que 13 e altura inferior a media da turma.

    Argumentos:
        idades (lista de inteiros): Uma lista de idades;
        alturas (lista de floats): uma lista de alturas;

    Retorna:
        uma lista de alturas dos alunos, conforme o criério definido.
    """
    media_turma = sum(alturas) / len(alturas)
    alturas_final = []
    counter = 0
    for idade, altura in zip(idades, alturas):
        if idades[counter] > 13 and alturas[counter] < media_turma:
            alturas_final.append(alturas[counter])
        counter += 1
    return alturas_final


def testa_primo(valor):
    """Verifique se o valor informado é primo.
    Um número primo é aquele que é divisível apenas por ele mesmo e por 1.

    Argumento:
        valor (int): um número inteiro.

    Retorna:
        bool: True ou False, se o valor e ou não primo.
    """
    multiplos = 0
    if valor == 0 or valor == 1:
        return False
    for numero in range(2, valor):
        if valor % numero == 0:
            multiplos += 1
    return multiplos == 0


def lista_de_primos(inicio, fim):
    """Retorne uma lista de primos entre os valores informados, incluindo
    os limites.

    Argumentos:
        inicio (int): limite inferior;
        fim (int): limite superior;

    Retorna:
        lista de inteiros, os primos dentro do intervalo especificado.
    """
    lista_primos = []
    for numero in range(inicio, fim):
        if testa_primo(numero) == True:
            lista_primos.append(numero)
    return lista_primos


def Fibonacci(n):
    """Retorne uma lista com os n primeiros valores da série de Fibonacci.
    Fibonacci = 1,1,2,3,5,8,13,...

    Argumento:
        n (int): a quantidade de elementos que serão gerados.

    Retorna:
        uma lista de elementos inteiros correspondendo aos n primeiros elementos da série
        de Fibonacci.
    """
    elemento_1 = 0
    elemento_2 = 1
    fibo = [1]
    for elemento in range(n-1):
        elemento_3 = elemento_1 + elemento_2
        fibo.append(elemento_3)
        elemento_1 = elemento_2
        elemento_2 = elemento_3
    return fibo


def altera_salarios(salarios):
    """Calcule o aumento de salário de acordo com a seguinte tabela:
    - até 1 SM(inclusive): aumento de 20%
    - de 1 até 2 SM(inclusive): aumento de 15%
    - de 2 até 5 SM(inclusive): aumento de 10%
    - acima de 5 SM: aumento de 5%
    Salário mínimo para referência: R$ 724,00

    Argumento:
        salarios (lista de floats): os salários originais.

    Retorna:
        uma lista de elementos float, correspondendo aos salários corrigidos.
    """
    new_salary = []
    salario_min = 724
    for salario in salarios:
        if salario > 5 * salario_min:
            new_wage = round(salario * 1.05, 2)
            new_salary.append(new_wage)
        if salario > 2 * salario_min and salario <= 5 * salario_min:
            new_wage = round(salario * 1.10, 2)
            new_salary.append(new_wage)
        if salario > 1 * salario_min and salario <= 2 * salario_min:
            new_wage = round(salario * 1.15, 2)
            new_salary.append(new_wage)
        if salario <= salario_min:
            new_wage = round(salario * 1.20, 2)
            new_salary.append(new_wage)
    return new_salary



