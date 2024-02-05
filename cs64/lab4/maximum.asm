# maximum.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum value
# See assignment description for details

.data

	# TODO: Complete these declarations / initializations

enter: .asciiz "Enter number:\n"
result: .asciiz "Maximum: "
newline:  .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

	li $v0, 4
    la $a0, enter
    syscall

    li $v0, 5
    syscall # Gets us an input from user
	# The result will be in reg. $v0
	move $t0, $v0

	li $v0, 4
    la $a0, enter
    syscall

    li $v0, 5
    syscall # Gets us an input from user
	# The result will be in reg. $v0
	move $t1, $v0

	li $v0, 4
    la $a0, enter
    syscall

    li $v0, 5
    syscall # Gets us an input from user
	# The result will be in reg. $v0
	move $t2, $v0

	#first compare t0 and t1
	slt $t3, $t0, $t1
	bne $t3, $zero, else1

	# if t0 > t1, t3 = 0
	slt $t4, $t0, $t2
	bne $t4, $zero, max2

	# if t0 > t2, t4 = 0
	# print t0 then jump (unconditionally) to exit program
	li $v0, 4
	la $a0, result
	syscall

    li $v0, 1
	move $a0, $t0
    syscall

    j exit

else1:
# if t0 < t1
# compare t1 with t2
	slt $t4, $t1, $t2
	bne $t4, $zero, max2

	# t1 > t2
	li $v0, 4
	la $a0, result
	syscall

    li $v0, 1
	move $a0, $t1
    syscall

    j exit

max2:
	li $v0, 4
	la $a0, result
	syscall

    li $v0, 1
	move $a0, $t2
    syscall

    j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
