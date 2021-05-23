# input dos valores e aviso:
print('essa calculadora não considera aportes mensais')
valor = input("valor da aplicação em reais: ")
taxa_de_juros_mensal = input(
    "rendimento mensal em percentual do valor aplicado:")
tempo = input("quantidade de meses reinvestindo os juros: ")
# Conversão de string para float
valor = float(valor)
tempo = float(tempo)
taxa_de_juros_mensal = float(taxa_de_juros_mensal) / 100
# Fórmula de juros compostos
valor_futuro = valor * (1 + taxa_de_juros_mensal) ** tempo
# Arredondamento e print
print(round(valor_futuro, 2))
