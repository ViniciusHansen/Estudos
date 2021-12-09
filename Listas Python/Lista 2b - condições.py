def media_ponderada(prova, trabalho, exercicio):
    """Calcule a média ponderada, sabendo que os pesos são os seguintes:
    - prova: peso 7
    - trabalho: peso 2
    - exercício : peso 1
    """
    if prova and trabalho and exercicio <= 0:
        return 0
    else:
        media_pond = ((7 * prova) + (2 * trabalho) + exercicio) / 10
        return round(media_pond, 1)


def aluguel_airbnb(valor_diaria, dias):
    """
    Recebe uma quantidade de dias que ficou hospedado e o valor da
    diária, e retorna o valor a ser pago, considerando um acréscimo de
    R$ 75,00 para limpeza e 5% de taxa de administração sobre o valor
    do aluguel, sem a taxa de limpeza
    """
    if dias < 0:
        return []
    else:
        return ((dias * valor_diaria) * 1.05) + 75


def converte_hora(horario):
    """
    Recebe um horário no formato 24 horas e retorna no formato am/pm
    """
    hora, minutos = horario.split(':')
    hora = int(hora)
    if hora > 12:
        hora_pm = hora - 12
        if hora_pm < 10:
            return '0{}:{} pm'.format(hora_pm, minutos)
        else:
            return '{}:{} pm'.format(hora_pm, minutos)
    else:
        if hora < 10:
            return '0{}:{} am'.format(hora, minutos)
        else:
            return '{}:{} am'.format(hora, minutos)


def situacao_aluno(nota1, nota2, nota3, faltas, aulas_ministradas):
    """
    A média do aluno é dada pela média aritmética simples entre as 3 notas.
    Se o aluno tiver mais de 25% de faltas, está automaticamente reprovado por faltas (RF).
    Se ele tiver média abaixo de 7.0, está em Exame Final (EF)
    Se tiver média acima de 7.0 e frequencia igual ou superior a 75% está aprovado (AP).
    """
    porcentagem_faltas = (100 * faltas) / aulas_ministradas
    frequencia = 100 - porcentagem_faltas
    media_simples = (nota1 + nota2 + nota3) / 3
    if frequencia < 75:
        return 'RF'
    if frequencia >= 75:
        if media_simples >= 7:
            return 'AP'
        else:
            return 'EF'


def aumento_preco(preco):
    """
    Calcula o aumento do preço, baseado no seguinte critério:
    - até 280 (inclusive): aumento de 20%
    - até 700 (inclusive): aumento de 15%
    - até 1500 (inclusive): aumento de 10%
    - acima de 1500: aumento de 5%
    """
    if preco > 1500:
        percentual_aumento = 5
        preco_novo = round(preco * 1.05, 2)
    if preco <= 1500:
        percentual_aumento = 10
        preco_novo = round(preco * 1.10, 2)
    if preco <= 700:
        percentual_aumento = 15
        preco_novo = round(preco * 1.15, 2)
    if preco <= 280:
        percentual_aumento = 20
        preco_novo = round(preco * 1.20, 2)
    preco = round(preco, 2)
    diferenca = round(preco_novo - preco, 2)
    return(preco, percentual_aumento, diferenca, preco_novo)


def idade_canina(idade_humana, porte_do_cao):
    """
    É sabido que os caẽs amadurecem mais rapidamente do que os seres
        humanos (na verdade, alguns serem humanos parecem nunca amadurecer).
    Calcule sua idade canina, baseada nos seguintes fatores:
    - cães de porte pequeno: fator 5;
    - cães de porte médio: fator 6;
    - cães grandes: fator 7.
    """
    import math
    if porte_do_cao == 'pequeno':
        return math.floor(idade_humana / 5)
    if porte_do_cao == 'medio':
        return math.floor(idade_humana / 6)
    if porte_do_cao == 'grande':
        return math.floor(idade_humana / 7)


def aumento_salario(salario):
    """
    Calcule o aumento de salário de acordo com a seguinte tabela:
    - até 1 SM(inclusive): aumento de 20%
    - de 1 até 2 SM(inclusive): aumento de 15%
    - de 2 até 5 SM(inclusive): aumento de 10%
    - acima de 5 SM: aumento de 5%

    Salário mínimo para referência: R$ 724,00
    """
    salario_min = 724
    if salario > 5 * salario_min:
        return round(salario * 1.05, 2)
    if salario > 2 * salario_min and salario <= 5 * salario_min:
        return round(salario * 1.10, 2)
    if salario > 1 * salario_min and salario <= 2 * salario_min:
        return round(salario * 1.15, 2)
    if salario <= salario_min:
        return round(salario * 1.20, 2)


