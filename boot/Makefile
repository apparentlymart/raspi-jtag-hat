NAME	= raspi-jtag.elf
KERNEL	= kernel.img
CROSS	= aarch64-linux-gnu-
CFLAGS	= -ggdb3 -std=gnu99 -Wall
LDFLAGS = -Bstatic --gc-sections -nostartfiles -nostdlib
CC      = ${CROSS}gcc
AS      = ${CROSS}as
LD      = ${CROSS}ld
OBJCOPY = ${CROSS}objcopy
GDB     = ${CROSS}gdb
GDBOPTS = -iex "file ${NAME}" -iex "target remote 127.0.0.1:3333" -iex "monitor targets rpi3.cpu" -iex "monitor reset halt"

all: bootdir

bootdir: $(KERNEL) bootfs/config.txt bootfs/kernel.img

%.o: %.s
	${AS} -o $@ $<

%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $<

$(NAME): init.o boot.o
	${LD} $(LDFLAGS) -o $@ -T linker.ld $<

$(KERNEL): $(NAME)
	${OBJCOPY} --gap-fill=0xff -j .text -j .rodata -j .data -O binary $< $@

clean:
	rm -rf $(KERNEL) $(NAME) *.o bootfs

.PHONY: all clean bootdir

bootfs/config.txt: config.txt
	mkdir -p $(@D)
	cp $< $@

bootfs/kernel.img: kernel.img
	mkdir -p $(@D)
	cp $< $@
