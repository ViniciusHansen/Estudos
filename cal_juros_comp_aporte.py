# input dos valores
valor = input("valor da aplicação em reais: ")
juros_mensal = input(
    "rendimento mensal em percentual:")
aporte = input("valor dos aportes mensais:")
tempo = input("quantidade de meses reinvestindo os juros: ")
# Conversão de string para float
valor = float(valor)
tempo = float(tempo)
aporte = float(aporte)
juros_mensal = float(juros_mensal) / 100
# Fórmula dos juros compostos com aportes mensais
valor_futuro = valor + \
    (aporte * ((1 + juros_mensal) ** tempo - 1)) / juros_mensal
# Arredondamento e print
print(round(valor_futuro, 2))

# fazer mais tarde: comparar os ganhos com aporte e sem aporte
