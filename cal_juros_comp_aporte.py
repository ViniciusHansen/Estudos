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
# Fórmula dos juros compostos com aportes mensais
comp_com_aporte = valor + \
    (aporte * ((1 + juros_mensal) ** tempo - 1)) / juros_mensal
comp_com_aporte = round(comp_com_aporte, 2)
# Fórmula dos juros compostos sem apotes mensair para comparação
comp_sem_aporte = valor * (1 + juros_mensal) ** tempo
comp_sem_aporte = round(comp_sem_aporte, 2)
# Fórmula dos juros simples para comparação
juros_simples = (valor * juros_mensal) * tempo
# descontando inflação de 2021(~5%)
#comp_com_aporte = comp_com_aporte * 0.95
#comp_sem_aporte = comp_sem_aporte * 0.95
#juros_simples = juros_simples * 0.95
#print(linha, '\n')
print('\n', 'Valores aproximados:', '\n')
print(' * Valor Final do investimento com aportes mensais e reaplicação de juros:',
      comp_com_aporte, '\n')
print(' * Valor Final do investimento apenas com reaplicação de juros:',
      comp_sem_aporte, '\n')
print(' * Valor Final do investimento em juros simples:',
      juros_simples, '\n')
print('\n')
# fazer mais tarde: comparar os ganhos com aporte e sem aporte e descontar inflação
