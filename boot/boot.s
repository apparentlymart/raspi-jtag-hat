.globl _start
_start:
	// All four CPU cores start executing here on boot. We want to halt
    // all but the first one so that our init code (in C) will run only once.
	mrs x2, MPIDR_EL1
	and x2, x2, #0xFF
	cbnz x2, spin

	// Call into the C init function.
	ldr x5, =0x00100000
	mov sp, x5
	bl init

spin:
    // Here we just wait for an interrupt and then loop, so any core that
    // ends up in here will be generally idle.
    wfi
	b spin
