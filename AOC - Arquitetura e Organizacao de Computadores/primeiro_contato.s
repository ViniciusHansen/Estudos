# Converte o programa em C:
# int v[4] = {3,7,5,1};
# v[2] = 87 + v[3];

    .data
vector:
    .word 3
    .word 7
    .word 5
    .word 1

    .text
    .globl main

main:
    la $t0, vector # carrega o vetor (pelo endereço)
    lw $t1, 12($t0) # carrega v[3] (1)
    addi $t1, $t1, 87 # adiciona 87 ao valor de v[3](1)
    sw $t1, 8($t0) # salva o valor em v[2]

end:
    li $v0, 10 # encerra o programa de acordo com a tabela
    syscall
