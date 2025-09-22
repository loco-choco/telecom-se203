.syntax unified
.arch armv7e-m
.cpu cortex-m4

.thumb

.global _start

_start:
  ldr sp, =stack_end
  
  ldr r0, =256
  ldr r1, =0x10000000
  ldr r2, =0xdeadbeef
  bl initialiser

  ldr r0, =256
  ldr r1, =0x10000000
  ldr r2, =0x10000300
  bl copier

  ldr r0, =256
  ldr r1, =0x10000000
  ldr r2, =0
  bl initialiser  
end:
  b end
  
/*
  Initalise une region de mem
  Parametre:
  r0 - Taile
  r1 - Destine
  r2 - Contenu
*/
initialiser:
initialiser_loop:
  subs r0, r0, #4
  str r2, [r0, r1]
  bne initialiser_loop
initialiser_end:
  bx lr
/*
  Faire la copie d'une region de mem à autre
  Parametre:
  r0 - Taile
  r1 - Origine
  r2 - Destine
*/
copier:
  push {r3}
copier_loop:
  subs r0, r0, #4
  ldr r3, [r0, r1]
  str r3, [r0, r2]
  bne copier_loop
copier_end:
  pop {r3}
  bx lr
stack:
.fill 16,4,0x0
stack_end:
