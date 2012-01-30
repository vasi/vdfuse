CC = clang
VBOXLIBDIR = /Applications/VirtualBox.app/Contents/MacOS
VBOXLIBNAMES = VBoxDDU
FUSELIBS = -lfuse_ino64

INCLUDES = -I include
VBOXLIBS = $(foreach lib,$(VBOXLIBNAMES),$(VBOXLIBDIR)/$(lib).dylib)
LIBS = $(VBOXLIBS) $(FUSELIBS)

COMPILE = $(CC) -c $(CFLAGS) $(INCLUDES)
LINK = $(CC) $(LDFLAGS) $(LIBS)

all: vdfuse

vdfuse: vdfuse.o
	$(LINK) -o $@ $^

%.o: %.c
	$(COMPILE) -o $@ $<

.PHONY: all

clean:
	rm -f *.o vdfuse
