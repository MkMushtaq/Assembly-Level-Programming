
;<Program title>

jmp start

;data


;code
START: NOP
LDA 0007H
MOV B,A
LDA 0008H
ADD B
DAA
STA 0009H
HLT
