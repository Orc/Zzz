BINDIR=/usr/bin
MAN8DIR=/usr/share/man/man8
INSTALL=install

Zzz:  Zzz.c
	cc -o Zzz Zzz.c -framework IOKit

install: Zzz
	$(INSTALL) -c -m 511 Zzz $(BINDIR)
	$(INSTALL) -c -m 644 Zzz.8 $(MAN8DIR)
