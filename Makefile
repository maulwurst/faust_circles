#
# Makefile
#

include ../circle-stdlib/Config.mk

CIRCLEHOME = ../circle-stdlib/libs/circle
NEWLIBDIR = ../circle-stdlib/install/$(NEWLIB_ARCH)

OBJS	= main.o kernel.o simple.o faust.o

include $(CIRCLEHOME)/Rules.mk

CFLAGS += -I "$(NEWLIBDIR)/include" -I $(STDDEF_INCPATH) -I ../circle-stdlib/include
LIBS   := "$(NEWLIBDIR)/lib/libm.a" "$(NEWLIBDIR)/lib/libc.a" "$(NEWLIBDIR)/lib/libcirclenewlib.a" \
	  $(CIRCLEHOME)/lib/usb/libusb.a \
	  $(CIRCLEHOME)/lib/usb/gadget/libusbgadget.a \
	  $(CIRCLEHOME)/lib/input/libinput.a \
	  $(CIRCLEHOME)/lib/fs/libfs.a \
	  $(CIRCLEHOME)/lib/sound/libsound.a \
	  $(CIRCLEHOME)/lib/libcircle.a

%.cpp: %.dsp
	faustpp -X-vec -DIdentifier=$(patsubst %.dsp,%,$^) -a generic.cpp $^ > $@.tmp && mv $@.tmp $@

%.hpp: %.dsp
	faustpp -X-vec -DIdentifier=$(patsubst %.dsp,%,$^) -a generic.hpp $^ > $@.tmp && mv $@.tmp $@

-include $(DEPS)
