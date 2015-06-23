PREFIX=/usr
BINDIR=$(DESTDIR)$(PREFIX)/bin
MAN8DIR=$(DESTDIR)$(PREFIX)/share/man/man8
INSTALL=install

Zzz:  Zzz.c
	cc -o Zzz Zzz.c -framework IOKit

install: Zzz
	$(INSTALL) -d $(BINDIR) $(MAN8DIR)
	$(INSTALL) -c -m 511 Zzz $(BINDIR)
	$(INSTALL) -c -m 644 Zzz.8 $(MAN8DIR)
