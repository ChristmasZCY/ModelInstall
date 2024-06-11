[toc]

<a href="https://www.esr.org/tpxo/" target="_blank">TPXO</a> is a tidal model. It is a global tidal model that is used to predict tides. It is based on the theory of tidal constituents and is used to predict tides at any location on the globe. The model is based on the theory of tidal constituents, which are the fundamental building blocks of the tides. The model is used to predict tides at any location on the globe, and is used by scientists, engineers, and mariners to predict tides for a variety of applications.

<a href="https://blog.csdn.net/zhuyuzz/article/details/121049907" target="_blank">References</a>

### OTPS

```shell
tar zxvf OTPS.tar.Z
cd OTPS
vim DATA/Model_christmas
```

`Model_christmas`:
> DATA/TPXO9_atlas/binary/h_*_tpxo9_atlas_30 \
> DATA/TPXO9_atlas/binary/u_*_tpxo9_atlas_30 \
> DATA/TPXO9_atlas/binary/grid_tpxo9_atlas_30


```shell
sh make_lltime.sh
make
vim setup.inp
```
`setup.inp`:
> DATA/Model_tpxo7.2         ! 1. tidal model control file  海潮模型控制文件的路径； \
> ../mt_zhuo/ll_time         ! 2. latitude/longitude/<time> file 需要提取数据的经纬度或 需要预报的经纬度+时间 文件 \
> z                          ! 3. z/U/V/u/v  需要预报的数据类型，水位(z)，潮流(u)，具体见文件 \
>                            ! 4. tidal constituents to include  提取或预报所需分潮的名称，所有分潮保持为 空 即可 \
> AP                         ! 5. AP/RI  可以不用更改，有具体要求可看文件中详解 \
> oce                        ! 6. oce/geo  可以不用更改，有具体要求可看文件中详解 \
> 1                          ! 7. 1/0 correct for minor constituents  可以不用更改，有具体要求可看文件中详解 \
> ./zeta.out                 ! 8. output file (ASCII)  输出文件的路径位置  

```shell
./predict_tide < setup.inp
vim zeta.out
```


### OTPSnc

**Differences between OTPS and OTPSnc:**

> Change makefile:NCLIB \
> Change makefile: NCINCLUDE
