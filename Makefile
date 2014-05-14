CFLAGS=-fobjc-arc -Ivendor/Aspects -Ivendor/CPDColors/Code
FRMWRKS=-framework AppKit -framework Foundation -undefined dynamic_lookup
OBJS=DecksetInject.o vendor/CPDColors/Code/CPDColors.o vendor/Aspects/Aspects.o

.PHONY: all build run clean

all: build run

build: $(OBJS)
	clang $(FRMWRKS) -o DecksetInject.dylib -dynamiclib $(OBJS)

run:
	DYLD_INSERT_LIBRARIES=$(CURDIR)/DecksetInject.dylib \
					/Applications/Deckset.app/Contents/MacOS/Deckset &

clean:
	rm -f DecksetInject.dylib *.o
