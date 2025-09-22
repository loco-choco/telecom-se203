.syntax unified
.arch armv7e-m
.cpu cortex-m4

.thumb

.global _start

_start:
  ldr sp, =stack_end

  adr r0, string
  ldr r1, =0x10000000
  bl copier_string
end:
  b end

/*
  Faire la copie d'une string à une region de mem
  Parametre:
  r0 - Origine
  r1 - Destine
*/
copier_string:
  push {r0, r1, r2}
copier_string_loop:
  ldrb r2, [r0],#1
  strb r2, [r1],#1
  cmp r2, #0
  bne copier_string_loop
copier_string_end:
  pop {r0, r1, r2}
  bx lr

string:
.asciz "Bonjour le monde!"
stack:
.fill 16,4,0x0
stack_end:
