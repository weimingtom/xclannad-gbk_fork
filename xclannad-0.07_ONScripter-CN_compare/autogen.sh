#!/bin/sh
autoheader259
aclocal19 -I . -I /usr/local/share/aclocal
autoconf259
# gcc 3.0.2 �Ѥν���
# gtkmm �� autoconf ���Ѥǥ��顼���Ф�Τ�
# ����Ū�˥��顼�θ��ˤʤ�Ԥ���
#sed -e 's/^extern "C" void exit(int);//' -e "s/',//" configure > configure.new
#cp configure.new configure
#rm -f configure.new
./configure $*
