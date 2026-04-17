SAMPLE ?= hello

.PHONY: help doctor tools-native lib sample clean

help:
	@echo "Targets:"
	@echo "  make doctor                  # check Linux + Wine prerequisites"
	@echo "  make tools-native            # build native binsrc tools and copy to bin/"
	@echo "  make lib                     # build libsrc using Wine + NMAKE"
	@echo "  make sample SAMPLE=<name>    # build sample via Wine + NMAKE"
	@echo "  make clean SAMPLE=<name>     # clean sample artifacts"

doctor:
	./scripts/linux/doctor.sh

tools-native:
	$(MAKE) -C binsrc copy-to-bin

lib:
	./scripts/linux/nmake.sh /nologo /f libsrc\\makefile

sample:
	./scripts/linux/build-sample.sh "$(SAMPLE)"

clean:
	./scripts/linux/build-sample.sh "$(SAMPLE)" clean
