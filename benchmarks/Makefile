#CC = g++
CC = gcc

CFLAGS = -g -Wall

#all: float_add float_div float_mult float_sub int_add int_div int_mult int_sub
INTSRCS := $(wildcard int/*.c)
INTBINS := $(INTSRCS:%.c=%)
FLOATSRCS := $(wildcard float/*.c)
FLOATBINS := $(FLOATSRCS:%.c=%)
all: ${INTBINS} ${FLOATBINS}

%: %.o
	${CC} -lm $< -o $@
	
%.o: %.c
	${CC} ${CFLAGS} $<

clean:
	rm -rvf int/*.o ${INTBINS}
	rm -rvf float/*.o ${FLOATBINS}
