[toc]


> 以下是WRF输出变量的一个翻译，由于不是所有的变量都接触过，也仅仅是就字面意思翻译，所以有的变量的意义难免是不对的，\
> 因此请用过其中变量的朋友和我一起来完善它：

- LU_INDEX: LAND USE CATEGORY 地表类型（如城市、植被、湖泊等）

Lu_index = land use category 土地利用类型
> float LU_INDEX(Time, south_north, west_east) ; \
> LU_INDEX:description = "LAND USE CATEGORY" ; \
> LU_INDEX:units = "" ; \
> 地表类型（如城市、植被、湖泊等） \
> 土地利用类型（如城市、植被、湖泊等）

- ZNU: eta values on half (mass) levels eta 半层（质量点）坐标值

Znu= eta values on half(mass) levels 一半（质量）水平上的eta值
> float ZNU(Time, bottom_top) ; \
> ZNU:description = "eta values on half (mass) levels" ; \
> ZNU:units = "" ; \
> eta坐标系的值 \
> eta半层（质量点）坐标值

- ZNW: eta values on full (w) levels eta整层（w点）坐标值

Znw=eta values on full(w) levels 全（w）级eta值
> float ZNW(Time, bottom_top_stag) ; \
> ZNW:description = "eta values on full (w) levels" ; \
> ZNW:units = "" ; \
> eta坐标系的值 \
> eta整层（w点）坐标值

- ZS: DEPTHS OF CENTERS OF SOIL LAYERS 土壤层中层的深度

ZS=depths of centers of soil layers 土层中心深度，单位m
> float ZS(Time, soil_layers_stag) ; \
> ZS:description = "DEPTHS OF CENTERS OF SOIL LAYERS" ; \
> ZS:units = "m" ; \
> 土壤层中层的深度 \
> 土壤层各层中间的深度

- DZS: THICKNESSES OF SOIL LAYERS 土壤层厚度

Dzs=thicknesses of soil layers 土层厚度，单位m
> float DZS(Time, soil_layers_stag) ; \
> DZS:description = "THICKNESSES OF SOIL LAYERS" ; \
> DZS:units = "m" ; \
> 土壤层厚度

- U: x-wind component x风分量
> float U(Time, bottom_top, south_north, west_east_stag) ; \
> U:description = "x-wind component" ; \
> U:units = "m s-1" ; \
> 纬向风分量

- V: y-wind component y风分量
> float V(Time, bottom_top, south_north_stag, west_east) ; \
> V:description = "y-wind component" ; \
> V:units = "m s-1" ; \
> 经向风分量 

- W: z-wind component z风分量
> float W(Time, bottom_top_stag, south_north, west_east) ; \
> W:description = "z-wind component" ; \
> W:units = "m s-1" ; \
> 垂直风分量 

- PH: perturbation geopotential 扰动位势高度
> float PH(Time, bottom_top_stag, south_north, west_east) ; \
> PH:description = "perturbation geopotential" ; \
> PH:units = "m2 s-2" ; \
> 扰动位势高度 

- PHB: base-state geopotential 基准态/基态位势高度
> float PHB(Time, bottom_top_stag, south_north, west_east) ; \
> PHB:description = "base-state geopotential" ; \
> PHB:units = "m2 s-2" ; \
> 平均重力位势 \
> 基准态/基态位势高度 

- T: perturbation potential temperature (theta-t0) 扰动位温（theta-t0）

位温：把干空气块绝热膨胀或压缩到标准气压（1000hPa）时的温度

THM=either 1) pert moist pot temp=(1+Rv/Rd Qv)(theta)-T0,

or 2) pert dry pot temp=t 单位：K

> float T(Time, bottom_top, south_north, west_east) ; \
> T:description = "perturbation potential temperature (theta-t0)" ; \
> T:units = "K" ; \
> 扰动位温（theta-t0） 

- MU: perturbation dry air mass in column 干空气柱扰动气压

MU=perturbation dry air mass in column 柱内干空气质量扰动，单位：Pa
> float MU(Time, south_north, west_east) ; \
> MU:description = "perturbation dry air mass in column" ; \
> MU:units = "Pa" ; \
> 干空气柱扰动气压 \
> 柱内扰动干空气质量 

- MUB: base state dry air mass in column 基准态干空气质量

MUB=base state dry air mass in column 柱内基态干空气质量，单位:Pa
> float MUB(Time, south_north, west_east) ; \
> MUB:description = "base state dry air mass in column" ; \
> MUB:units = "Pa" ; \
> 平均干空气柱气压 \
> 柱内基准态干空气质量 

- NEST_POS: position of nest in parent grid 作多层嵌套时粗（母）网格位置
> float NEST_POS(Time, south_north, west_east) ; \
> NEST_POS:description = "-" ; \
> NEST_POS:units = "-" ; \
> 作多层嵌套时粗（母）网格位置 

- P: perturbation pressure 扰动气压
> float P(Time, bottom_top, south_north, west_east) ; \
> P:description = "perturbation pressure" ; \
> P:units = "Pa" ; \
> 扰动气压 

- PB: base state pressure 基准态气压
> float PB(Time, bottom_top, south_north, west_east) ; \
> PB:description = "BASE STATE PRESSURE" ; \
> PB:units = "Pa" ; \
> 平均气压 \
> 基准态气压 

- SR: fraction of frozen precipitation 固体降水比例

SR=fraction of frozen precipitation 冻结降水分数
> float SR(Time, south_north, west_east) ; \
> SR:description = "fraction of frozen precipitation" ; \
> SR:units = "-" ; \
> 固体降水比例 

