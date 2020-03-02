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
                cmp 16(%ebp), %ecx  # flags = %ecx - matorder
                jnae deuxiemeFor
                jmp incrementePremierFor
       
        deuxiemeFor:
                cmp %ecx, %eax      # flags = %eax - %ecx  (r - c)
                je premierIf        # aller dans le if si le flags = 0
                jmp premierElse     # sinon aller dans le Else

        premierIf:
                movl $0, %edx       # initialisation du registre edx à 0
                addl %eax, %edx     # on ajoute la valeur r dans le registre edx
                imul 16(%ebp), %edx # %edx = %edx * matorder 
                addl %ecx, %edx     # %edx = %edx + c
                movl 8(%ebp)(%edx), 12(%ebp)(%edx)    # outmatdata[c + r * matorder] = inmatdata[c + r * matorder];
                jmp test2eFor
        


        

		
        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

