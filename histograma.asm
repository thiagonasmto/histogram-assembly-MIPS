.data 
	V: .word 9, 5, 7, 5, 3, 4, 0, 2, 6, 4, 2, 5, 4, 1, 2, 1, 6, 2, 2, 3, 6, 3, 0, 0, 7, 8, 3, 4, 5, 4, 0, 5, 2, 9, 8, 7
	H: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
.text 
	li $t1, 144 #TAM_V
	li $t2, 0  #i = 0
	li $t3, 0  #j = 0
	li $t4, 0  #cont = 0
	li $t6, 40 #TAM_H
	
	main:
	move $t2, $zero 			 # i = 0
	loopCompareFixed:
	blt $t2, $t6, loopCompareVariable 	 # i < TAM_H
	j loopFirst
	    loopCompareVariable:
	    blt $t3, $t1, cont     		 # j < TAM_V
	        j loopSecond       		 # Se não j < TAM_V
	        cont:              		 # Se sim j < TAM_V
	        lw $t5, V($t3) 			 # Pegando o valor de V[j]
	        div $t7, $t2, 4 		 # Conversão de incremento em 4 para um número sequêncial (0, 4, 8... = 0, 1, 2)
	        beq $t5, $t7, testLoopCompare    # V[j] == i
	        addi $t3, $t3, 4 		 # Se não V[j] == i, j++ 
	        j loopCompareVariable
	        testLoopCompare: 		 # Se sim V[j] == i
	        addi $t4, $t4, 1 		 # Cont++
	        addi $t3, $t3, 4 		 # j++
	        j loopCompareVariable
	    loopSecond: 
	    sw $t4, H($t2) 			 # Escreva cont em H[i]
	    li $v0, 1
	    lw $a0, H($t2)
	    addi $t2, $t2, 4 			 # i++
	    li $t4, 0 				 # Reset cont
	    li $t3, 0 				 # Reset j
	    syscall 				 # Imprima H[i]
	    j loopCompareFixed 
	loopFirst:
	         
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
