default: geoiplookupcc

VERSION=0.2

BIN=geoiplookupcc \
        geoipupdate.sh

SRC=geoiplookupcc.c \
        geoipupdate.sh

MISC=Makefile

install: default
	install $(BIN) /usr/bin

dist:
	mkdir geoiplookupcc-$(VERSION)
	cp $(MISC) $(SRC) geoiplookupcc-$(VERSION)
	tar -czf geoiplookupcc-$(VERSION).tar.gz geoiplookupcc-$(VERSION)
	rm -rf geoiplookupcc-$(VERSION)

geoiplookupcc: geoiplookupcc.c
	gcc -lGeoIP geoiplookupcc.c -o geoiplookupcc

