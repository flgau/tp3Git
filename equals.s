.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        .global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		movl $0, %eax   #r est dans le registre eax
        movl $0, %ecx   #c est dans le registre ecx
        jmp premierFor

    premierFor:
            jmp test2eFor

    test2eFor:
            cmp 16(%ebp), %ecx
            jnae deuxiemeFor
            jmp incrementePremierFor
            
    deuxiemeFor:
           movl $0, %edx    #creation de variable temporaire (position)
           addl %eax, %edx  #edx = eax = r
           imul 16(%ebp), %edx  #edx = matorder * %edx
           add %ecx, %edx
           cmp ( %edx(12(%ebp)), %edx(16(%ebp)      ) # flag = inmatdata1[c + r * matorder] - inmatdata2[c + r * matorder] 
                                                       # et on veut flag!= 0 pour retourner 0 
           jne retourner0       #flag != 0
           jmp incrementeDeuxiemeFor #si flag = 0


    retourner0:
            mov $0, %eax #on met 0 dans %eax
            jmp end
    
    incrementeDeuxiemeFor:
            add $1, %ecx
            jmp test2eFor            
    
    incrementePremierFor:
            add $1, eax
            movl $0, ecx
            jmp test1erFor

    test1erFor:
            cmp 16(%ebp), %eax # flag = r - matorder
            jnae premierFor
            jmp retourner1
            
    retourner1:
            movl $1, %eax
            jmp end

     end:
            leave
            ret # fin du programme
            
     
		
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		

        
       