- POTEVP: accumulated potential evaporation 累积的潜在蒸发
> float POTEVP(Time, south_north, west_east) ; \
> POTEVP:description = "accumulated potential evaporation" ; \
> POTEVP:units = "W m-2" ; \
> 累积的潜在蒸发 

- SNOPCX: snow phase change heat flux 雪相态改变的热通量
> float SNOPCX(Time, south_north, west_east) ; \
> SNOPCX:description = "snow phase change heat flux" ; \
> SNOPCX:units = "W m-2" ; \
> 雪态改变时的热通量 \
> 雪相态改变的热通量 

- SOILTB: bottom soil temperature 土壤底部温度
> float SOILTB(Time, south_north, west_east) ; \
> SOILTB:description = "bottom soil temperature" ; \
> SOILTB:units = "K" ; \
> 土壤底部温度 

- FNM: upper weight for vertical stretching 作垂直方向展开时上层权重

FNM=upper weight for vertical stretching 垂直拉伸的上部重量
> float FNM(Time, bottom_top) ; \
> FNM:description = "upper weight for vertical stretching" ; \
> FNM:units = "" ; \
> 作垂直方向展开时上层权重 

- FNP: lower weight for vertical stretching 作垂直方向展开时下层权重

FNP=lower weight for vertical stretching 垂直拉伸的下部重量
> float FNP(Time, bottom_top) ; \
> FNP:description = "lower weight for vertical stretching" ; \
> FNP:units = "" ; \
> 作垂直方向展开时下层权重 

- RDNW: inverse d(eta) values between full (w) levels 整层（w层）间eta值之差
> float RDNW(Time, bottom_top) ; \
> RDNW:description = "inverse d(eta) values between full (w) levels" ; \
> RDNW:units = "" ; \
> 1除以整层（w层）间eta值之差 

- RDN: inverse d(eta) values between half (mass) levels 半层（质量层）间eta值之差
> float RDN(Time, bottom_top) ; \
> RDN:description = "inverse d(eta) values between half (mass) levels" ; \
> RDN:units = "" ; \
> 1除以半层（质量层）间eta值之差 

- DNW: d(eta) values between full (w) levels 整层（w层）间eta值之差
> float DNW(Time, bottom_top) ; \
> DNW:description = "d(eta) values between full (w) levels" ; \
> DNW:units = "" ; \
> 整层（w层）间eta值之差

- DN: d(eta) values between half (mass) levels 半层（质量层）间eta值之差
> float DN(Time, bottom_top) ; \
> DN:description = "d(eta) values between half (mass) levels" ; \
> DN:units = "" ; \
> 半层（质量层）间eta值之差 

- CFN: extrapolation constant 外推常数
> float CFN(Time) ; \
> CFN:description = "extrapolation constant" ; \
> CFN:units = "" ; \
> 外推常数 

- CFN1: extrapolation constant 外推常数1
> float CFN1(Time) ; \
> CFN1:description = "extrapolation constant" ; \
> CFN1:units = "" ; \
> 外推常数1

- Q2: QV at 2 M 地面2m高度的比湿
> float Q2(Time, south_north, west_east) ; \
> Q2:description = "QV at 2 M" ; \
> Q2:units = "kg kg-1" ; \
> 地面2m高度的比湿 

- T2: TEMP at 2 M 地面2m高度的温度
> float T2(Time, south_north, west_east) ; \
> T2:description = "TEMP at 2 M" ; \
> T2:units = "K" ; \
> 地面2m高度的温度 

- TH2: POT TEMP at 2 M 地面上2m高度的位温
> float TH2(Time, south_north, west_east) ; \
> TH2:description = "POT TEMP at 2 M" ; \
> TH2:units = "K" ; \
> 地面上2m高度的位温 

- PSFC: SFC PRESSURE 表面气压
> float PSFC(Time, south_north, west_east) ; \
> PSFC:description = "SFC PRESSURE" ; \
> PSFC:units = "Pa" ; \
> 表面气压 \
> 地面气压 

- U10: U at 10 M 地面10m风场的纬向分量
> float U10(Time, south_north, west_east) ; \
> U10:description = "U at 10 M" ; \
> U10:units = "m s-1" ; \
> 地面10m风场的纬向分量 

- V10: V at 10 M 地面10m风场的经向分量
> float V10(Time, south_north, west_east) ; \
> V10:description = "V at 10 M" ; \
> V10:units = "m s-1" ; \
> 地面10m风场的经向分量 

- RDX: INVERSE X GRID LENGTH 1除以x方向网格距

RDX=inverse x grid length 反向x格网长度
> float RDX(Time) ; \
> RDX:description = "INVERSE X GRID LENGTH" ; \
> RDX:units = "" ; \
> 1除以x方向网格距 

- RDY: INVERSE Y GRID LENGTH 1除以y方向网格距

RDY=inverse y grid length 反向y格网长度
> float RDY(Time) ; \
> RDY:description = "INVERSE Y GRID LENGTH" ; \
> RDY:units = "" ; \
> 1除以y方向网格距 

- RESM: TIME WEIGHT CONSTANT FOR SMALL STEPS 对小时间步长时的时间权重常数
> float RESM(Time) ; \
> RESM:description = "TIME WEIGHT CONSTANT FOR SMALL STEPS" ; \
> RESM:units = "" ; \
> 对小时间步长时的时间权重常数 

- ZETATOP: ZETA AT MODEL TOP 模式大气层顶的eta值
> float ZETATOP(Time) ; \
> ZETATOP:description = "ZETA AT MODEL TOP" ; \
> ZETATOP:units = "" ; \
> 模式大气层顶的eta值 

