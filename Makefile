obj-m	:= samsung-backlight.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD)

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers

install:
	mkdir -p /lib/modules/`uname -r`/kernel/drivers/staging/samsung-laptop
	cp samsung-backlight.ko /lib/modules/`uname -r`/kernel/drivers/staging/samsung-laptop/
	depmod -a
