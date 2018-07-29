
# This Makefile exists primarily for the author's benefit in creating all of
# the artifacts that get attached to a tagged release. If you just want to look
# at the design files, the .pro file can be loaded directly into KiCad without
# any need to do anything with this Makefile.

all: dist

dist: dist/gerbers.zip dist/bootfs.zip

gerbers: raspi-jtag-hat.kicad_pcb
	python gerbers.py $<

bootfs:
	cd boot && make

dist/gerbers.zip: gerbers
	mkdir -p $(@D)
	cd gerbers && zip ../dist/gerbers.zip raspi-jtag-hat*

dist/bootfs.zip: bootfs
	mkdir -p $(@D)
	cd boot/bootfs && zip ../../dist/bootfs.zip *

clean:
	rm -rf dist
	rm -rf gerbers
	cd boot && make clean

.PHONY: all dist gerbers bootfs clean