- CF1: 2nd order extrapolation constant 2级外推常数1
> float CF1(Time) ; \
> CF1:description = "2nd order extrapolation constant" ; \
> CF1:units = "" ; \
> 2级外推常数1 

- CF2: 2nd order extrapolation constant 2级外推常数2
> float CF2(Time) ; \
> CF2:description = "2nd order extrapolation constant" ; \
> CF2:units = "" ; \
> 2级外推常数2 

- CF3: 2nd order extrapolation constant 2级外推常数3
> float CF3(Time) ; \
> CF3:description = "2nd order extrapolation constant" ; \
> CF3:units = "" ; \
> 2级外推常数3 

- ITIMESTEP: TIME STEP COUNT 时间步长计数
> int ITIMESTEP(Time) ; \
> ITIMESTEP:description = "" ; \
> ITIMESTEP:units = "" ; \
> 时间步长 \
> 时间步长计数 

- XTIME: minutes since simulation start 已经模拟时间的长度
> float XTIME(Time) ; \
> XTIME:description = "minutes since simulation start" ; \
> XTIME:units = "" ; \
> 已经模拟时间的长度 

- QVAPOR: Water vapor mixing ratio 水汽混合比
> float QVAPOR(Time, bottom_top, south_north, west_east) ; \
> QVAPOR:description = "Water vapor mixing ratio" ; \
> QVAPOR:units = "kg kg-1" ; \
> 水汽（模式模拟的湿空气中的）的混合比 \
> 水汽混合比 

- QCLOUD: Cloud water mixing ratio 云水混合比
> float QCLOUD(Time, bottom_top, south_north, west_east) ; \
> QCLOUD:description = "Cloud water mixing ratio" ; \
> QCLOUD:units = "kg kg-1" ; \
> 云水（模式模拟的实际空气中的）的混合比 \
> 云水混合比 

- QRAIN: Rain water mixing ratio 雨水混合比
> float QRAIN(Time, bottom_top, south_north, west_east) ; \
> QRAIN:description = "Rain water mixing ratio" ; \
> QRAIN:units = "kg kg-1" ; \
> 雨水（模式模拟的实际空气中的）的混合比 \
> 雨水混合比 

- LANDMASK: LAND MASK (1 FOR LAND, 0 FOR WATER) land mask（1是陆地，0是水体）

LANDMASK=LAND MASK (1 FOR LAND, 0 FOR WATER)
> float LANDMASK(Time, south_north, west_east) ; \
> LANDMASK:description = "LAND MASK (1 FOR LAND, 0 FOR WATER)" ; \
> LANDMASK:units = "" ; \
> land mask（1是陆地，0是水体） 

- TSLB: SOIL TEMPERATURE 各层土壤温度
> float TSLB(Time, soil_layers_stag, south_north, west_east) ; \
> TSLB:description = "SOIL TEMPERATURE" ; \
> TSLB:units = "K" ; \
> 各层土壤温度 

- SMOIS: SOIL MOISTURE 各层土壤湿度
> float SMOIS(Time, soil_layers_stag, south_north, west_east) ; \
> SMOIS:description = "SOIL MOISTURE" ; \
> SMOIS:units = "m3 m-3" ; \
> 各层土壤湿度 

- SH2O: SOIL LIQUID WATER 各层土壤液态水含量
> float SH2O(Time, soil_layers_stag, south_north, west_east) ; \
> SH2O:description = "SOIL LIQUID WATER" ; \
> SH2O:units = "m3 m-3" ; \
> 各层土壤液态水含量？ 

- SEAICE: SEA ICE FLAG 海冰标志
> float SEAICE(Time, south_north, west_east) ; \
> SEAICE:description = "SEA ICE FLAG" ; \
> SEAICE:units = "" ; \
> 海冰标志 

- XICEM: SEA ICE FLAG (PREVIOUS STEP) 上一时间步长的海冰标志
> float XICEM(Time, south_north, west_east) ; \
> XICEM:description = "SEA ICE FLAG (PREVIOUS STEP)" ; \
> XICEM:units = "" ; \
> 上一时间步长的海冰标志 

- SFROFF: SURFACE RUNOFF 地表径流
> float SFROFF(Time, south_north, west_east) ; \
> SFROFF:description = "SURFACE RUNOFF" ; \
> SFROFF:units = "mm" ; \
> 地表径流 

- UDROFF: UNDERGROUND RUNOFF 地下径流
> float UDROFF(Time, south_north, west_east) ; \
> UDROFF:description = "UNDERGROUND RUNOFF" ; \
> UDROFF:units = "mm" ; \
> 地下径流 

- IVGTYP: DOMINANT VEGETATION CATEGORY 主要的植被种类

IVGTYP=dominant vegetation category 优势植被类别
> int IVGTYP(Time, south_north, west_east) ; \
> IVGTYP:description = "DOMINANT VEGETATION CATEGORY" ; \
> IVGTYP:units = "" ; \
> 主要的植被种类 \
> 占主导的植被种类 

- ISLTYP: DOMINANT SOIL CATEGORY 主要的土壤种类

ISLTYP=dominant soil category 优势土壤类别
> int ISLTYP(Time, south_north, west_east) ; \
> ISLTYP:description = "DOMINANT SOIL CATEGORY" ; \
> ISLTYP:units = "" ; \
> 主要的土壤种类 \
> 占主导的土壤种类 

- VEGFRA: VEGETATION FRACTION 植被比例

VEGFRA=vegetation fraction 植被分数
> float VEGFRA(Time, south_north, west_east) ; \
> VEGFRA:description = "VEGETATION FRACTION" ; \
> VEGFRA:units = "" ; \
> 植被比例 

