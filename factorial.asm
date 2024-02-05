# factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data
enter: .asciiz "Enter a number:\n"
factorial: .asciiz "Factorial of "
cont: .asciiz " is:\n"
newline: .asciiz "\n"

	# TODO: Write your initializations here

#Text Area (i.e. instructions)
.text
main:
	li $v0, 4
	la $a0, enter
	syscall 

	li $v0, 5
	syscall

	move $t0, $v0
	move $t2, $v0

	li $t1, 1

loop: # loop starts here:
	# If n = 0, then exit the loop:
    beq $t0, $zero, exitloop

	# Otherwise (n !=0 ):
    # product * n
    mult $t1, $t0
	mflo $t1

	# n--
	addi $t0, $t0, -1

	j loop

exitloop:
	li $v0, 4
	la $a0, factorial
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 4
	la $a0, cont
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, newline
	syscall


exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall