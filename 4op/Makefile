PY = python3

all: auto.py coder.py macros.i
	$(PY) $< > RESULT_LOG.txt

coder_%.py: coder.py
	$(PY) $^ $* > $@
meta_%.bin: meta_%.S test.c
	$(CC) $(CFLAGS) $^ -o $@ -DNAME=$* -DINSTR=512


include ../common/make.mk