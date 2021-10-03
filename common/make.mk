CC = gcc
CFLAGS = -O3 -march=native -mtune=native -mcpu=native -I$(COMMON)

AARCH := $(shell uname -m)
ifeq ($(AARCH),armv7l)
	CFLAGS += -mfpu=neon -marm
endif

COMMON = ../common/
TESTOBJ = test.c
# Source code for test.c to prevent NAME undefined

%.test: %.o $(TESTOBJ)
	$(CC) $(CFLAGS) -o test_$*.bin $^ -DNAME=$*
	@./test_$*.bin

%.debug: %.o $(TESTOBJ)
	$(CC) $(CFLAGS) -o test_$*.bin $^ -DNAME=$* -DDEBUG
	@./test_$*.bin > DEBUG_$*.log


%.o: %.c
	@$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.S
	@$(CC) $(CFLAGS) -o $@ -c $<

.PRECIOUS: %.o
.PHONY: clean
clean:
	-rm -f *.bin *.o *.out
	-rm -f meta_* RESULT_*