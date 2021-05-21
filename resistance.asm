;David Navarro
;CPSC240-1 Test 1
global resistance
extern printf
extern scanf

section .data
    inputResistance db "Please enter the resistance numbers of the two subcircuits separated by ws and press enter.",0
    outputResistance db "These resistances were received: %lf Ω, %lf Ω, %lf Ω",10,0
    totalResistance db "The resistance of the entire circuit is:  %lf Ω",10,0
    threeResistance db "%lf %lf %lf",0
    totalR db "%lf",0
section .bss  

section .text
resistance:

    ; Back up all registers and set stack pointer to base pointer
    push rbp
    mov rbp, rsp
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    pushf

    push qword -1                   ; Extra push to create even number of pushes

; ----------------------------------------------------------------------
;Display message to input the resistances
push qword 99
mov rax, 0
mov rdi, inputResistance         
call printf
pop rax
; ------------------------------------------------------------------------
;Input 3 resistances
push qword -1
push qword -2
push qword -3
mov rax, 0
mov rdi, threeResistance  
mov rsi, rsp                   
mov rdx, rsp
add rdx, 8                     
mov rcx, rsp
add rcx, 16                   
call scanf
movsd xmm5, [rsp]
movsd xmm6, [rsp+8]
movsd xmm7, [rsp+16]
pop rax                        
pop rax                        
pop rax  
;--------------------------------------------------------------------
;Display the three resistances
push qword 99                
mov rax, 3                     
mov rdi, outputResistance      
movsd xmm0, xmm5
movsd xmm1, xmm6
movsd xmm2, xmm7
movsd xmm15, xmm7              
call printf
pop rax                        
;--------------------------------------------------------------------------------------
;calculate and display the total resistance
push qword 0
mov r8, 1 
cvtsi2sd xmm12, r8 
divsd xmm12, xmm5 

push qword 0
mov r9, 1 
cvtsi2sd xmm13, r9 
divsd xmm13, xmm6 

push qword 0
mov r10, 1 
cvtsi2sd xmm14, r10
divsd xmm14, xmm7 

mov rax, 1
addsd xmm12, xmm13  
addsd xmm12, xmm14 
movsd xmm15, xmm12 

mov r11, 1 
cvtsi2sd xmm11, r11
divsd xmm11, xmm15 
movsd xmm10, xmm11 

mov rax, 1
mov rdi, totalResistance 
movsd xmm0, xmm11
call printf
pop rax
pop rax
pop rax

;--------------------------------------------------------------------------------------
movsd xmm0, xmm10

pop rax                         ; Remove extra push of -1 from stack.    
;---------------------------------------------------------------------

; Restores all registers to their original state.
popf                                                 
pop rbx                                                     
pop r15                                                     
pop r14                                                      
pop r13                                                      
pop r12                                                      
pop r11                                                     
pop r10                                                     
pop r9                                                      
pop r8                                                      
pop rcx                                                     
pop rdx                                                     
pop rsi                                                     
pop rdi                                                     
pop rbp

ret






