[toc]





**苗春葆**

# 安装

## `vim make.inc`

1. 第51行，设置TOPDIR
   ```makefile
       TOPDIR        =/home/model/work/FVCOM3.2.1/FVCOM_source
   # 或 
       TOPDIR        =
   ```

   **注意**，TOPDIR这一行最后面一定不能有空格


2. 第78，79行去掉开头的#
    ```makefile
           LIBDIR       =  -L$(INSTALLDIR)/lib
           INCDIR       =  -I$(INSTALLDIR)/include
    ```

3. 第86、87行（如果不采用lib里面编译）
    ```
            DTLIBS      = -L/opt/FVCOM/lib -ljulian
            DTINCS      = -I/opt/FVCOM/include
   ```

4. 第97-98行（打开NETCDF4）
    ```makefile
    #            FLAG_USE_NETCDF4     = -DUSE_NETCDF4
    #            FLAG_USE_COMPRESSION = -DUSE_COMPRESSION
    ```

4. 第97行增加#，第98行去掉开头的#，改完后：
    ```makefile
    #             IOLIBS       =  -lnetcdff -lnetcdf #-lhdf5_hl -lhdf5 -lz -lcurl -lm \
                IOLIBS       =  -lnetcdf #-L/hosts/mao/usr/medm/install/netcdf/3.6.3/em64t/lib -lnetcdf
    ```

    **如果是不采用lib中的安装**
    ```makefile
             IOLIBS       = -L/opt/netcdf4/lib -lnetcdff  -lnetcdf
             IOINCS       = -I/opt/netcdf4/include
    ```
   
5. optional
    ```makefile
              FLAG_4 = -DMULTIPROCESSOR
              PARLIB = -L/opt/FVCOM/lib -lmetis  #-L/usr/local/lib -lmetis
    ```
    ```makefile
              FLAG_7 = -DDATA_ASSIM
              include ${PETSC_DIR}/bmake/common/variables
    ```
    ```makefile
              FLAG_9 = -DSEMI_IMPLICIT
              include ${PETSC_DIR}/lib/petsc/conf/variables
              PETSCINC = ${PETSC_DIR} 
    ```
   
6. 编译器选项（openmpi）
    ```makefile
         CPP      = /usr/bin/cpp
         COMPILER = -DIFORT  
         CC       = mpicc
         CXX      = mpicxx
         CFLAGS   = -O3 
         FC       = mpif90 
   ```


## 编译libs目录的库文件

1. 修改文件`libs/makefile`

a. 第14行为：

    ```makefile
    cd proj && ./configure CC=$(CC) CFLAGS=-O3 CXX=$(CC) CXXFLAGS=-O3 F77=$(FC) FFLAGS=-O3 --prefix=$(MYINSTALLDIR)
    # 改为
    cd proj && ./configure CC=$(CC) CFLAGS=-O3 CXX=$(CXX) CXXFLAGS=-O3 F77=$(FC) FFLAGS=-O3 --prefix=$(MYINSTALLDIR)
    ```

b. 第18行为：

    ```makefile
    cd netcdf && ./configure CC=$(CC) CFLAGS=-O3 CXX=$(CC) CXXFLAGS=-O3 F77=$(FC) F90=$(FC) FFLAGS=-O3 --prefix=$(MYINSTALLDIR) --build=$(MACHTYPE)
    # 改为
    cd netcdf && ./configure CC=$(CC) CFLAGS=-O3 CXX=$(CXX) CXXFLAGS=-O3 F77=$(FC) F90=$(FC) FFLAGS=-O3 --prefix=$(MYINSTALLDIR) --build=$(MACHTYPE) --disable-cxx
    ```

2. 修改metis库文件

    ```shell
    cd libs
    ./untar.sh metis
    vim metis/rename.h
    ```

    将第413行：
    ```c
    #define log2                            __log2
   ! 改为
    #define log2                            __intlog2
   ```
  
3. 编译libs目录下的库

    ```shell
    cd libs
    make CC=icc CXX=icpc FC=ifort
    ```

    编译成功后在`install/lib`目录生成一些库文件（注意不要少文件），如下：

    ```shell
    [model@centos libs]$ ls install/lib
    > libfproj4.a  libjulian.a  libmetis.a  libnetcdf.a  libnetcdf.la  libproj.a  libproj.la  libproj.so  libproj.so.0  libproj.so.0.5.2
    ```
## 编译FVCOM

  ```shell
  cd FVCOM_source
  make
  - ```

  编译成功后在`FVCOM_source`目录生成fvcom可执行文件，如下：
    
  ```shell
  [model@centos FVCOM_source]$ ls -l fvcom
  > -rwxrwxr-x. 1 model model 9516549 2月  16 21:34 fvcom
  ```

# 说明
## 参数设置

Chapter 18: Model Setup （Page 253)
参数文件：tst_run.nml (mpirun -np 2 ./fvcom --casename=tst)
网格文件：tst_grd.dat
水深文件：tst_dep.dat
科氏力：  tst_cor.dat
垂向分层：sigma.dat
开边界：  tst_obc.dat
海绵条件： tst_spg.dat
开边界强迫：m2_only_1m.nc
河流参数：RIVERS_NAMELIST.nml
河流数据：River_data.nc

## 数值模式特性
Table 17.1: Code Module Options to Select before Compilation (Page 242)
直角坐标：#  FLAG_2 = -DSPHERICAL
支持漫滩：   FLAG_3 = -DWET_DRY


--------------------------------安装完成-----------------------------

4.运行测试算例
cd FVCOM3.2.1/Examples/Estuary/run
ln -s ../../../FVCOM_source/fvcom .
mpirun -np 2 ./fvcom --casename=tst
输入蓝色的，两行。

第4课 Esturay算例介绍

0.FVCOM手册
  FVCOM3.2.1/Doc/FVCOM_User_Manual_v3.1.6.pdf
  Chapter 19: FVCOM Test Cases......................................................350
  Case 1: Tidally-driven flooding/drying process in a semi-enclosed channel.................350

1.先了解算例背景
  Tidally driven flooding/drying process in a semi-enclosed channel.
  潮汐传入半封闭渠道发生的漫滩过程

2.算例设计
  区域：渠道宽度、长度、水深、斜坡斜率
  网格：水平网格(三角形)、垂向分层（Sigma坐标）
  强迫：开边界处M2频率水位强迫
  时间：3天


1.岸线数据
  http://www.ngdc.noaa.gov/mgg/shorelines/
  http://www.ngdc.noaa.gov/mgg/shorelines/gshhs.html
  http://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/latest/gshhg-shp-2.3.4.zip

2.水深数据
  ETOPO1 Global Relief Model
  http://ngdc.noaa.gov/mgg/global/global.html
  http://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/binary/etopo1_ice_g_f4.zip

3.调和常数
  China Seas 1/30
  http://volkov.oce.orst.edu/tides/YS.html
  ftp://ftp.oce.orst.edu/dist/tides/regional/YS.tar.Z

  OTPS (OSU Tidal Prediction Software)
  http://volkov.oce.orst.edu/tides/otps.html
  ftp://ftp.oce.orst.edu/dist/tides/OTPS.tar.Z

4.GEODAS-NG software，处理岸线和水深数据
  http://www.ngdc.noaa.gov/mgg/dat/geodas/software/mswindows/geodas-ng_setup.exe

5.SMS软件，制作网格
  http://www.aquaveo.com
  http://sms.aquaveo.com/sms11.2.9full32.exe
  http://sms.aquaveo.com/sms11.2.9full64.exe
  http://sms.aquaveo.com/SMS%2011.2%20Tutorials.zip

