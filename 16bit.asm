[org 0x0100]

 mov cl,16
 mov dx,[multiplier]

start:
shr dx,1
jnc skip
          
mov ax,[multiplicand]
add [result],ax
mov ax,[multiplicand+2]
adc [result+2],ax

skip:
shl word[multiplicand],1
rcl word[multiplicand+2],1
dec cl
jnz start

mov ax,[result+2]
mov ax,[result]
mov ax,0x4c00
int 0x21

multiplicand: dd 1500
multiplier: dw 200
result: dd 0