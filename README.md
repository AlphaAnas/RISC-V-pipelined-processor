## RISC V processor implementation using Verilog language in Vivado. 

# Task 1
'''
Task 1 is implementation of a complete processor as per the circuit [diagram]{} that is not pipelined. Thereof, it is sequential - each instruction can be executed after completion of previous instruction in order to get the right output
'''

# Task 2
'''
Task 2 is implementation of a complete *Pipelined* processor as per the circuit [diagram]{} . Thereof, it can executed parallel processing - each instruction can be executed whilst previous instruction is executing.
It achiieves this through forwarding. For instance

**add x1 , x2, x3
sub x4, x1, x6**
The above is example of type 1a data hazard and this is mitigated through forwarding the value of x1 at EXE stage to the ID stage of next instruction
Thereof, it is important to note here that LOAD USE DATA HAZARD is solved using stalling.
'''

# Task 3
'''
Task 3 is comparision of performace of task1 -non pipelined- vs pipelined processor in Task 2. It measures hwo much faster is pipelined processor using bubble-sort algorithm. However, our implementation wasn't able to achieve desired outcome in pipelined processor.
'''
