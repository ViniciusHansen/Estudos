valor = input("valor da aplicação em reais: ")
taxa_de_juros_mensal = input(
    "rendimento mensal em percentual:")
aporte = input("valor dos aportes mensais:")
tempo = input("quantidade de meses reinvestindo os juros: ")
valor = float(valor)
tempo = float(tempo)
aporte = float(aporte)
taxa_de_juros_mensal = float(taxa_de_juros_mensal) / 100
valor_futuro = valor + \
    (aporte * ((1 + taxa_de_juros_mensal) ** tempo - 1)) / taxa_de_juros_mensal
valor_futuro = round(valor_futuro, 2)
#montante_final = aporte * (1 + taxa_de_juros_mensal) ** tempo
#montante_final = round(montante_final, 2)
print(valor_futuro)