- GRDFLX: GROUND HEAT FLUX 地面热通量

GRDFLX=ground heat flux 地面热通量，单位：W m-2
> float GRDFLX(Time, south_north, west_east) ; \
> GRDFLX:description = "GROUND HEAT FLUX" ; \
> GRDFLX:units = "W m-2" ; \
> 地面热通量 

- SNOW: SNOW WATER EQUIVALENT 雪水等价物

SNOW=snow water equivalent 雪水单量，单位：kg m-2
> float SNOW(Time, south_north, west_east) ; \
> SNOW:description = "SNOW WATER EQUIVALENT" ; \
> SNOW:units = "kg m-2" ; \
> 雪水等价物 \
> 雪水当量 

- SNOWH: PHYSICAL SNOW DEPTH 实质的雪厚
> float SNOWH(Time, south_north, west_east) ; \
> SNOWH:description = "PHYSICAL SNOW DEPTH" ; \
> SNOWH:units = "m" ; \
> 实质的雪厚 \
> 实际雪厚 

- RHOSN: SNOW DENSITY 雪的密度
> float RHOSN(Time, south_north, west_east) ; \
> RHOSN:description = " SNOW DENSITY" ; \
> RHOSN:units = "kg m-3" ; \
> 雪的密度 

- CANWAT: CANOPY WATER 冠层中的水
> float CANWAT(Time, south_north, west_east) ; \
> CANWAT:description = "CANOPY WATER" ; \
> CANWAT:units = "kg m-2" ; \
> 冠层中的水 

- SST: SEA SURFACE TEMPERATURE 海表面温度

SST=SEA SURFACE TEMPERATURE 单位：K
> float SST(Time, south_north, west_east) ; \
> SST:description = "SEA SURFACE TEMPERATURE" ; \
> SST:units = "K" ; \
> 海表面温度 

- QNDROPSOURCE: Droplet number source 水滴数源
> float QNDROPSOURCE(Time, bottom_top, south_north, west_east) ; \
> QNDROPSOURCE:description = "Droplet number source" ; \
> QNDROPSOURCE:units = " /kg/s" ; \
> 水滴数源 

- MAPFAC_M: Map scale factor on mass grid 质量格点处的地图比例系数

MAPFAC_M=map scale factor on mass grid 质量栅格上的贴图比例因子
> float MAPFAC_M(Time, south_north, west_east) ; \
> MAPFAC_M:description = "Map scale factor on mass grid" ; \
> MAPFAC_M:units = "" ; \
> mass grid的地图比例系数 \
> 质量格点处的地图比例系数 

- MAPFAC_U: Map scale factor on u-grid U-grid的地图比例系数
> float MAPFAC_U(Time, south_north, west_east_stag) ; \
> MAPFAC_U:description = "Map scale factor on u-grid" ; \
> MAPFAC_U:units = "" ; \
> U-grid的地图比例系数 \
> u-格点处的地图比例系数 

- MAPFAC_V: Map scale factor on v-grid V-grid的地图比例系数
> float MAPFAC_V(Time, south_north_stag, west_east) ; \
> MAPFAC_V:description = "Map scale factor on v-grid" ; \
> MAPFAC_V:units = "" ; \
> V-grid的地图比例系数 \
> v-格点处的地图比例系数 

- MAPFAC_MX: Map scale factor on mass grid, x direction mass grid的地图在纬向的比例系数
> float MAPFAC_MX(Time, south_north, west_east) ; \
> MAPFAC_MX:description = "Map scale factor on mass grid, x direction" ; \
> MAPFAC_MX:units = "" ; \
> mass grid的地图在纬向的比例系数 \
> x方向上质量格点处的地图比例系数 

- MAPFAC_MY: Map scale factor on mass grid, y direction mass grid的地图在经向的比例系数
> float MAPFAC_MY(Time, south_north, west_east) ; \
> MAPFAC_MY:description = "Map scale factor on mass grid, y direction" ; \
> MAPFAC_MY:units = "" ; \
> mass grid的地图在经向的比例系数 \
> y方向上质量格点处的地图比例系数 

- MAPFAC_UX: Map scale factor on u-grid, x direction U-grid的地图在纬向的比例系数
> float MAPFAC_UX(Time, south_north, west_east_stag) ; \
> MAPFAC_UX:description = "Map scale factor on u-grid, x direction" ; \
> MAPFAC_UX:units = "" ; \
> U-grid的地图在纬向的比例系数 \
> x方向上u-格点处的地图比例系数 

- MAPFAC_UY: Map scale factor on u-grid, y direction U-grid的地图在经向的比例系数
> float MAPFAC_UY(Time, south_north, west_east_stag) ; \
> MAPFAC_UY:description = "Map scale factor on u-grid, y direction" ; \
> MAPFAC_UY:units = "" ; \
> U-grid的地图在经向的比例系数 \
> y方向上u-格点处的地图比例系数 

- MAPFAC_VX: Map scale factor on v-grid, x direction V-grid的地图在纬向的比例系数
> float MAPFAC_VX(Time, south_north_stag, west_east) ; \
> MAPFAC_VX:description = "Map scale factor on v-grid, x direction" ; \
> MAPFAC_VX:units = "" ; \
> V-grid的地图在纬向的比例系数 \
> x方向上v-格点处的地图比例系数 

- MF_VX_INV: Inverse map scale factor on v-grid, x direction 1除以x方向上v-格点处的地图比例系数
> float MF_VX_INV(Time, south_north_stag, west_east) ; \
> MF_VX_INV:description = "Inverse map scale factor on v-grid, x direction" \
> MF_VX_INV:units = "" ; \
> 1除以x方向上v-格点处的地图比例系数 

