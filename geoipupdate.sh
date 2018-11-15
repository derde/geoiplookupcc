#! /bin/bash

# Get an updated GEOIP lite file from the kind folks at maxmind
# Don't do this unless the one we have is a week old

LOCATIONS="
/var/lib/GeoIP/GeoIP.dat
/usr/share/GeoIP/GeoIP.dat
/usr/local/share/GeoIP/GeoIP.dat
"
for DATAFILE in $LOCATIONS ; do
  [ -f $DATAFILE ] || continue
  find $DATAFILE -maxdepth 0 -mtime +7 | grep . || continue
  curl http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz > $DATAFILE.gz &&
    gzip -d < $DATAFILE.gz > $DATAFILE
done

