# MIPS processor
## Supported instructions
|  Instruction   |  Syntax   |  Operation   | Encoding   |  Note
| ----- | ------------------ | --------- | --------------------- | ----------------
|  add   | add d, s, t   |  d = s + t;   |  `0000 00ss ssst tttt dddd d000 0010 0000`  |
|  sub   | sub d, s, t   |  d = s - t;   |  `0000 00ss ssst tttt dddd d000 0010 0010`  |
|  and   | and d, s, t   |  d = s & t;   |  `0000 00ss ssst tttt dddd d000 0010 0100`  |
|  or    | or d, s, t    |  d = s \| t;   |  `0000 00ss ssst tttt dddd d000 0010 0101`  |
|  slt   | slt d, s, t   |  d = (s<t) ? 1 : 0;   |  `0000 00ss ssst tttt dddd d000 0010 1010`  |
|  addi   | addi t, s, imm   |  t = s + imm;   |  `0010 00ss ssst tttt iiii iiii iiii iiii`  |
|  lw   | lw t, offset(s)   |  t = MEM[s + offset];   |  `1000 11ss ssst tttt iiii iiii iiii iiii`  |
|  sw   | sw t, offset(s)   |  MEM[s + offset] = t;   |  `1010 11ss ssst tttt iiii iiii iiii iiii`  |
|  beq   | beq s, t, offset |  if s==t<br>then PC=PC+4+(offset << 2);<br>else PC=PC+4;   |  `0001 00ss ssst tttt iiii iiii iiii iiii`  |
|  jal   | jal target   | $31=PC+4;<br> PC=(PC & 0xf0000000) \| (target << 2);  | `0000 11ii iiii iiii iiii iiii iiii iiii`   | this doesn't match original MIPS32
|  jr   | jr s   |  PC = s;   | `0001 11ss sss0 0000 0000 0000 0000 1000`   | this doesn't match original MIPS32, opcode changed
|  addu.qb   | addu.qb d, s, t   |  d<sub>31:24</sub> = s<sub>31:24</sub> + t<sub>31:24</sub>; etc.   |  `0111 11ss ssst tttt dddd d000 0001 0000`   | Element-wise addition of two vectors of unsigned byte values
|  addu_s.qb   | addu_s.qb d, s, t   |  d<sub>31:24</sub> = sat(s<sub>31:24</sub> + t<sub>31:24</sub>); etc.   |  `0111 11ss ssst tttt dddd d001 0001 0000`   | with saturation
| sllv	| sllv d, t, s	| d = t << s;	| `0000 00ss ssst tttt dddd dxxx xx00 0100` | 
| srlv	| srlv d, t, s	| d = (unsigned)t >> s;	| `0000 00ss ssst tttt dddd d000 0000 0110` |
| srav	| srav d, t, s	| d = (signed)t >> s;	| `0000 00ss ssst tttt dddd d000 0000 0111` |	The sign bit is shifted in.
| j	| j target	| PC=(PC & 0xf0000000) \| (target << 2);	| `0000 10ii iiii iiii iiii iiii iiii iiii`	|