- MAPFAC_VY: Map scale factor on v-grid, y direction V-grid的地图在经向的比例系数
> float MAPFAC_VY(Time, south_north_stag, west_east) ; \
> MAPFAC_VY:description = "Map scale factor on v-grid, y direction" ; \
> MAPFAC_VY:units = "" ; \
> V-grid的地图在经向的比例系数 \
> y方向上v-格点处的地图比例系数 

- F: Coriolis sine latitude term 科氏力中sin(Ω)的部分，Ω为纬度

F=Coriolis sine latitude term 科里奥利正弦纬度项，单位：s-1
> float F(Time, south_north, west_east) ; \
> F:description = "Coriolis sine latitude term" ; \
> F:units = "s-1" ; \
> 科氏力中sin(Ω)的部分，Ω为纬度 

- E: Coriolis cosine latitude term 科氏力中cos(Ω)的部分，Ω为纬度

E=Coriolis cosine latitude term 科里奥利余弦纬度项，单位：s-1
> float E(Time, south_north, west_east) ; \
> E:description = "Coriolis cosine latitude term" ; \
> E:units = "s-1" ; \
> 科氏力中cos(Ω)的部分，Ω为纬度 

- SINALPHA: Local sine of map rotation 局地sin（地图旋转角）

SINALPHA= local sine of map rotation 地图旋转的局部正弦，单位：s-1
> float SINALPHA(Time, south_north, west_east) ; \
> SINALPHA:description = "Local sine of map rotation" ; \
> SINALPHA:units = "" ; \
> 局地sin（地图旋转角） 

- COSALPHA: Local cosine of map rotation 局地cos（地图旋转角）

COSALPHA=local cosine of map rotation 地图旋转的局部余弦，单位：s-1
> float COSALPHA(Time, south_north, west_east) ; \
> COSALPHA:description = "Local cosine of map rotation" ; \
> COSALPHA:units = "" ; \
> 局地cos（地图旋转角） 

- HGT: Terrain Height 地形高度
> float HGT(Time, south_north, west_east) ; \
> HGT:description = "Terrain Height" ; \
> HGT:units = "m" ; \
> 地形高度 

- HGT_SHAD: Height of orographic shadow 山岳背光坡的高度/地形影子的高度
> float HGT_SHAD(Time, south_north, west_east) ; \
> HGT_SHAD:description = "Height of orographic shadow" ; \
> HGT_SHAD:units = "m" ; \
> 山岳背光坡的高度/地形影子的高度 

- TSK: SURFACE SKIN TEMPERATURE 地表温度
> float TSK(Time, south_north, west_east) ; \
> TSK:description = "SURFACE SKIN TEMPERATURE" ; \
> TSK:units = "K" ; \
> 地表温度 

- P_TOP: PRESSURE TOP OF THE MODEL 模式顶的气压

P_TOP=pressure top of the model 模式顶部压力，单位：Pa
> float P_TOP(Time) ; \
> P_TOP:description = "PRESSURE TOP OF THE MODEL" ; \
> P_TOP:units = "Pa" ; \
> 模式顶的气压 

- MAX_MSTFX: Max map factor in domain 区域内最大地图比例系数

MAX_MSTFX=max map factor in domain 域中的最大地图因子
> float MAX_MSTFX(Time) ; \
> MAX_MSTFX:description = "Max map factor in domain" ; \
> MAX_MSTFX:units = "" ; \
> 区域内最大地图比例系数 

- RAINC: ACCUMULATED TOTAL CUMULUS PRECIPITATION 总的积云对流降水累积

RAINC=accumulated total cumulus precipitation 累积总积云降水量，单位：mm
> float RAINC(Time, south_north, west_east) ; \
> RAINC:description = "ACCUMULATED TOTAL CUMULUS PRECIPITATION" ; \
> RAINC:units = "mm" ; \
> 总的积云对流降水累积 \
> 累积的积云对流降水 

- RAINNC: ACCUMULATED TOTAL GRID SCALE PRECIPITATION 总的格点降水累积

RAINNC=accumulated total grid scale precipitation 累积总格网级降水量，单位：mm
> float RAINNC(Time, south_north, west_east) ; \
> RAINNC:description = "ACCUMULATED TOTAL GRID SCALE PRECIPITATION" ; \
> RAINNC:units = "mm" ; \
> 总的格点降水累积 \
> 累积的格点降水/非对流性降水 

- PRATEC: PRECIP RATE FROM CUMULUS SCHEME 由积云方案算的对流降水率
> float PRATEC(Time, south_north, west_east) ; \
> PRATEC:description = "PRECIP RATE FROM CUMULUS SCHEME" ; \
> PRATEC:units = "mm s-1" ; \
> 对流参数化降水比例 \
> 由积云方案算的对流降水率 

- RAINCV: TIME-STEP CUMULUS PRECIPITATION 对流降水的时间步长
> float RAINCV(Time, south_north, west_east) ; \
> RAINCV:description = "TIME-STEP CUMULUS PRECIPITATION" ; \
> RAINCV:units = "mm" ; \
> 对流降水的时间步长 \
> 计算对流降水的时间步长 

- SNOWNC: ACCUMULATED TOTAL GRID SCALE SNOW AND ICE 总的格点雪、冰累积

SNOWNC=accumulated total grid scale snow and ice 累积总格网级雪冰量，单位：mm
> float SNOWNC(Time, south_north, west_east) ; \
> SNOWNC:description = "ACCUMULATED TOTAL GRID SCALE SNOW AND ICE" ; \
> SNOWNC:units = "mm" ; \
> 总的格点雪、冰累积 \
> 累积的格点降雪和冰量 

