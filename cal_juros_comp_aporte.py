# input dos valores
valor = input("valor da aplicação em reais: ")
juros_mensal = input("rendimento mensal em percentual:")
aporte = input("valor dos aportes mensais:")
tempo = input("quantidade de meses reinvestindo os juros: ")
# Conversão de string para float
valor = float(valor)
tempo = int(tempo)
aporte = float(aporte)
juros_mensal = float(juros_mensal) / 100
# Math
juros_aporte = round(
    valor + (aporte * ((1 + juros_mensal) ** tempo - 1)) / juros_mensal, 2)
juros_reapply = round(valor * (1 + juros_mensal) ** tempo, 2)
juros_simples = (valor * juros_mensal) * tempo
# print
print('\n', 'Valores aproximados:', '\n')
print(' * Valor Final do investimento com aportes mensais e reaplicação de juros:',
      juros_aporte, '\n')
print(' * Valor Final do investimento apenas com reaplicação de juros:',
      juros_reapply, '\n')
print(' * Valor Final do investimento em juros simples:',
      juros_simples, '\n')
print('\n')
