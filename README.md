# xclannad-gbk_fork
Try to merge and repair xclannad GBK version from MiNE (面包工坊mine模拟器) and xclannad-0.07h

## Copyright  
```
xclannad (RealLive for X) version. 0.07h
Copyright (C) 2004-2008  Kazunori Ueno(JAGARL)
<jagarl@creator.club.ne.jp> 
```

## Branches (xclannad_merge is the main branch)      
* (use this, for Seen.old) gdb --args /home/wmt/work_xclannad/xclannad-0.07h/xclannad -r .  
* (chinese, for SEEN.txt, FV version) /home/wmt/work_xclannad/xclannad_merge/xclannad -r .  
* (not good, color bad) /home/wmt/work_xclannad/xclannad-0.07_ONScripter-CN_compare/xclannad -r .  

## References  
* http://www.creator.club.ne.jp/~jagarl/xclannad.html
* https://web.archive.org/web/20100331135549/http://www.creator.club.ne.jp/~jagarl/xclannad.html
* https://github.com/natdon/ONScripter-CN/tree/master/jni/app_xclannad/xclannad-0.07
* https://github.com/Mysterious-tk/onscripter-for-iOS-GBK/tree/master/xclannad  
* https://github.com/toktc/onscripter-for-iOS-GBK/tree/master/xclannad
* https://github.com/weimingtom/xclannad_fork
* https://code.google.com/archive/p/clannad-fullvoice-simplechinsese-patch/downloads
* https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/clannad-fullvoice-simplechinsese-patch/CLANNAD_FV_2.0.rar  

## script loading test  
* https://github.com/weimingtom/xclannad-gbk_fork/blob/master/xclannad_merge/scn2k/test.cc  
* https://github.com/weimingtom/xclannad-gbk_fork/blob/master/xclannad_merge/scn2k/Makefile  
make test  

## script debugging output  
* search '-> fall back to'
* work_xclannad_v2_chinese_good.tar.gz, aaa.txt
* search ' - cmd', toggle debug_flag = true, see scn2k/scn2k_cmd.cc  
```
bool debug_flag = true; //FIXME:
//bool debug_flag = false;
void dprintf(const char* fmt, ...) {
	if (debug_flag) {
		va_list ap; va_start(ap, fmt);
		vprintf(fmt, ap);
		va_end(ap);
	}
}
```
* https://github.com/weimingtom/xclannad-gbk_fork/blob/master/xclannad-0.07h/scn2k/scn2k_cmd.cc  
* https://github.com/weimingtom/xclannad-gbk_fork/blob/master/xclannad_merge/scn2k/scn2k_cmd.cc  

## code page, cp936    
* font/codeconv.cc
* https://github.com/weimingtom/xclannad-gbk_fork/blob/master/xclannad_merge/font/codeconv.cc  