- GRAUPELNC: ACCUMULATED TOTAL GRID SCALE GRAUPEL 总的格点雪丸累积

GRAUPELNC=accumulated total grid scale graupel 累积总网格级霰量，单位：mm
> float GRAUPELNC(Time, south_north, west_east) ; \
> GRAUPELNC:description = "ACCUMULATED TOTAL GRID SCALE GRAUPEL" ; \
> GRAUPELNC:units = "mm" ; \
> 总的格点雪丸累积 \
> 累积的格点降雪丸量 

- EDT_OUT: EDT FROM GD SCHEME Grell-Devenyi方案计算的edt场
> float EDT_OUT(Time, south_north, west_east) ; \
> EDT_OUT:description = "EDT FROM GD SCHEME" ; \
> EDT_OUT:units = "" ; \
> Grell-Devenyi方案计算的edt场 

- SWDOWN: DOWNWARD SHORT WAVE FLUX AT GROUND SURFACE 地表高度的向下的短波辐射通量

SWDOWN=downward short wave flux at ground surface 地表向下短波辐射通量，单位：W m-2
> float SWDOWN(Time, south_north, west_east) ; \
> SWDOWN:description = "DOWNWARD SHORT WAVE FLUX AT GROUND SURFACE" ; \
> SWDOWN:units = "W m-2" ; \
> 地表高度的向下的短波辐射通量 

- GLW: DOWNWARD LONG WAVE FLUX AT GROUND SURFACE 地表高度的向下的长波辐射通量

GLW=downward long wave flux at ground surface 地表向下长波辐射通量，单位：W m-2
> float GLW(Time, south_north, west_east) ; \
> GLW:description = "DOWNWARD LONG WAVE FLUX AT GROUND SURFACE" ; \
> GLW:units = "W m-2" ; \
> 地表高度的向下的长波辐射通量 

- OLR: TOA OUTGOING LONG WAVE TOA处的向上长波辐射通量

OLR=TOA OUTGOING LONG WAVE TOA输出长波，单位：W m-2
> float OLR(Time, south_north, west_east) ; \
> OLR:description = "TOA OUTGOING LONG WAVE" ; \
> OLR:units = "W m-2" ; \
> 向上的长波辐射 \
> TOA处的向上长波辐射通量 

- XLAT: LATITUDE, SOUTH IS NEGATIVE 质量点的纬度（南半球为负值）
> float XLAT(Time, south_north, west_east) ; \
> XLAT:description = "LATITUDE, SOUTH IS NEGATIVE" ; \
> XLAT:units = "degree_north" ; \
> 质量点的纬度（南半球为负值） 

- XLONG: LONGITUDE, WEST IS NEGATIVE 质量点的经度（西半球为负值）
> float XLONG(Time, south_north, west_east) ; \
> XLONG:description = "LONGITUDE, WEST IS NEGATIVE" ; \
> XLONG:units = "degree_east" ; \
> 经度，西半球为负值 \
> 质量点的经度（西半球为负值） 

- XLAT_U: LATITUDE, SOUTH IS NEGATIVE U-格点的纬度（南半球为负值）
> float XLAT_U(Time, south_north, west_east_stag) ; \
> XLAT_U:description = "LATITUDE, SOUTH IS NEGATIVE" ; \
> XLAT_U:units = "degree_north" ; \
> U-格点的纬度（南半球为负值） 

- XLONG_U: LONGITUDE, WEST IS NEGATIVE U-格点的经度（西半球为负值）
> float XLONG_U(Time, south_north, west_east_stag) ; \
> XLONG_U:description = "LONGITUDE, WEST IS NEGATIVE" ; \
> XLONG_U:units = "degree_east" ; \
> U-格点的经度（西半球为负值） 

- XLAT_V: LATITUDE, SOUTH IS NEGATIVE V-格点的纬度（南半球为负值）
> float XLAT_V(Time, south_north_stag, west_east) ; \
> XLAT_V:description = "LATITUDE, SOUTH IS NEGATIVE" ; \
> XLAT_V:units = "degree_north" ; \
> V-格点的纬度（南半球为负值） 

- XLONG_V: LONGITUDE, WEST IS NEGATIVE V-格点的经度（西半球为负值）
> float XLONG_V(Time, south_north_stag, west_east) ; \
> XLONG_V:description = "LONGITUDE, WEST IS NEGATIVE" ; \
> XLONG_V:units = "degree_east" ; \
> V-格点的经度（西半球为负值） 

- ALBEDO: ALBEDO 反照率
> float ALBEDO(Time, south_north, west_east) ; \
> ALBEDO:description = "ALBEDO" ; \
> ALBEDO:units = "-" ; \
> 反照率 

- ALBBCK: BACKGROUND ALBEDO 背景反照率
> float ALBBCK(Time, south_north, west_east) ; \
> ALBBCK:description = "BACKGROUND ALBEDO" ; \
> ALBBCK:units = "" ; \
> 背景反照率 

- EMISS: SURFACE EMISSIVITY 地面辐射系数

EMISS=SURFACE EMISSIVITY 表面发射率
> float EMISS(Time, south_north, west_east) ; \
> EMISS:description = "SURFACE EMISSIVITY" ; \
> EMISS:units = "" ; \
> 地面辐射系数 \
> 地面发射率 

- TMN: SOIL TEMPERATURE AT LOWER BOUNDARY 在更低的边界的土壤温度

