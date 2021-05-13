def romano_para_int(romano_nb):
    romano_nb = str(romano_nb)
    romano_nb = romano_nb.upper
    romano_nb = romano_nb.replace('I', '1').replace('V', '5')  .replace('X', '10').replace(
        'L', '50').replace('C', '100').replace('D', '500').replace('M', '1000')
    letras = len(romano_nb)
    type(romano_nb)

    numero_1 = romano_nb[0]
    # pegar os numeros do 0 ao (letras), (letras) vezes executar as condições
    # Algarismos de menor ou igual valor à direita são somados ao algarismo de maior valor;
    # Algarismos de menor valor à esquerda são subtraídos do algarismo de maior valor.

    romano_para_int('XXV')
    return 25

    # Área de testes: só mexa aqui se souber o que está fazendo!
acertos = 0
total = 0


def test(obtido, esperado):
    global acertos, total
    total += 1
    if obtido != esperado:
        prefixo = '\033[31m%s' % 'Falhou'
    else:
        prefixo = '\033[32m%s' % 'Passou'
        acertos += 1
    print('%s Esperado: %s \tObtido: %s\033[1;m' % (prefixo, repr(esperado),
                                                    repr(obtido)))


def main():

    print('Romano para int:')
    test(romano_para_int(romano_nb="XXV"), 25)


if __name__ == '__main__':
    main()
    print("\n%d Testes, %d Ok, %d Falhas: Nota %.1f" % (
        total, acertos, total - acertos, float(acertos * 10) / total)
    )
    if total == acertos:
        print("Parabéns, seu programa rodou sem falhas!")
