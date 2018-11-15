/*
 * A simpler lookup than ships with geoIP, which does at least print usage
 * information.
 */

#include <stdio.h>
#include <GeoIP.h>

int main (int argc, char *argv[]) {
  GeoIP * gi;
  char * code;
  if (argc<2) {
    fprintf(stderr,"Usage: %s IP\n",argv[0]);
    return 1;
  }
  gi = GeoIP_new(GEOIP_STANDARD);
  code = (char *)GeoIP_country_code_by_name(gi, argv[1]);
  if (code==NULL) code="??";
  printf("%s\n", code);
}

