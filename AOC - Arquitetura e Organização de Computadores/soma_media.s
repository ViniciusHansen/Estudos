.data
error_msg: .asciiz "ERRO"
new_line: .asciiz "\n"

.text
.globl main

main:
	li $v0, 5
	syscall
	addi $s1, $v0, 0 # move o valor lido para $s1
	beq $s1, -1, calculos # se $s1 == -1 va para calculos
	# $s2 é a soma dos valores
	# $s3 é a quantidade de elementos
	add $s2, $s2, $s1 # else $s2 += $s1
	addi $s3, $s3, 1 # $s3 += 1
	j main
calculos:
	#$s4 é a media
	div $s2, $s3
	mflo $s4
print_soma:
	addi $a0, $s2, 0
	li $v0, 1
	syscall
	li $v0, 4 # codigo de print char
	la $a0, new_line # carrega quebra de linha
	syscall
	beqz $s3, erro
print_div:
	addi $a0, $s4, 0
	li $v0, 1
	syscall
	j end
erro:
	la $a0, error_msg
	li $v0, 4
	syscall
end:
	li $v0, 10
	syscall
