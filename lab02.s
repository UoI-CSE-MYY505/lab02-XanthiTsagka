
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
    add s0, zero, zero
    add t1, a1, zero
    beq s0, a1, done
    loop:    
        lw t0, 0(a0)
        beq t0, a2, exit_found
        beq t1, zero, done
    next:
        addi a0, a0, 4
        addi t1, t1, -1
        j    loop
    exit_found:
        add  s0, a0, zero
        bne t1, zero, next
        j done

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
