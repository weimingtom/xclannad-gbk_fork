
CC		= gcc
CXX		= g++
LD		= g++
AR		= ar
RANLIB		= ranlib

LOCAL_DEF= -I/usr/include/SDL -Wno-narrowing -fpermissive -I/usr/include/freetype2
CFLAGS= -I.. $(LOCAL_DEF) -g3 -ggdb -O0 -DHAVE_CONFIG_H -pthread
CXXFLAGS	= $(CFLAGS)
LDFLAGS =  -ljpeg -lpng -lz   -lX11 -lXext -L/usr/X11R6/lib -pthread

SRCS	 = file.cc \
	   system_config.cc

OBJS	 = ${SRCS:.cc=.o}

all: visarc libsystem.a

libsystem.a: ${OBJS}
	rm -f libsystem.a
	${AR} clq libsystem.a ${OBJS}
	$(RANLIB) libsystem.a

visarc: visarc.o libsystem.a
	$(LD) -o visarc visarc.o libsystem.a $(LDFLAGS)

clean:
	rm -f visarc libsystem.a ${OBJS} *.bak *.o

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CFLAGS) -o $@ $<

