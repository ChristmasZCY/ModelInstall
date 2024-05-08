##  WWIII

### 6.07版本

#### 安装前设置环境变量

netcdf3

```bash
#wavewatch III
export WWATCH3_NETCDF=NC3
export NETCDF_LIBDIR=$NETCDF_ROOT/lib
export NETCDF_INCDIR=$NETCDF_ROOT/include
```

netcdf4

```bash
#wavewatch III
export WWATCH3_NETCDF=NC4
export NETCDF_CONFIG=/usr/bin/nc-config
```


```bash
wget https://github.com/NOAA-EMC/WW3/archive/refs/tags/6.07.1.tar.gz
tar -xvf 6.07.1.tar.gz
# 切换到bin目录 制作switch
vi switch_switch
# 写入内容：F90 NOGRB NOPA LRB4 MPI DIST PR3 UQ FLX2 LN1 ST2 STAB2 NL1 BT1 DB1 MLIM TR0 BS0 IC0 REF1 XX0 WNT1 WNX1 CRT1 CRX1 IS0 O0 O1 O2 O3 O4 O5 O6 O7 O11 O14 NC4（注，可根据需求修改）
#  Compiling and linking
./w3_setup /home/user/WW3/model -c <comp> -s <switch>
#注：根据需求修改上述内容，如使用intel编译器，以191服务器文件夹目录为例，则上述命令为
./w3_setup /home/ocean/ForecastSystem/WW3-6.07.1/model -c intel -s switch
./w3_setup ../ -c Intel -s switch
将comp和link中的mpiifort修改为mpif90
comp link comp.Intel link.Intel # 只改前两个就行 :%s/mpiifort/mpif90/g
# 编译 在弹出来的输入框中，一般都是选yes或者继续，编译器器分别写ifort、icc
./w3_clean
./w3_new
./w3_make
# ./w3_make ww3_grid ww3_strt ww3_bounc ww3_prnc ww3_shel ww3_ounf ww3_ounp
# ./w3_automake
```
#### SWITCH设置

SBS控制 Field_done.2023020423.ww3的产生

**西太**
```bash
F90 NOGRB NOPA LRB4 MPI DIST PR3 UQ FLX2 LN1 ST2 STAB2 NL1 BT1 DB1 MLIM TR0 BS0 IC0 REF1 XX0 WNT1 WNX1 CRT1 CRX1 IS0 O0 O1 O2 O3 O4 O5 O6 O7 O11 O14 NC4
```

**董家口**
```bash
F90 NOGRB SBS DIST MPI PR3 UQ ST6 STAB0 FLX4 LN1 NL1 IC0 IS0 REF0 BT1 DB1 MLIM TR0 BS0 XX0 WNX1 WNT1 CRX1 CRT1 O0 O1 O2 O4 O5 O6 O7 NC4 O3 O11 O14
```

**胶州湾**
```bash
F90 NOGRB SBS DIST MPI PR3 UQ ST6 STAB0 FLX4 LN1 NL1 IC0 IS0 REF0 BT1 DB1 MLIM TR0 BS0 XX0 WNX1 WNT1 CRX1 CRT1 O0 O1 O2 O4 O5 O6 O7 NC4 O3 O11 O14
```

**岚山**
```bash
F90 NOGRB SBS DIST MPI PR3 UQ ST6 STAB0 FLX4 LN1 NL1 IC0 IS0 REF0 BT1 DB1 MLIM TR0 BS0 XX0 WNX1 WNT1 CRX1 CRT1 O0 O1 O2 O4 O5 O6 O7 NC4 O3 O11 O14
```

**烟台**
```bash
F90 NOGRB NOPA LRB4 MPI DIST PR3 UQ FLX2 LN1 ST2 STAB2 NL1 BT1 DB1 MLIM TR0 BS0 IC0 REF1 XX0 WNT1 WNX1 CRT1 CRX1 IS0 O0 O1 O2 O3 O4 O5 O6 O7 O11 O14 NC4
```

**大连**
```bash
F90 NOGRB SBS DIST MPI PR3 UQ ST6 STAB0 FLX4 LN1 NL1 IC0 IS0 REF0 BT1 DB1 MLIM TR0 BS0 XX0 WNX1 WNT1 CRX1 CRT1 O0 O1 O2 O4 O5 O6 O7 NC4 O3 O11 O14
```



加上折射

```bash
# switch里加上REF1
./w3_clean
./w3_new
./w3_make
# 重跑 ./ww3_grid ./ww3_strt
```

### 5.16版本

```bash
tar -xvf wwatch3.v5.16.tar.gz
./install_ww3_tar  # 在弹出来的输入框中，一般都是选yes或者继续，编译器器分别写ifort、icc
cd bin # 切换到bin目录
```

intel编译器
```bash
cp comp.Intel comp 
cp link.Intel link
```

gcc 编译器
 ```bash
cp comp.gfortran comp 
cp link.gfortran link 
 ```

修改编译器

intel 编译器
```bash
在comp里将mpiifort改成mpif90
在link里将mpiifort改成mpif90
```

gcc编译器
```bash
在comp里将gfortran改成mpif90
在link里将gfortran改成mpif90
```

在switch里将SHRD改为 MPI DIST  编译

```bash
./w3_clean
./w3_new
./w3_make
```

链接
 ```bash
./link.sh
 ```

这个脚本是需要自己写，大致内容如下(根据需要自己修改)：
```bash
#!/bin/sh
#ln -sf ../bin/w3_clean
#ln -sf ../bin/w3_new
#ln -sf ../bin/w3_make
ln -sf ../exe/ww3_grid
ln -sf ../exe/ww3_prnc
ln -sf ../exe/ww3_prep
ln -sf ../exe/ww3_strt
ln -sf ../exe/ww3_shel
ln -sf ../exe/ww3_ounf
#ln -sf ../exe/ww3_ounp
```

wwatch3的运行

```bash
ww3_grid # 生成网格信息 
ww3_prnc # 生成风场信息
ww3_strt # 处理热启动文件
mpiexec -n 32 ./ww3_shel # 模型计算过程
ww3_ounf # 将计算结果转换为nc文件
```

