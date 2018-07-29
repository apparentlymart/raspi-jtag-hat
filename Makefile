
# This Makefile exists primarily for the author's benefit in creating all of
# the artifacts that get attached to a tagged release. If you just want to look
# at the design files, the .pro file can be loaded directly into KiCad without
# any need to do anything with this Makefile.

all: dist

dist: dist/gerbers.zip dist/bootfs.zip dist/preview.png

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

gerbv: gerbers
	gerbv \
		gerbers/raspi-jtag-hat-EdgeCuts.gm1 \
		gerbers/raspi-jtag-hat.drl \
		gerbers/raspi-jtag-hat-SilkTop.gto \
		gerbers/raspi-jtag-hat-MaskTop.gts \
		gerbers/raspi-jtag-hat-CuTop.gtl \
		gerbers/raspi-jtag-hat-CuBottom.gbl \
		gerbers/raspi-jtag-hat-MaskBottom.gbs \
		gerbers/raspi-jtag-hat-SilkBottom.gbo \

dist/preview.png: gerbers
	gerbv \
		-o $@ \
		--export=png --antialias -D 500 \
		-f \#000000ff \
		-f \#000000ff \
		-f \#ffffffff \
		-f \#b87333ff \
		-f \#3f601eff \
		-b \#4A7023 \
		gerbers/raspi-jtag-hat-EdgeCuts.gm1 \
		gerbers/raspi-jtag-hat.drl \
		gerbers/raspi-jtag-hat-SilkTop.gto \
		gerbers/raspi-jtag-hat-MaskTop.gts \
		gerbers/raspi-jtag-hat-CuTop.gtl

.PHONY: all dist gerbers bootfs clean gerbv
