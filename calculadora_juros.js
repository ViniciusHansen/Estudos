// input dos valores
var valor = 1000 
var juros_mensal = 0.5 
var aporte = 200 
var tempo = 60 
//math
var juros_mensal = (juros_mensal / 100)
var juros_aporte = (valor + (aporte * ((1 + juros_mensal) ** tempo - 1)) / juros_mensal)
var juros_reapply = (valor * (1 + juros_mensal) ** tempo)
var juros_simples = ((valor * juros_mensal) * tempo)
//return
console.log('\n', 'Valor Final do investimento: ', '\n')
console.log(' * aportes mensais e reaplicação de juros: R$:' + juros_aporte, '\n')
console.log(' * reaplicação de juros: R$:' + juros_reapply, '\n')
console.log(' Rendimento em juros simples: R$:' + juros_simples + ' por mês', '\n')