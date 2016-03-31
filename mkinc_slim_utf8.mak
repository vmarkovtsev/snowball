# libstemmer/mkinc_utf8.mak: List of stemming module source files
#
# This file is generated by mkmodules.pl from a list of module names.
# Do not edit manually.
#
# Modules included by this file are: danish, dutch, english, finnish, french,
# german, hungarian, italian, norwegian, porter, portuguese, romanian,
# russian, spanish, swedish, turkish

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

