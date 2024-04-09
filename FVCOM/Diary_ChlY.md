## FVCOM

### fvcom中 STATION_FILE 的文件格式

总共包含5列， 分别为 序号，经度，纬度，节点编号，水深，站点名称；格式样例如下：

> No      X    Y   Node (Cell)  dep    Station Name \
> 1     121.903 37.464 31535 13.41 'weihai_beihai' \
> 2     121.996 37.491 31498 10.67 'weihai_xiaoshidao' \
> 3     122.241 37.444 31370 13.18 'weihai_weihaiwan' \
> 4     122.553 37.094 31031 24.05 'weihai_sanggouwan' 

### gcc编译fvcom的编译参数

> gcc编译时，按下面的参数配置可以编译通过：
> 另外，编译libs时如果出现错误，可以逐个模块的编译，不必统一编译，只要都最后安装到libs/install目录中即可
> libs中的netcdf可以不用编译，所以makefile 中关于netcdf的内容可以注释掉
> FC=mpif90
> OPT=-ffree-form -cpp -O3
> 改这两项就够了，其他的保持原来的内容

> 另外，在fvcom源码中的字符数组声明
> 例如  character(len=80), dimension(n_bed_chars) :: bed_snames = (/"bed_thick","bed_age","bed_por"/) 
> 编译时会报错，改为如下形式即可：
> character(len=80), dimension(n_bed_chars) :: bed_snames = [character(len=80) :: "bed_thick","bed_age","bed_por"]

### 在Centos7上编译Fvcom4.1

 在Centos7上编译Fvcom4.1，出现如下错误： 

>    mod_prec.f90(1): error #5082: Syntax error, found '/' when expecting one of: <LABEL> <END-OF-STATEMENT> ; BLOCK BLOCKDATA PROGRAM MODULE TYPE INTEGER REAL ...

修改make.inc文件内容：

> CPP    = /usr/bin/cpp \
> COMPILER = -DIFORT \ 
> CC    = mpicc \
> CXX    = mpicxx \
> CFLAGS  = -O3 \
> FC    = mpif90 \
> OPT    = **-cpp** -O3 


编译通过(已测试，好用)。

> 另外，如果使用gcc，gfortran编译器，在make.inc中，DEF_FLAGS一行的末尾，
> 添加 -nostdinc -E 参数，也可以(该方式没做测试)
> 其中：
>  -nostdinc ：不要搜索标准系统头文件目录，仅搜索-I指定的路径 
> -E ： ？？？

在intel2019中（待验证）：

>  **修改make.in文件,在-traditional后面加-ffreestanding** \
> PREPROCESSOR OPTIONS FOR CPP \
> DEF_FLAGS = -P -C -traditional **-ffreestanding** 


###  FVCOM的编译过程

>  FVCOM相关基础环境的安装部署及FVCOM的编译经历了相当曲折的过程，在此简单总结一下。
本次编译的FVCOM版本为3.1.6。最开始准备的环境是：
> CentOS7，IntelParallelStudioXE2015，
> openmpi-1.4.2，curl-7.24.0，netcdf-3.6.2，
> zlib-1.2.6，hdf5-1.8.8。
> 经过N多次的反复调整、反复重装，浪费了N多的脑细胞也没能搞定，最终的问题都是提示FVCOM的源码中有语法错误。 
> 后经过多方咨询，反馈结果可归纳为两条：
> 1. CentOS7版本不兼容（一说需要打补丁，一说版本太高与FVCOM不兼容）；
> 2. 2.IntelParallelStudioXE2015中ifort存在bug。

> 根据以上两条进行了CentOS6.7、7 与IntelParallelStudioXE2013、2015的交叉环境测试，基本组合情况如下：
> 1. CentOS7+IntelParallelStudioXE2015（不打补丁）：
> 编译FVCOM中libs时，如果包含netcdf部分，则会出现编译错误，FVCOM不能继续编译；
> 如果不包含netcdf部分，则可成功编译libs部分，编译FVCOM时提示源码中存在语法错误。
> 2. CentOS7+IntelParallelStudioXE2015（打补丁）：
> 编译FVCOM中libs时，成功编译libs部分（不论是否包含netcdf部分），
> 编译FVCOM时提示源码中存在语法错误。
> 3. CentOS7+IntelParallelStudioXE2013：
> 编译FVCOM中libs时，成功编译libs部分（不论是否包含libs部分），
> 编译FVCOM时提示源码中存在语法错误。
> 4. CentOS6.7+IntelParallelStudioXE2015：
> 编译FVCOM中libs时，成功编译libs部分（不论是否包含netcdf部分），
> 编译FVCOM时提示缺少变量声明，变量名称中有“mpif90”字样
> （该错误是在编译大约5分钟之后出现，相比CentOS7+IntelParallelStudioXE2015组合的最初编译即报错有一定进步）。
> 5. CentOS6.7+IntelParallelStudioXE2013（不论是否打补丁）：
> 编译FVCOM中libs顺利通过（不论是否包含netcdf部分），FVCOM成功编译。