TMN=SOIL TEMPERATURE AT LOWER BOUNDARY 下边界土壤温度，单位:K
> float TMN(Time, south_north, west_east) ; \
> TMN:description = "SOIL TEMPERATURE AT LOWER BOUNDARY" ; \
> TMN:units = "K" ; \
> 在更低的边界的土壤温度 

- XLAND: LAND MASK (1 FOR LAND, 2 FOR WATER) land mask（1是陆地，2是水体）
> float XLAND(Time, south_north, west_east) ; \
> XLAND:description = "LAND MASK (1 FOR LAND, 2 FOR WATER)" ; \
> XLAND:units = "" ; \
> land mask（1是陆地，2是水体），不知与上面的LANDMASK有啥差别 

- UST: U* IN SIMILARITY THEORY 相似性理论中的摩擦速度

UST=UIN SIMILARITY THEORY 相似理论中的U*,单位：m s-1
> float UST(Time, south_north, west_east) ; \
> UST:description = "U* IN SIMILARITY THEORY" ; \
> UST:units = "m s-1" ; \
> 相似性理论中的摩擦速度 

- PBLH: PBL HEIGHT 行星边界层高度

PBLH=PBL HEIGHT 大气边界层高度，单位：m
> float PBLH(Time, south_north, west_east) ; \
> PBLH:description = "PBL HEIGHT" ; \
> PBLH:units = "m" ; \
> 行星边界层高度 

- HFX: UPWARD HEAT FLUX AT THE SURFACE 地表面处向上的热量通量（感热通量）

HFX=UPWARD HEAT FLUX AT THE SURFACE 表面向上热流密度,单位：W m-2
> float HFX(Time, south_north, west_east) ; \
> HFX:description = "UPWARD HEAT FLUX AT THE SURFACE" ; \
> HFX:units = "W m-2" ; \
> 地表面处向上的热量通量（感热通量） 

- QFX: UPWARD MOISTURE FLUX AT THE SURFACE 地表面处向上的水汽通量

QFX=UPWARD MOISTURE FLUX AT THE SURFACE 表面向上的水分通量,单位：kg m-2 s-1
> float QFX(Time, south_north, west_east) ; \
> QFX:description = "UPWARD MOISTURE FLUX AT THE SURFACE" ; \
> QFX:units = "kg m-2 s-1" ; \
> 地表面处向上的水汽通量 

- LH: LATENT HEAT FLUX AT THE SURFACE 地表面处的潜热通量
> float LH(Time, south_north, west_east) ; \
> LH:description = "LATENT HEAT FLUX AT THE SURFACE" ; \
> LH:units = "W m-2" ; \
> 地表面处的潜热通量 

- SNOWC: FLAG INDICATING SNOW COVERAGE (1 FOR SNOW COVER) 雪盖标志（1是雪盖）

SNOWC=FLAG INDICATING SNOW COVERAGE (1 FOR SNOW COVER) 指示积雪覆盖的旗帜（1个用于积雪覆盖）
> float SNOWC(Time, south_north, west_east) ; \
> SNOWC:description = "FLAG INDICATING SNOW COVERAGE (1 FOR SNOW COVER)" ; \
> SNOWC:units = "" ; \
> 雪盖标志（1是雪盖） \
> 雪盖标志（1是有雪） 

