[toc]

# 0. 测试版本

**基于`Rocky Linux 9`**

    - Cal57  --> WRF4.4 WPS4.4
    - Cal233 --> WRF4.6.1 WPS4.6
    - Cal233 --> WRF4.6.1 WPS4.6


# 1. 依赖安装


## 1.1 说明

### 1.1.1 第八星系
    
- [依赖安装-（第八星系）网页](https://mp.weixin.qq.com/s?__biz=MzkyNjUwMzQ5Mg==&mid=2247487893&idx=1&sn=65a69f6f6ca48cf9c6fd611a22337602&chksm=c23716bef5409fa8f980df430d8efa5720b4c9c49ad833688baf484d79715eaabd4e8040ba42&cur_album_id=3458810993755750403&scene=189#wechat_redirect)
- [依赖安装-（第八星系）网页下载](./mhtml/WRF安装教程3--第三方依赖库安装.mhtml) 

### 1.1.2 阿里云

- [依赖安装-（阿里云）网页](https://developer.aliyun.com/article/634880)
- [依赖安装-（阿里云）网页下载](./mhtml/WRF主程序与WPS的编译与安装-阿里云开发者社区.mhtml)


# 2. WRF安装

## 2.1 下载地址

- [WRF-source](https://www2.mmm.ucar.edu/wrf/src/)
- [WRF-4.0下载](https://www2.mmm.ucar.edu/wrf/src/WRFV4.0.TAR.gz)
- [WPS-4.0下载](https://www2.mmm.ucar.edu/wrf/src/WPSV4.0.TAR.gz)

## 2.2 安装命令

概括为：

```shell
./clean -a
./configure 15 1
# extern 外部库
# export J="-j 2"
./compile -j 80 em_real
```
**注：**

- 旧版参数 ` # 15 --> ifort+icc in dmpar 旧版，例如4.4`
- 新版参数 `oneapi2025.0.0搭配选择oneapi dmpar`

## 3.3 报错解决

### 3.3.1 在`Cal57`上的报错

**Siqi Li（使用）**

> 更改./configure生成的 configure.wrf（57）

![image-change1](./pics/changed1.png)

### 3.3.2 在`Cal147`上的报错

**Siqi Li（使用）**

![image-change2](./pics/changed2.png)

**Christmas（使用）**
```makefile
SFC             =       mpifort
SCC             =       mpicc
CCOMP           =       mpicc
```


# 3. WPS安装

## 3.1 安装命令

概括为：

```shell
./clean -a
./configure
./compile
```

## 3.2 报错解决

**Siqi Li（使用）**

![image-compile_wps](./pics/compile_wps.png)


## 3.3 特殊情况处理

### 3.3.1. 采用`jasper > 1.900.1`版本，需要在如下选1进行操作
   - [ ] 需要修改`configure.wps`文件，将`COMPRESSION_LIBS`中的`/path/jasper/lib`改为`/path/jasper/lib64`。 这是因为`jasper`库在`1.900.1`版本之后，将库文件放在了`lib64`文件夹下。
   - [ ] 在编译`jasper`库时，在库文件夹将`lib`文件夹链接为`lib64`文件夹。

### 3.3.2. `WPS-4.5`，搭配oneapi需要

1. 在configure之前 修改`./arch/configure.defaults`文件，将` ifort`和` icc`修改为`ifx`和`icx`。因为这个版本还没有添加`ifx`和`icx`的支持。可以使用`:%s/ ifort/ ifx/g`和`:%s/ icc/ icx/g`进行替换。
2. 修改`./ungrib/src/cio.c`文件，在函数前面加上`int`,如：(`int`在上一行单独也可以)。这是因为新版编译器要求有返回语句的函数必须要声明类型。**[参考](https://zhuanlan.zhihu.com/p/679043681)**
     ```c
     int 
     c_open(unit, nunit, name, mode, err, oflag)
     {
         ...
     }
     int 
     bn_seek(fd, bread, mode, iprint)
     {
         ...
     }
     int 
     bn_read(fd, buf, nbuf, bread, ios, idiag)
     {
         ...
     }
     int bnwrit_(fd, buf, nbuf, bwritten, err, idiag)
     {
         ...
     }
     int c_close(nunit, iprint, err)
     {
         ...
     }
     ```
### 3.3.3 `Intel oneAPI`编译器安装WRF和WPS基于`WRF-V4.5.2`和`WPS-V4.5`

- [参考-网页](https://zhuanlan.zhihu.com/p/679043681)
- [参考-本地](./mhtml/使用InteloneAPI编译器安装WRF和WPS-知乎.mhtml)

#### 3.3.3.1 WRF
1. 更改`configure.wrf`, 大概在第136行
   - `DM_CC=mpicc -cc=$(SCC)` --> `DM_CC=mpiicx`
   - `DM_FC=mpif90` --> `DM_FC=mpiifx`

2. 如果`./configure`选择了`dmpar`，编译不过去可以尝试关掉`OMP`注释
   - `OMP= #qopenmp -fpp -auto` --> `OMP=qopenmp -fpp -auto`

3. 如果`./configure`选择了`dm+sm`，需要更改`OMPCC`的内容，因为icx命令没有-auto这个选项
   - `OMPCC=-qopenmp -auto` --> `OMPCC=-qopenmp`

#### 3.3.3.2 WPS
1. 新版编译器要求有返回语句的函数必须要声明类型，修改`ungrib/src/cio.c`文件，在所有函数前加上返回数据类型int。
   - 见`3.3.2`的内容

2. `configure.wps`文件中，修改`WRF_LIB`，在`-L$(NETCDF)/lib`后加`-liomp5 -lpthread`
   -
   ```makefile
   WRF_LIB         =       -L$(WRF_DIR)/external/io_grib1 -lio_grib1 \
                        -L$(WRF_DIR)/external/io_grib_share -lio_grib_share \
                        -L$(WRF_DIR)/external/io_int -lwrfio_int \
                        -L$(WRF_DIR)/external/io_netcdf -lwrfio_nf \
                        -L$(NETCDF)/lib -lnetcdff -lnetcdf
   ```
   **-->**
   ```makefile
   WRF_LIB         =       -L$(WRF_DIR)/external/io_grib1 -lio_grib1 \
                        -L$(WRF_DIR)/external/io_grib_share -lio_grib_share \
                        -L$(WRF_DIR)/external/io_int -lwrfio_int \
                        -L$(WRF_DIR)/external/io_netcdf -lwrfio_nf \
                        -L$(NETCDF)/lib -lnetcdff -lnetcdf -liomp5 -lpthread
   ```

3. 如果安装的是最新版的`Jasper`（用`cmake`安装的），确认一下安装路径，`configure.wps`可能识别到的是`lib`，要改为`lib64`
   - 见`3.3.1`的内容

4. 如果使用的最新版`Jasper`提示`dec_jpeg2000.c:(.text+0x1f)：对‘jpc_decode’未定义的引用`。此项安装最新版Jasper才改
   - 更改`ungrib/src/ngl/g2/dec_jpeg2000.c`
   - 大致83行，`image=jpc_decode(jpcstream,opts);` --> `image=jas_image_decode(jpcstream,4,opts);`


### 3.3.4 [公众号教程](https://mp.weixin.qq.com/s/1BJ2b3j3SOj77pQfqaSDmA) 基于`WRF-V4.0`和`WPS-V4.0`

1. 修改`intmath.f`，参考[链接](https://github.com/jimbresch/WPS-1/blob/master/ungrib/src/ngl/g2/intmath.f) 这一步必须做，不做的后果就是WPS生成的三个exe执行文件中少一个ungrib.exe。
   - 更改`WPS/ungrib/src/ngl/g2/intmath.f`
   - 大概在第172行
      ```fortran
      ! WPS modification for the XL compiler
      !      if(iand(i,i-1)/=0) then
            if(iand(i,i-1_2)/=0) then
      ```
   - 大概在第207行
      ```fortran
      ! WPS modification for the XL compiler
      !      if(iand(i,i-1)/=0) then
           if(iand(i,i-1_1)/=0) then
      ```


