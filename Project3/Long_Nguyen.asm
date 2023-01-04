;Long Nguyen
;
;lzn0025
; 
;Project 3
; 
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    shift dword 2
    input byte 1,2,3,4,5,6,7,8
    output byte lengthof input dup(?)

.code

    main proc
        ;This loop will iterate length - shift times. 
            mov ecx, lengthof input
        ;(this loop will place the 'non-wraped' values)
            sub ecx, shift
        ;Start writing from input at shift
            mov edi, shift
        ;Start reading at 0 
            mov esi, 0


        l1:
        ;Move the value from input into al
            mov al, input[esi]
        ;Move the value from al into output
            mov output[edi], al
        ;Increment the input index
        ;Increment the output index
            inc esi
            inc edi
        loop l1


        ;This loop will iterate shift times
            mov ecx, shift
        ;Start reading at index length - shift
            mov esi, lengthof input
        ;Start writing at index 0.  
            mov edi, 0
        ;(this loop will place the 'wrapped' values)
            sub esi, shift

        l2:
        ;Move the value from input into al
            mov al, input[edi]
        ;Move the value from al into output
            mov output[esi], al
        ;Increment the input index
        ;Increment the output index
            inc edi
            inc esi
        loop l2



INVOKE ExitProcess,0
main ENDP
END main
