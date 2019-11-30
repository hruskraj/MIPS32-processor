.data
.align 2

array:
.word -5, 12, -19, 0, 59, 4, 82

.text                     # beginning of the text segment (or code segment)
beq $0, $0, start

sort:
  add $8, $0, $a1         # $8 is the end value for forI
  add $9, $0, $0          # $9 is the value of i
  add $24, $0, $a0        # $24 is the address of i-th element 
  forI:
    beq $8, $9, doneI
    add $10, $0, $a1      # $10 is the end value for forJ
    addi $11, $9, 1       # $11 is the value of j
    addi $25, $24, 0x4    # $25 is the address of j-th element 
    forJ:
      beq $10, $11, doneJ
      
      lw $12, ($24)       # $12 is the value of i-th element
      lw $13, ($25)       # $13 is the value of j-th element
      
      slt $14, $13, $12
      beq $14, $0, isSmaller
      sw $12, ($25)
      sw $13, ($24)  
      
      isSmaller:
      addi $11, $11, 1
      addi $25, $25, 0x4
      beq $0, $0, forJ
    doneJ: 
    addi $9, $9, 1
    addi $24, $24, 0x4
    beq $0, $0, forI
  doneI: 
  jr $ra
   
start:
  lw $a0, 0x0000000C
  lw $a1, 0x00000008
  #addi $a1, $0, 7
  #la $a0, array
  jal sort
  