- Var_SSO =variance of subgrid-scale orography 次格网尺度地形变化，单位m2
- THIS_IS_AN_IDEAL_RUN=T/F flag: this is an ARW ideal simulation T/F标志：这是一个ARW理想模拟
- P_HYD= hydrostatic pressure 静水压力，单位:Pa，静水压力是由均质流体作用于一个物体上的压力，这是全方位的力，并均匀地施向物体表面的各个部位。静水压力增大，会使受力物体的体积缩小，但不会改变其形状。
- QICE=ice mixing ratio 冰混合比，单位：kg kg-1
- QSNOW=snow mixing ratio 雪混合比，单位：kg kg-1
- QGRAUP=graupel mixing ratio 霰石混合比，单位：kg kg-1
- SHDMAX=annual max veg fraction 年最大植被覆盖度
- SHDMIX=annual min veg fraction 年最小植被覆盖度
- SNOALB=annual max snow albedo in fraction 年最大积雪反照率分数
- SMCREL=relative soil moisture 相对土壤湿度
- ACGRDFLX=accumulated ground heat flux 热通量周围累积，单位：J m-2
- ACSNOM=accumulate melted snow 积雪融化，单位：kg m-2
- SSTSK=skin sea surface temperature 表层海水温度，单位：K
- COSZEN=cos of solar zenith angle 太阳天顶角的cos
- LAI=leaf area index 植被指数，单位：m-2/m-2
- VAR=orographic variance 地形变化
- T00=base state temperature 基态气温，单位:K
- P00=base state pressure 基态压力，单位：Pa
- TLP= base state lapse rate 基态失效率
- TISO=temp at which the base T turns const 单位：K
- TLP_STRAT=base state lapse in stratosphere 平流层基态衰减，单位：K
- P_STRAT=base state pressure at bottom of stratosphere 平流层底部的基态压力，单位：Pa
- RAINSH=accumulated shallow cumulus precipitation 累积浅积云降水量，单位：mm
- HAILNC=accumulated total grid scale hail 累积总格网尺度冰雹，单位：mm
- REFL_10CM=radar reflectivity (lamda=10cm) 雷达放射率，单位：dBZ
- CLDFRA= cloud fraction 云分数
- SWNORM=normal short wave flux at ground surface 地表法向短波辐射通量，单位：W m-2
- ACSWUPT=accumulated upwelling shortwave flux at top 顶部累积上升流短波通量，单位：J m-2
- ACSWUPTC=ACCUMULATED UPWELLING CLEAR SKY SHORTWAVE FLUX AT TOP 顶部累积上升流晴空短波通量，单位：J m-2
- ACSWDNT=ACCUMULATED DOWNWELLING SHORTWAVE FLUX AT TOP  顶部累积下涌短波通量，单位：J m-2
- ACSWDNTC=ACCUMULATED DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT TOP 顶部累积下沉晴空短波通量，单位：J m-2
- ACSWUPB=ACCUMULATED UPWELLING SHORTWAVE FLUX AT BOTTOM 底部累积上升流短波通量，单位：J m-2
- ACSWUPBC=ACCUMULATED UPWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM 底部累积上升流晴空短波通量，单位：J m-2
- ACSWDNB=ACCUMULATED DOWNWELLING SHORTWAVE FLUX AT BOTTOM 底部累积下涌短波通量，单位：J m-2
- ACSWDNBC=ACCUMULATED DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM 底部累积下沉晴空短波通量，单位：J m-2
- ACLWUPT=ACCUMULATED UPWELLING LONGWAVE FLUX AT TOP 顶部累积上升流长波通量，单位：J m-2
- ACLWUPTC=ACCUMULATED UPWELLING CLEAR SKY LONGWAVE FLUX AT TOP 顶部累积上升流晴空长波通量，单位：J m-2
- ACLWDNT=ACCUMULATED DOWNWELLING LONGWAVE FLUX AT TOP 顶部累积下涌长波通量，单位：J m-2
- ACLWDNTC=ACCUMULATED DOWNWELLING CLEAR SKY LONGWAVE FLUX AT TOP 顶部累积下沉晴空长波通量，单位：J m-2
- ACLWUPB=ACCUMULATED UPWELLING LONGWAVE FLUX AT BOTTOM 底部累积上升流长波通量，单位：J m-2
- ACLWUPBC=ACCUMULATED UPWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM 底部累积上升流晴空长波通量，单位：J m-2
- ACLWDNB=ACCUMULATED DOWNWELLING LONGWAVE FLUX AT BOTTOM 底部累积下涌长波通量，单位：J m-2
- ACLWDNBC=ACCUMULATED DOWNWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM 底部累积下沉晴空长波通量，单位：J m-2
- SWUPT=INSTANTANEOUS UPWELLING SHORTWAVE FLUX AT TOP 顶部瞬时上升流短波通量，单位：W m-2
- SWUPTC=INSTANTANEOUS UPWELLING CLEAR SKY SHORTWAVE FLUX AT TOP 顶部瞬时上升流晴空短波通量，单位：W m-2
- SWDNT=INSTANTANEOUS DOWNWELLING SHORTWAVE FLUX AT TOP 顶部瞬时下沉短波通量 ，单位：W m-2
- SWDNTC=INSTANTANEOUS DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT TOP 顶部瞬时下沉晴空短波通量，单位：W m-2
- SWUPB=INSTANTANEOUS UPWELLING SHORTWAVE FLUX AT BOTTOM 底部瞬时上升流短波通量，单位：W m-2
- SWUPBC=INSTANTANEOUS UPWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM 底部瞬时上升流晴空短波通量，单位：W m-2
- SWDNB=INSTANTANEOUS DOWNWELLING SHORTWAVE FLUX AT BOTTOM 底部瞬时下沉短波通量，单位：W m-2
- SWDNBC=INSTANTANEOUS DOWNWELLING CLEAR SKY SHORTWAVE FLUX AT BOTTOM 底部瞬时下沉晴空短波通量，单位：W m-2
- LWUPT=INSTANTANEOUS UPWELLING LONGWAVE FLUX AT TOP 顶部瞬时上升流长波通量，单位：W m-2
- LWUPTC=INSTANTANEOUS UPWELLING CLEAR SKY LONGWAVE FLUX AT TOP 顶部瞬时上升流晴空长波通量，单位：W m-2
- LWDNT=INSTANTANEOUS DOWNWELLING LONGWAVE FLUX AT TOP 顶部瞬时下沉长波通量，单位：W m-2
- LWDNTC=INSTANTANEOUS DOWNWELLING CLEAR SKY LONGWAVE FLUX AT TOP 顶部瞬时下沉晴空长波通量，单位：W m-2
- LWUPB=INSTANTANEOUS UPWELLING LONGWAVE FLUX AT BOTTOM
- 底部瞬时上升流长波通量，单位：W m-2
- LWUPBC=INSTANTANEOUS UPWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM 底部瞬时上升流晴空长波通量，单位：W m-2
- LWDNB=INSTANTANEOUS DOWNWELLING LONGWAVE FLUX AT BOTTOM 底部瞬时下沉长波通量，单位：W m-2
- LWDNBC=INSTANTANEOUS DOWNWELLING CLEAR SKY LONGWAVE FLUX AT BOTTOM 底部瞬时下沉晴空长波通量，单位：W m-2
- NOAHRES=RESIDUAL OF THE NOAH SURFACE ENERGY BUDGET NOAH地表能量收支残差，单位：W m-2
- ACHFX=ACCUMULATED UPWARD HEAT FLUX AT THE SURFACE 表面累积向上热流，单位：J m-2
- ACLHF=ACCUMULATED UPWARD LATENT HEAT FLUX AT THE SURFACE 地表累积向上潜热通量，单位：J m-2
- PCB=base state dry air mass in column 柱内基态干空气质量，单位：Pa
- PC=perturbation dry air mass in column 柱内干空气质量扰动，单位：Pa
- LAKEMASK=LAKE MASK (1 FOR LAKE, 0 FOR NON-LAKE)












