# input dos valores
# valor = input("valor da aplicação em reais: ")
# juros_mensal = input("rendimento mensal em percentual:")
# aporte = input("valor dos aportes mensais:")
# tempo = input("quantidade de meses reinvestindo os juros: ")

# Conversão de string para float
# valor = float(valor)
# tempo = int(tempo)
# aporte = float(aporte)
# juros_mensal = float(juros_mensal) / 100

# Valores
valor = 1000
juros_mensal = 0.5 / 100
aporte = 200
tempo = 60  # meses

# Math
juros_aporte = round(
    valor + (aporte * ((1 + juros_mensal) ** tempo - 1)) / juros_mensal, 2)
juros_reapply = round(valor * (1 + juros_mensal) ** tempo, 2)
juros_simples = (valor * juros_mensal) * tempo

# print
print('\n', 'Valor Final do investimento: ', '\n')
print('* aportes mensais e reaplicação de juros: R$:{} \n'.format(juros_aporte))
print('* reaplicação de juros: R$:{} \n'.format(juros_reapply))
print('* Rendimento em juros simples: R$:{} por mês \n'.format(juros_simples))
