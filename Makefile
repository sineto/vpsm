PREFIX ?= /usr/local
DESTDIR=

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
	install -Dm4755 vpsm $(DESTDIR)$(PREFIX)/bin/vpsm
	install -Dm644 man/vpsm.1 $(DESTDIR)/$(PREFIX)/share/man/man1/vpsm.1

.PHONY: uninstall
uninstall:
	rm -f $(PREFIX)/bin/vpsm
	rm -f $(PREFIX)/share/man/man1/vpsm.1