def nota_para_conceito(nota):
    """
    Converta a nota para conceito, conforme a tabela abaixo:
    Nota                     Conceito
    Entre 10.0 e 9.0            A
    Entre 8.9 e 8.0             B
    Entre 7.9 e 7.0             C
    Entre 6.9 e 6.0             D
    Entre 5.9 e zero            E
    """
    if nota <= 10 and nota >= 9:
        return 'A'
    if nota <= 8.9 and nota >= 8:
        return 'B'
    if nota <= 7.9 and nota >= 7:
        return 'C'
    if nota <= 6.9 and nota >= 6:
        return 'D'
    else:
        return 'E'


def imc(peso, altura):
    """
    Escreva uma função que calcula o índice de massa corporal (imc = peso / altura ** 2),
    de acordo com a seguinte tabela:

    imc <= 18.5: "Subpeso"
    imc <= 25.0: "Normal"
    imc <= 30.0: "Sobrepeso"
    imc > 30: "Obeso"
    """
    imc = peso / altura ** 2
    if imc <= 18.5:
        return "Subpeso"
    if imc <= 25.0:
        return "Normal"
    if imc <= 30.0:
        return "Sobrepeso"
    if imc > 30:
        return "Obeso"


def conta_combustivel(qtde_litros, tipo_combustivel, tipo_pagamento):
    """
    O posto Tabajara está vendendo combustíveis com a seguinte tabela de preços:
        a. Tabela de preços
            Álcool: R$ 3,159
            Gasolina: R$ 3,739
            Diesel: 3,090
        b. Se o pagamento for feito à vista ou débito, o cliente recebe um desconto de 3% (10% na verdade) sobre o valor total
        c. Escreva um função que leia o número de litros vendidos, o tipo de combustível (gasolina, álcool, diesel),
            e o tipo de pagamento (à vista, débito, crédito), calcule e devolva o valor total da compra.
    """
    preco_alcool = 3.159
    preco_gasolina = 3.739
    preco_diesel = 3.090
    if tipo_combustivel == 'a':
        valor = preco_alcool * qtde_litros
        if tipo_pagamento == 'v' or tipo_pagamento == 'd':
            return round(valor * 0.90, 2)
        else:
            return round(valor, 2)
    if tipo_combustivel == 'g':
        valor = preco_gasolina * qtde_litros
        if tipo_pagamento == 'v' or tipo_pagamento == 'd':
            return round(valor * 0.90, 2)
        else:
            return round(valor, 2)
    if tipo_combustivel == 'd':
        valor = preco_diesel * qtde_litros
        if tipo_pagamento == 'v' or tipo_pagamento == 'd':
            return round(valor * 0.90, 2)
        else:
            return round(valor, 2)


def comprar_frutas(morango=0, uva=0):
    """
    Uma fruteira está vendendo frutas com a seguinte tabela de preços:
                          Até 5 Kg           Acima de 5 Kg
    Morango         R$ 2,50 por Kg          R$ 2,20 por Kg
    Uva             R$ 1,80 por Kg          R$ 1,50 por Kg

    Se o cliente comprar mais de 8 Kg em frutas ou o valor total da
    compra ultrapassar R$ 25,00, receberá ainda um desconto de 10%
    sobre este total.
    Escreva um algoritmo para ler a quantidade (em Kg) de morangos e a
    quantidade (em Kg) de uvas adquiridas e escreva o valor a ser
    pago pelo cliente.
    """
    total_kg = morango + uva
    if morango >= 0:
        if morango <= 5:
            morango_price = round((2.50 * morango), 2)
        if morango > 5:
            morango_price = round((2.20 * morango), 2)
        if uva <= 5:
            uva_price = round((1.80 * uva), 2)
            total_price = morango_price + uva_price
        if uva > 5:
            uva_price = round((1.50 * uva), 2)
            total_price = morango_price + uva_price
    if total_kg > 8 or total_price > 25:
        return round(total_price * (0.9), 2)
    else:
        return round(total_price, 2)

