# JTAG init kernel

This directory contains the source code for a very small kernel.img that just
prints a greeting message to the UART, enables the ALT4 functions on the JTAG
pins, and then halts the CPU awaiting instructions from a connected JTAG
adapter.

To build it you will need an `aarch64-linux-gnu` toolchain including `gcc`,
`as`, `ld`, and `objcopy`. Ubuntu Xenial has packages for this named
`gcc-4.8-aarch64-linux-gnu` or `gcc-4.9-aarch64-linux-gnu`.

Build by running `make`, populate the boot partition of your Raspberry Pi
SD card with
[the standard Raspberry Pi firmware](https://github.com/raspberrypi/firmware/tree/master/boot),
and then copy the contents of the generated `bootfs` subdirectory into the boot
partition. This will overwrite two files in the stock firmware:
[the `config.txt` file](https://www.raspberrypi.org/documentation/configuration/config-txt/)
and the Linux kernel image for the Pi 1, Pi Zero, and Compute Module.

The `config.txt` contains `enable_jtag_gpio=1`, which actually enables the
JTAG pin functions earlier on suitably-modern firmware. The code in `kernel.img`
will then configure the pin functions again to make sure.

If all goes to plan and you have a terminal program listening to the UART
you should see the following message on the serial port at boot:

```
Enabling JTAG
```

To make use of this you will need a build of OpenOCD that has `aarch64` support
and a Raspberry Pi 3 target file. At the time of writing neither is included
in a released version of OpenOCD, but you can build
[daniel-k's fork](https://github.com/daniel-k/openocd) (branch armv8) to get
the necessary support to launch OpenOCD. Since I'm using a
[Segger J-Link](https://www.segger.com/products/debug-probes/j-link/) adapter,
my launch command is as follows. You will need to change the first path
to a different interface configuration if you are using a different adapter.

```
openocd -f interface/jlink.cfg -f target/rpi3.cfg
```

With OpenOCD running you can connect an aarch64-targeting `gdb` to the OpenOCD
gdbserver:

```
$ aarch64-linux-gnu-gdb
GNU gdb (GDB) 8.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=x86_64-pc-linux-gnu --target=aarch64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) file yourprogram.elf
Reading symbols from toyos.elf...done.
(gdb) monitor targets rpi3.cpu
(gdb) monitor halt
(gdb) load_image yourprogram.img 0 bin
(gdb) monitor reset halt
(gdb) monitor reg pc 0
(gdb) c
```

In the above `yourprogram.elf` and `yourprogram.img` are both different forms
of the program you wish to run and debug on the Raspberry Pi 3. The former is
in ELF format and used locally by `gdb`, while the latter is the raw binary
image that is loaded into the Raspberry Pi's memory and executed.

The `monitor` commands run direct OpenOCD commands. You can run `monitor help`
to see the usage information for all of these.

Once you get `gdb` working and get comfortable with it you can load and execute
bare metal code on your Raspberry Pi directly from your development machine,
without constantly swapping and rewriting SD cards, configuring netboot, etc.