## weibo record  
```
我试下编译xclannad，发现ubuntu和windows下都很容易编译，
但只能在ubuntu成功运行，在windows下会有问题，
而且不能运行clannad FV版（全语音版），
只能运行初回版（无语音版）[喵喵]，
应该是因为seen.txt的结构不一样 ​​​

另外xclannad跟xkanon的代码是不一样的，xkanon似乎要更麻烦，
暂时还找不到运行方法 ​​​

xCLANNAD for Linux 中文版 - CSDN博客
https://blog.csdn.net/luozhuang/article/details/8644846  

貌似xclannad和xkanon是用于NetBSD/dreamcast上，
是有实际意义的（在主机上连电视机玩） ​​​

在vmware+ubuntu下面玩xclannad非常方便，只要加载个iso或者
加载个虚拟光驱就可以了，完全不用拷贝什么文件（需要在命令行
中指定光驱挂载的路径），可惜xkanon不行，不知道是不是游戏的
版本不对（xkanon支持air和kanon）

经过漫长的调试，发现xkanon还是无法启动，好像是因为seen.txt
解释执行时出问题（也可能是因为别的原因，但大致是在执行脚本
引擎死循环的过程中跳出循环的），网上有人说xkanon适用的数据文件
是打过补丁的，不知道是不是我没按照正常的步骤做导致的。。。
还有一种方法，就是使用自带的dump程序排除错误
（xclannad也有类似的东西，单纯解释脚本），完全不涉及UI，
不过我试过还是会崩溃，可能这部分代码也是年久失修的。。。

好像xclannad有一个独立程序可以把seen.txt的内容
dump出来（几十MB的文本），回去试试能不能用这种
方法比对一下看windows为什么会运行失败。。。

昨天改了一个上午的xclannad，今天用vs2013跑，
还是崩了[允悲]，让我静一下想想哪里不对了 ​​​

终于在vs2013上跑通了xclannad的启动菜单，方法是vc会std::vector
下标越界错误时终止运行，而gcc不会，我在代码中判断越界，
然后在越界时读取std::vector修改前的副本变量（在可能修改std::vector
内容的地方用代码把vector保存到一个全局vector变量中）。
另外还有一个不兼容vc的地方，open函数需要使用O_BINARY开关以
保证读取的二进制数据不会夹杂多余的回车字节

xclannad windows版，把所有std::vector出现越界情况的代码全部换成函数调用，
然后在里面做越界判断，现在可以进游戏界面了，可喜可贺

已经可以在win 7下运行xkanon-gtk2了（其实跟gtkmm没什么关系，只是跟gtk2有关），
用codelite编译成调试版，在调试模式下改了几个地方
（类似之前xclannad的二进制读文件问题修改的地方），效果还不错。
如果没问题的话考虑编译gtk2（因为现在用的只是cygwin上面的mingw64版的gtk动态库），
尽可能迁移到vc6或者vc2010上，方便调试（codelite也可以，
不过codelite很耗内存，调试倒是比vs方便）

因为之前已经有移植xclannad、xkanon和kirikiroid2的经验，
我打算基于这三者的经验去移植rlvm到vs2010，虽然rlvm的代码依赖比较多，
但作者把某些依赖直接以源码形式放在代码基中（例如SDL_image之类），
所以实际需要单独编译的依赖并不多。也因为如此，rlvm搞得很复杂，
例如广泛使用boost，我觉得这样不妥，因为boost的恶名不好听，我还是找机会去掉它。。。

树莓派如果能跑视觉小说游戏模拟器（例如xclannad、onscripter之类），
其实也是蛮不错的，理由是——树莓派插u盘的效果跟vmware虚拟ubuntu插iso光驱一样，
直接挂接在某个路径上（/media下），然后指定命令行参数即可，
跟ubuntu一个样子。不玩的时候把u盘拔掉即可，不占用空间 

老实说我之前改xclannad和xkanon都能改得下去，
为什么裁剪SDL会觉得更吃力？感觉心很累，越是想要的东西越是得不到 ​​​

在xubuntu20上编译运行xclannad的效果（我以前试过在Windows上跑，这次改成用linux跑），
目前只能跑日本语版。其实我是想弄中文的，没成功——因为我没找到可用的文件，
估计怕被人提文本所以应该比较难找到，待考（不过能跑原版其实就足够了）。
至于这玩意要怎么编译，只能说要改很多地方，因为代码写得不咋的

xclannad的中文我也搞出来了，我的天，其实就是GBK来着，
之前显示不出来是因为转换gbk2unicode的代码有问题，
可以通过debug_flag=true打开调试输出重定向到文件，
然后就能猜测到具体字符集了（原版是sjis，FV中文版是gbk），
然后改转换函数即可（我参考的版本是转两次，改成转一次就正确了），
有时间试试整个换成FV版看能不能正常运行（目前我测试的数据并非FV版）

我试过用加了GBK转换的xclannad运行CLANNAD FV全语音GBK版也是可以的，
效果如下，patch来源这个工程：clannad-fullvoice-simplechinsese-patch
（我用的是默示版的clannad fv，但原版应该是这个patch，
默示版相当于patch之后的结果），还是有很多fall back错误，
不过似乎勉强可以使用（可能加载保存有问题）

或者更准确的说法，面包工坊mine源代码里面的xclannad应该是不能直接运行GBK版
的clannad fv（或者是替换了GBK SEEN.txt的默示版），
需要改一下代码中字符转换函数，直接执行gbk2unicode即可
（去掉前一个双字节字符转换操作） ​​​

这个CLANNAD_FV_2.0.rar，应该就是上次说的GBK版clannad fv gbk patch的出处，
都十几年前了，如果能提供相关工具就好了，不过不可能——因为这种
patch本质上和做游戏差不多，都是不想人看到里面的内容，
或者看了也很难改。另外我有点怀疑steam版可能也是和FV版类似，待考 

入手了steam版的CLANNAD HD版，带中文，它和FV版在游戏本体上大致一样
（但把人物姓名放到对话框上方，右侧小按钮有点不同），
而一些零碎的地方例如上下文菜单、设置、保存加载、
甚至主菜单都重新做了，有所不同（主菜单的姓名设置没了），
引擎应该也是SiglusEngine，看来steam上的移植版基本都是用这个引擎

ubuntu14下勉强能把xsystem35 1.7.3pre5的字体弄出来
（可能根据字体不同有些字仍然显示不出），
方法是在命令行后面加上这样的参数：
./xsystem35 -devfont ttf -ttfont_gothic msgothic.ttc，
至于这个ttc或者ttf字体需要自己去找一个，这个开源项目应该不提供，
类似的情况xclannad的字体也是要自己找（我用了类似的字体）
```
