.text
.globl main

main:
	li, $v0, 5
	syscall
	or $a0, $v0, $zero
	jal contagem
	move $a0,$v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
contagem:
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	ori $s1, $zero, 10
	ori $s2, $zero, 0
	or $s0, $zero, $a0
while:
	div $s0, $s1
	mflo $s0
	addi $s2, $s2, 1
	bnez $s0, while
final_contador:
	or $v0, $zero, $s2
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	jr $ra
