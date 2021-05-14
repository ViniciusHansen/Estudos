# input dos valores
valor = input("valor da aplicação em reais: ")
taxa_de_juros_mensal = input(
    "rendimento mensal em percentual:")
aporte = input("valor dos aportes mensais:")
tempo = input("quantidade de meses reinvestindo os juros: ")
# Conversão de string para float
valor = float(valor)
tempo = float(tempo)
aporte = float(aporte)
taxa_de_juros_mensal = float(taxa_de_juros_mensal) / 100
# Fórmula dos juros compostos com aportes mensais
valor_futuro = valor + \
    (aporte * ((1 + taxa_de_juros_mensal) ** tempo - 1)) / taxa_de_juros_mensal
# Arredondamento e print
print(round(valor_futuro, 2))
