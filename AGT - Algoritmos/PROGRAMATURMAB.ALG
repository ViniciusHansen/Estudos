// Vinícius Hansen
Algoritmo "programaTurmaB"
Var
   tipo_comida, nome, endereco, telefone, forma_pagto, refrigerante : caracter
   restaurante , sabor, tamanho: inteiro
   refri: logico
   conta, valor_sabor, valor_refri, frete: real
Inicio
   escreva("Digite o tipo de comida:")
   leia( tipo_comida)
   escreval("Você escolheu ", tipo_comida)
   frete <- 7.50 //atribuicao
   valor_sabor <-39.90
   valor_refri <- 8
   SE tipo_comida="pizza" ENTAO
      escreval("1.Di Roma")
      escreval("2.Baggio")
      escreval("3.Pizzaria do Fritz")
      escreval("4.Oficina das Pizzas")
      escreva("Digite o número do restaurante:")
      leia(restaurante)
      escreval("Sabores:")
      escreval("1) 4 Queijos")
      escreval("2) Frango")
      escreval("3) Calabresa")
      escreval("4) Bacon Queijo e Milho(americano)")
      escreval("Digite o número do sabor")
      leia( sabor)
      escreval("Tamanho")
      escreval("1. Pequena")
      escreval("2. Médio")
      escreval("3. Grande")
      leia(tamanho)
      escreval("Quer refrigerante?(s/n)")
      leia(refrigerante)
      SE refrigerante = "n" ENTAO
           valor_refri <- 0
      FIMSE
      escreval("Nome")
      leia(nome)
      escreval("Endereço")
      leia(endereco)
      escreval("Telefone")
      leia(telefone)
      escreval("Forma de Pagamento")
      leia(forma_pagto)
      conta <- valor_sabor + valor_refri + frete
      escreva("Sua conta é de")
      escreval(conta)

   FIMSE
   escreva("Volte sempre.")
Fimalgoritmo