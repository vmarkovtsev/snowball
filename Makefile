snowball_sources= \
  src_c/stem_UTF_8_english.c \
  src_c/stem_UTF_8_french.c \
  src_c/stem_UTF_8_russian.c \
  runtime/api.c \
  runtime/utilities.c \
  libstemmer/libstemmer_utf8.c

snowball_headers= \
  src_c/stem_UTF_8_english.h \
  src_c/stem_UTF_8_french.h \
  src_c/stem_UTF_8_russian.h \
  include/libstemmer.h \
  libstemmer/modules_utf8.h \
  runtime/api.h \
  runtime/header.h

CFLAGS=-Iinclude -O2 -march=native -Wall -Werror
all: libstemmer.o stemwords usage
libstemmer.o: $(snowball_sources:.c=.o)
	$(AR) -cru $@ $^
stemwords: examples/stemwords.o libstemmer.o
	$(CC) $(CFLAGS) -o $@ $^
usage: examples/usage.o libstemmer.o
	$(CC) $(CFLAGS) -o $@ $^
clean:
	rm -f stemwords *.o src_c/*.o runtime/*.o libstemmer/*.o
