BINDIR=/usr/bin
MAN8DIR=/usr/share/man/man8

Zzz:  Zzz.c
	cc -o Zzz Zzz.c -lIOKit

install: Zzz
	install -c -m 511 Zzz $(BINDIR)
	install -c -m 644 Zzz.8 $(MAN8DIR)
