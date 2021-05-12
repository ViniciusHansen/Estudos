valor = input("valor da aplicação em reais: ")
taxa_de_juros_mensal = input(
    "rendimento mensal em percentual do valor aplicado:")
valor = float(valor)
taxa_de_juros_mensal = float(taxa_de_juros_mensal) / 100
rendimento_mensal = valor * taxa_de_juros_mensal
print('O Rendimento Mensal é de', rendimento_mensal, 'reais')
