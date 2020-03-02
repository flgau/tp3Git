.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        subl $8, %esp #on fait la place
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
