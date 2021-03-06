LDLIBS = -lsodium

SRCDIR = src
VPATH = $(SRCDIR)

IDIR = $(SRCDIR)
CFLAGS=-g -I $(IDIR) -Werror -Wall -Wextra -std=c99 -pedantic

ODIR=build

DEPS = $(IDIR)/box-stream.h

OBJ = $(ODIR)/box-stream.o $(ODIR)/test.o

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

test: $(OBJ)
	cc $(LDLIBS) -o $@ $^ $(CFLAGS) $(LIBS)

example: src/example.c src/box-stream.c
	cc $(LDLIBS) -o example src/example.c src/box-stream.c

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o test example
