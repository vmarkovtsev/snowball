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

CPPFLAGS=-O2 -march=native -Wall -Werror -I/usr/local/include -L/usr/local/lib
CFLAGS=-Iinclude
all: libstemmer.o stemwords usage tokenize
libstemmer.o: $(snowball_sources:.c=.o)
	$(AR) -cru $@ $^
stemwords: examples/stemwords.o libstemmer.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^
usage: examples/usage.o libstemmer.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^
tokenize: examples/tokenize.cc
	$(CXX) $(CPPFLAGS) -lunistring examples/tokenize.cc -o tokenize
clean:
	rm -f stemwords *.o src_c/*.o runtime/*.o libstemmer/*.o
