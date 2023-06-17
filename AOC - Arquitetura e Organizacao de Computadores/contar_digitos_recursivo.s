# Colaboração com Anna Paula Mennegheli

.data
	str: .asciiz "\n"
.text
.globl main
main:
	li $v0, 5
	syscall
	beqz $v0, end
	or $a0, $zero, $v0 # N
	li $v0, 5
	syscall
	or $a1, $zero, $v0 # k
	jal compara_digitos
	move $a0, $v0
	li $v0, 1
	syscall # imprimir
	la $a0, str  # carrega a str1 para $a0
	li $v0, 4  # printa a str1
	syscall
	j main
end:
	li $v0, 10
	syscall
compara_digitos:

	blt $a0, 1, compara_digitos_parada
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	li $t0, 10
	div $a0, $t0 #n/10
	mfhi $s0 #salva resto de n na pilha
	mflo $a0 #salva o quo de n no a0
	jal compara_digitos 
	bne $s0, $a1, pula
	addi $v0, $v0, 1
pula:	
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
compara_digitos_parada:
	ori $v0, $zero, 0
	jr $ra