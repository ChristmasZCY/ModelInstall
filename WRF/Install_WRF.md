
## Rocky Linux 9.1

##[依赖安装](https://mp.weixin.qq.com/s?__biz=MzkyNjUwMzQ5Mg==&mid=2247487893&idx=1&sn=65a69f6f6ca48cf9c6fd611a22337602&chksm=c23716bef5409fa8f980df430d8efa5720b4c9c49ad833688baf484d79715eaabd4e8040ba42&cur_album_id=3458810993755750403&scene=189#wechat_redirect)

## [WRF-source](https://www2.mmm.ucar.edu/wrf/src/)
https://www2.mmm.ucar.edu/wrf/src/WRFV4.0.TAR.gz
https://www2.mmm.ucar.edu/wrf/src/WPSV4.0.TAR.gz

### WRF

```shell
./clean -a
./configure 15 1 # 15 --> ifort+icc in dmpar
# extern 外部库
export J="-j 2"
./compile em_real
```

**Siqi Li（使用）**

> 更改./configure生成的 configure.wrf（57）

![image-change1](./pics/changed1.png)

> 147

![image-change2](./pics/changed2.png)

**Christmas**
```makefile
SFC             =       mpifort
SCC             =       mpicc
CCOMP           =       mpicc
```

### WPS

#### **Siqi Li（使用）**

![image-compile_wps](./pics/compile_wps.png)

#### **[公众号教程](https://mp.weixin.qq.com/s/1BJ2b3j3SOj77pQfqaSDmA)**

```shell
./clean -a
```

修改`intmath.f`
参考[链接](https://github.com/jimbresch/WPS-1/blob/master/ungrib/src/ngl/g2/intmath.f)
这一步必须做，不做的后果就是WPS生成的三个exe执行文件中少一个ungrib.exe。

```shell
vim WPS/ungrib/src/ngl/g2/intmath.f
```

To:
172行
```fortran
! WPS modification for the XL compiler
!      if(iand(i,i-1)/=0) then
      if(iand(i,i-1_2)/=0) then
```
207行
```fortran
! WPS modification for the XL compiler
!      if(iand(i,i-1)/=0) then
     if(iand(i,i-1_1)/=0) then
```
