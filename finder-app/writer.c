#include <syslog.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
  openlog(NULL, 0, LOG_USER);

  if (argc != 3) {
    syslog(LOG_ERR, "Wrong number of arguments. Usage: %s <FILE> <STR>", argv[0]);
    closelog();
    return 1;
  }

  FILE *f = fopen(argv[1], "w");
  if (f == NULL) {
    syslog(LOG_ERR, "Cannot open %s for writing", argv[1]);
    closelog();
    return 1;
  }

  syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
  fprintf(f, "%s\n", argv[2]);
  fclose(f);

  closelog();
  return 0;
}
