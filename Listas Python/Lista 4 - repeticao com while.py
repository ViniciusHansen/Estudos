#!/usr/bin/env python3
# Lista de exercícios - Estruturas de repetição while

# ATENÇÃO !!!
# Todos os exercícios devem ser resolvidos com "while".
# Não utilize "for", métodos das estruturas de dados ou funções embutidas.


def quantidade_de_impares(valor_inicial, valor_final):
    """Determine a quantidade de números ímpares num intervalo.

    Argumentos:
        valor_inicial (int): o limite inferior do intervalo;
        valor_final (int): o limite superior do intervalo;

    Retorna:
        int: a quantidade de números ímpares no intervalo.
    """
    impares = 0
    while valor_inicial + 1 < valor_final:
        valor_inicial += 1
        if valor_inicial % 2 == 0:
            continue
        else:
            impares += 1
            pass
    return impares


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
    soma = 0
    while valor1 < valor2 - 1:
        valor1 += 1
        soma += valor1
    while valor2 < valor1 - 1:
        valor2 += 1
        soma += valor2
    return soma


def potencia(base, expoente):
    """Calcule a base elevada ao expoente manualmente sem usar
    'base ** expoente'.

    Argumentos:
        base (int): o valor base;
        expoente (int): o expoente;

    Retorna:
        int: o resultado de base elevado ao expoente.
    """
    potencia = 1
    while expoente > 0:
        potencia = potencia * base
        expoente -= 1
    return potencia


def crescimento_populacional(populacao1, populacao2, crescimento1, crescimento2):
    """Calcule quantos anos levará para a 'população1'
    ultrapassar a 'população2', baseado em suas porcentagens de crescimento.

    Argumentos:
        populacao1 (int): a população da 1a cidade;
        populacao2 (int): a população da 2a cidade;
        crescimento1 (float): o percentual de crescimento anual da população da 1a cidade;
        crescimento2 (float): o percentual de crescimento anual da população da 2a cidade;

    Retorna:
        int: a quantidade de anos que levará para a população da cidade 1 utrapassar a população da cidade 2.
    """
    anos = 0
    if populacao1 < populacao2 and crescimento1 < crescimento2:
        return 0
    while populacao1 < populacao2:
        anos += 1
        populacao1 += populacao1 * (crescimento1 / 100)
        populacao2 += populacao2 * (crescimento2 / 100)
    return anos


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
    contador = 1
    while contador < n:
        elemento_3 = elemento_1 + elemento_2
        fibo.append(elemento_3)
        elemento_1 = elemento_2
        elemento_2 = elemento_3
        contador += 1
    return fibo


def fatorial(numero):
    """Calcule e retorne o fatorial do 'numero' informado,
    O fatorial é o valor produtório dos valores menores ou iguais ao número
    ex: fatorial de 4 é 4*3*2*1 e retorna 24.

    Argumento:
        numero (int): o número do qual se quer calcular o fatorial.

    Retorna:
        int: o fatorial de numero.
    """
    if numero < 1:
        return 1
    fator = numero
    while numero > 1:
        fator = fator * (numero - 1)
        numero = numero - 1
    return fator


def é_primo(valor):
    """Verifique se o valor informado é primo.
    Um número primo é aquele que é divisível apenas por ele mesmo e por 1.

    Argumento:
        valor (int): um número inteiro.

    Retorna:
        bool: True ou False, se o valor e ou não primo.
    """
    if valor == 0 or valor == 1:
        return False
    multiplos = 0
    numero = 2
    while numero < valor - 1:
        if valor % numero == 0:
            multiplos += 1
        numero += 1
    return multiplos == 0


def quantidade_de_primos(inicio, fim):
    """Retorne a quantidade de primos entre os valores informados, incluindo
    os limites.

    Argumentos:
        inicio (int): limite inferior;
        fim (int): limite superior;

    Retorna:
        int: a quantidade de números primos dentro do intervalo especificado.
    """
    contador_primo = 0
    while inicio < fim + 1:
        if é_primo(inicio) == True:
            contador_primo += 1
        inicio += 1
    return contador_primo


def lista_de_primos(inicio, fim):
    """Retorne uma lista de primos entre os valores informados, incluindo
    os limites.

    Argumentos:
        inicio (int): limite inferior;
        fim (int): limite superior;

    Retorna:
        lista de inteiros, os primos dentro do intervalo especificado.
    """
    primos = []
    while inicio < fim + 1:
        if é_primo(inicio) == True:
            primos.append(inicio)
        inicio += 1
    return primos


def serie1(n):
    """Dado n, calcule o valor de
    s = 1 + 1/2 + 1/3 + 1/4 + ... + 1/n

    Argumento:
        n (int): o valor final da série;

    Retorna:
        float: a soma dos valores da série, segundo a fórmula e o valor de n informados.

    """
    soma = 0
    contador = 1
    while contador < n + 1:
        soma += 1/contador
        contador += 1
    return round(soma, 2)


def serie2(n):
    """Dado n, calcule o valor de
    s = 1/1 + 2/3 + 3/5 + 4/7 + 5/9 + ... + n/m

    Argumento:
        n (int): o valor final da série;

    Retorna:
        float: a soma dos valores da série, segundo a fórmula e o valor de n informados.
    """
    N = 1
    M = 1
    contador = 0
    soma = 0
    while contador < n:
        soma += N / M
        N += 1
        M += 2
        contador += 1
    return round(soma, 2)


def serie_pi(n):
    """Calcule o valor de pi através da série
    4/1 - 4/3 + 4/5 - 4/7 + ... - 4/m, sendo informado
    o número n de iterações.

    Argumento:
        n (int): o valor final da série;

    Retorna:
        float: o valor de pi calculado.
    """
    pi = 0
    contador = 0
    m = 1
    sinal = 1
    while contador < n:
        pi += 4 / (m * sinal)
        contador += 1
        m += 2
        sinal *= -1
    return round(pi, 6)

