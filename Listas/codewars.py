def divisors(n):
    """
    Recebe um numero e retorna o número de divisores
    Argumentos:
        b (int): valor;
    Retorna:
        int: quantidade de divisores.
    """
    divisors_nbs = 0
    count = 1
    while count < n + 1:
        if n / count == int(n / count):
            divisors_nbs += 1
        count += 1
    return divisors_nbs
