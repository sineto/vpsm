PREFIX ?= /usr/local

.PHONY: all
all:
	@echo 'nothing to do.'

.PHONY: man
man: man/vpsm.1
man/vsv.8: man/vpsm.md
	go-md2man -in $^ -out $@

.PHONY: clean
clean:
	rm -f man/vpsm.1

.PHONY: install
install:
	cp vpsm $(PREFIX)/bin/vpsm
	cp man/vpsm.1 $(PREFIX)/share/man/man1/vpsm.1

.PHONY: uninstall
uninstall:
	rm -f $(PREFIX)/bin/vpsm
	rm -f $(PREFIX)/share/man/man1/vpsm.1
