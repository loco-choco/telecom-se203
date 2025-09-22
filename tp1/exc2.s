.syntax unified
.arch armv7e-m
.cpu cortex-m4

.thumb

.global _start

_start:
  mov r0, #256
  ldr r1, =0x10000000
  ldr r2, =0x10000300
/* ldr r2, =0xdeadbeef */
loop:
  subs r0, r0, #4
  ldr r3, [r0, r1]
  str r3, [r0, r2]
  bne loop
end:
  b end