> 根据以上的测试结果，在thinkpad E325（AMD CPU）上安装编译FVCOM，
> 目前仅能采用CentOS6.7+IntelParallelStudioXE2013的组合
> （CentOS6.7中的无线网卡驱动有问题，只能使用有线，这点很不爽）。
> 在此存在一个问题，集群中采用的是IntelParallelStudioXE2015，
> 这是咋搞上去的？（难道真的跟CPU的架构有关？此问题待验证）。


### 总结CentOS6.7+IntelParallelStudioXE2013组合安装及FVCOM编译的步骤：

> 1. 安装CentOS6.7：直接用UltraISO将ISO镜像写入U盘即可安装
> （安装CentOS7时需要修改一下U盘的卷标，越简单越好，而且不能有空格，
> 安装启动菜单出现时按“E”编辑启动脚本，将其中的内容修改为前面修改的卷标，然后按ctrl+x继续安装，否则找不到安装盘）

> 2. 安装IntelParallelStudioXE2013：默认安装到 /opt/intel 目录下，
> 安装完成后执行 source /opt/intel/bin/compilervars.sh 加载环境变量，
> 在后续的编译安装中将采用其中的icc、icpc、ifort编译器。

> 3. 安装openmpi-1.4.2：执行configure 过程，指令为 
> `./configure CC=icc CXX=icpc FC=ifort F77=ifort --prefix=/opt/openmpi-1.4.2 `
> 然后顺序执行make、make install即可。安装完成后，执行一段脚本，内容类似如下：
> ```shell
> source /opt/intel/bin/compilervars.sh intel64
> export PATH=/opt/openmpi-1.4.2/bin:$PATH
> export MANPATH=/opt/openmpi-1.4.2/share/man:$MANPATH
> export LD_LIBRARY_PATH=/opt/openmpi-1.4.2/lib:$LD_LIBRARY_PATH
> ```
> 设置并行运算的编译环境，在后面编译FVCOM时使用。

> 4. 安装curl-7.24.0：configure 指令 
> `./configure --prefix=/opt/curl-7.24.0`，
> 然后顺序执行make、make install

> 5. 安装 zlib-1.2.6：configure 指令 
> `./configure --prefix=/opt/zlib-1.2.6`
> ，然后顺序执行make、make install

> 6. 安装 netcdf-3.6.3：configure 指令 
> `./configure CC=icc CXX=icpc FC=ifort F77=ifort --prefix=/opt/netcdf-3.6.3 --disable-cxx `
> (该模块中C++接口存在问题，所以屏蔽掉C++部分的编译)

> 7. 编译FVCOM： 
> - 在FVCOM_source目录下复制make.inc_exmple 为make.inc 并修改其中的内容：
>  1. 修改 TOPDIR: 指到FVCOM_source的目录，且末尾不留空格（切记，否则会出现编译错误） 
>  2. 打开 LOCAL INSTAL 下的两个变量 LIBDIR INCDIR
>  3. 修改IOLIBS 变量内容为 -L/opt/netcdf-3.6.3/lib -lnetcdf ,修改IOINCS 变量内容为 -I/opt/netcdf-3.6.3/include
> -  修改libs目录下的makefile文件内容：
>  1. 将其中CXX部分的内容都修改为“CXX”（此处源文件中存在bug）
>  2. netcdf部分中增加一项 --disable-cxx (此处也可将netcdf部分完全屏蔽掉)
> - 以上两项修改完成后，在libs目录下执行 
>  `make CC=icc CXX=icpc FC=ifort F77=ifort`
> 当直接make编译出现错误时，也可以 各个模块单独编译，只要将安装目录 --prefix= ../libs/install 即可
> - Libs编译完成后，在FVCOM_source目录下执行make，开始编译FVCOM，
>   大约15分钟左右编译完成，在FVCOM_source目录下会出现一个有执行权限的fvcom文件。
> > FVCOM的编译过程到此大功告成！！！


### 后记： 
重新测试了CentOS7+IntelParallelStudioXE2015的组合情况

> 在编译fvcom时，将make.inc文件中的 
> “DEF_FLAGS   = -P -C -traditional”（大约在61行的位置）修改为
> “DEF_FLAGS   = -P -traditional”后，则fvcom成功通过编译。
> 解决方案由阿飙提出

### 补充(2016.9.18)：
>  此方法编译FVCOM3.1.6版本正常，编译FVCOM3.2.2版本时会报错：
mod_startup.f90(1090): error #7002: Error in opening the compiled module file. Check INCLUDE paths. [MOD_NESTING]
mod_startup.f90(1110): error #6404: This name does not have a type, and must have an explicit type.**  **[NESTING_ON]**

### 补充(**2022.3.28**)：
> 在Rocky，intel2019，openmpi 3.1.6 环境下，make.inc文件中的 \
> “DEF_FLAGS   = -P -C -traditional”（大约在61行的位置）修改为 \
> “DEF_FLAGS   = -P -traditional”，\
> “OPT= -cpp -o3”改为 \
> “OPT= -fpp -o3”后可编译通过
