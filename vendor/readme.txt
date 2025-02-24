
--
sudo apt install libsdl1.2-dev

dpkg -L libsdl1.2-dev
/.
/usr
/usr/bin
/usr/bin/sdl-config
/usr/include
/usr/include/SDL
/usr/include/SDL/SDL.h


--

sudo apt install libfreetype-dev

--
dpkg -L libfreetype-dev

/usr/include/freetype2/freetype/fttrigon.h
/usr/include/freetype2/freetype/fttypes.h
/usr/include/freetype2/freetype/ftwinfnt.h
/usr/include/freetype2/freetype/t1tables.h
/usr/include/freetype2/freetype/ttnameid.h
/usr/include/freetype2/freetype/tttables.h
/usr/include/freetype2/freetype/tttags.h
/usr/include/freetype2/ft2build.h


-----

sudo apt install libsdl-mixer1.2-dev
/.
/usr
/usr/include
/usr/include/SDL
/usr/include/SDL/SDL_mixer.h


-----

sudo apt install libvorbis-dev libogg-dev
sudo apt install libvorbisfile3


why????
!!!!!!!!!!!!!!NEED TO mod config.h:

/* Define to 1 if you have the `vorbis' library (-lvorbis). */
/* #undef HAVE_LIBVORBIS */
#define HAVE_LIBVORBIS 1

/* Define to 1 if you have the `vorbisfile' library (-lvorbisfile). */
/* #undef HAVE_LIBVORBISFILE */
#define HAVE_LIBVORBISFILE 1

/* Define to 1 if you have the `vorbisidec' library (-lvorbisidec). */
/* #undef HAVE_LIBVORBISIDEC */
#define HAVE_LIBVORBISIDEC 1
-----




How to Run: !!!!!!!!!need to copy msgothic.ttc
 
***need*** to copy msgothic.ttc to [040428][VisualArt's][Key][Clannad]
then run:
cd xxxClannad
/home/wmt/work_xclannad/xclannad-0.07h/xclannad -r .

wmt@wmt-VirtualBox:~/work_xclannad/[040428][VisualArt's][Key][Clannad]$ /home/wmt/work_xclannad/xclannad-0.07h/xclannad -r .

----
cd ../\[040428\]\[VisualArt\'s\]\[Key\]\[Clannad\]/
(use this, for Seen.old) gdb --args /home/wmt/work_xclannad/xclannad-0.07h/xclannad -r .
(chinese, for SEEN.txt, FV version) /home/wmt/work_xclannad/xclannad_merge/xclannad -r .
(not good, color bad) /home/wmt/work_xclannad/xclannad-0.07_ONScripter-CN_compare/xclannad -r .




kidoku marker 6
"�����c"
 0x23 - cmd 00-03:0011:00[ 0] 


