#include <stdio.h>
#include "libstemmer.h"

int main() {
  struct sb_stemmer * stemmer = sb_stemmer_new("ru", NULL);
  const char *stem = (const char *)sb_stemmer_stem(stemmer, (const sb_symbol *)"кошки", 10);
  printf("%s\n", stem);
  sb_stemmer_delete(stemmer);
  return 0;
}
