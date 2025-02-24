
CC		= gcc
CXX		= g++
LD		= gcc
AR		= ar
RANLIB		= ranlib

LOCAL_DEF= -I/usr/include/SDL -Wno-narrowing -fpermissive -I/usr/include/freetype2
CFLAGS= -I.. $(LOCAL_DEF) -g3 -ggdb -O0 -DHAVE_CONFIG_H  -pthread
CXXFLAGS	= $(CFLAGS)
LDFLAGS =   -ljpeg -lpng -lz   -lX11 -lXext -L/usr/X11R6/lib -pthread

SRCS	 = font_face.cc \
	   font_peer_fn.cc \
	   font_peer_ft2.cc \
	   font_peer_x11.cc \
	   font_layout.cc \
	   codeconv.cc \
	   cp936.cc \
	   text_stream.cc \
#	   render.c

OBJS	 = ${SRCS:.cc=.o}

all: libfont.a

libfont.a: ${OBJS}
	rm -f libfont.a
	${AR} clq libfont.a ${OBJS}
	$(RANLIB) libfont.a

clean:
	rm -f libfont.a ${OBJS} *.bak *.core

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CFLAGS) -o $@ $<

