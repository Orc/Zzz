Zzz:  Zzz.c
	cc -o Zzz Zzz.c -lIOKit

install: Zzz
	install -c -m 511 Zzz /usr/bin
	install -c -m 644 Zzz.8 /usr/share/man/man8
