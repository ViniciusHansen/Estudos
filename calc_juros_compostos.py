valor = input("valor da aplicação em reais: ")
taxa_de_juros_mensal = input(
    "rendimento mensal em percentual do valor aplicado:")
tempo = input("quantidade de meses reinvestindo os juros: ")
valor = float(valor)
tempo = float(tempo)
taxa_de_juros_mensal = float(taxa_de_juros_mensal) / 100
montante_final = valor * (1 + taxa_de_juros_mensal) ** tempo
montante_final = round(montante_final, 2)
print(montante_final)
