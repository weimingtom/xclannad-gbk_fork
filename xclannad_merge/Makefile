
CC		= gcc
CXX		= g++
LD		= g++
RANLIB		= ranlib

LOCAL_DEF= -I/usr/include/SDL -Wno-narrowing -fpermissive -I/usr/include/freetype2
CFLAGS= -I. $(LOCAL_DEF) -g3 -ggdb -O0 -DHAVE_CONFIG_H     -pthread
CXXFLAGS	= $(CFLAGS)
LDFLAGS =    -lSDL_mixer -lSDL -lfreetype   -lX11 -lXext -L/usr/X11R6/lib -ljpeg -lpng -lz   -lX11 -lXext -L/usr/X11R6/lib -pthread -lvorbisfile

SRCS	= xlovesys.cc

OBJS	 = ${SRCS:.cc=.o}

all: xclannad

xclannad: xlovesys.o system/libsystem.a scn2k/libscn2k.a window/libwindow.a font/libfont.a music2/libmusic.a
	$(LD) -o xclannad xlovesys.o system/libsystem.a scn2k/libscn2k.a window/libwindow.a font/libfont.a music2/libmusic.a $(LDFLAGS)

install: xclannad music2/nwatowav
	mkdir -p /usr/local/bin
	cp xclannad music2/nwatowav /usr/local/bin

clean:
	rm -f xclannad xlovesys ${OBJS} *.bak
	(cd font && $(MAKE) clean);
	(cd system && $(MAKE) clean);
	(cd window && $(MAKE) clean);
	(cd music2 && $(MAKE) clean);
	(cd scn2k && $(MAKE) clean);

music2/nwatowav:
	(cd music2 && $(MAKE) nwatowav);

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CFLAGS) -o $@ $<

font/libfont.a: FORCE
	cd font && $(MAKE) libfont.a

system/libsystem.a: FORCE
	cd system && $(MAKE) libsystem.a

scn2k/libscn2k.a: FORCE
	cd scn2k && $(MAKE) libscn2k.a

window/libwindow.a: FORCE
	cd window && $(MAKE) libwindow.a

music2/libmusic.a: FORCE
	cd music2 && $(MAKE) libmusic.a

FORCE:

