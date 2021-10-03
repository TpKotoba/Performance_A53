PY = python3

meta_%_IND3.S: IND3.py
	$(PY) $^ $* > meta_$*_IND3.S
meta_%_DRN3.S: DRN3.py
	$(PY) $^ $* > meta_$*_DRN3.S
meta_%_DRM3.S: DRM3.py
	$(PY) $^ $* > meta_$*_DRM3.S
meta_%_DRD3.S: DRD3.py
	$(PY) $^ $* > meta_$*_DRD3.S

meta_%.bin: test.c meta_%.S
	$(CC) $(CFLAGS) $^ -o $@ -DNAME=$* -DINSTR=512


include ../common/make.mk