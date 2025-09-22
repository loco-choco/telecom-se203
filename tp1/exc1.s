.syntax unified
.arch armv7e-m
.cpu cortex-m4

.thumb

.global _start

_start:
  mov r0, #256
  ldr r1, =0x10000000
  ldr r2, =0xdeadbeef
loop:
  subs r0, r0, #4
  str r2, [r0, r1]
  bne loop
end:
  b end
