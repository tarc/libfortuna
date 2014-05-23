#ifndef PG_PORT_H
#define PG_PORT_H

#include <stdint.h>

int gettimeofday(struct timeval * tp, struct timezone * tzp);

int pg_strcasecmp(const char *s1, const char *s2);

int pg_strncasecmp(const char *s1, const char *s2, size_t n);

#endif // PG_PROT_H
