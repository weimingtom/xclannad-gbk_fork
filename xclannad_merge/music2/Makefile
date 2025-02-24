LOCAL_DEF= -I/usr/include/SDL -Wno-narrowing -fpermissive -I/usr/include/freetype2
CFLAGS= -I.. $(LOCAL_DEF) -g3 -ggdb -O0 -DHAVE_CONFIG_H  -pthread
CXXFLAGS	= $(CFLAGS)


CC              = gcc
CXX             = g++
LD              = g++
AR              = ar
RANLIB          = ranlib

all: libmusic.a nwatowav

@AUDIO_IO@.o: @AUDIO_IO@.c @ALSAMIX_H@

libmusic.a: config.h music.o koedec.o koedec_ogg.o wavfile.o movie.o nwatowav.o
	rm -f libmusic.a
	$(AR) clq libmusic.a music.o koedec.o koedec_ogg.o wavfile.o movie.o nwatowav.o
	$(RANLIB) libmusic.a

nwatowav: nwatowav.cc
	$(LD) -o nwatowav -DUSE_MAIN nwatowav.cc

config.h:
	ln -s ../config.h .

clean:
	rm -f *.o *.a *.core *.bak config.h nwatowav

