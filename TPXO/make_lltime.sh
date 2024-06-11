#!/bin/bash
# https://blog.csdn.net/zhuyuzz/article/details/121049907
#
# Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
# Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
# Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
# Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
# Vestibulum commodo. Ut rhoncus gravida arcu.
#

# lon
lon_min=117
lon_max=120
# lat
lat_min=10
lat_max=12
# interp
interps=0.1
# time
start_date=20210601
end_date=20210701    # 建议比最后时间多一天

rm ll_time lat_lon
# ==================================================
lons=($(seq ${lon_min} ${interps} ${lon_max}))
lats=($(seq ${lat_min} ${interps} ${lat_max}))

for llat in ${lats[@]}
do
        for llon in ${lons[@]}
        do
                echo "$llat $llon" >> lat_lon
        done
done

while [ $start_date != $end_date ]
do
echo $start_date
for hour in `seq -w 0 23`;do
        awk '{print $1,$2,'${start_date:0:4}','${start_date:4:2}','${start_date:6:2}','${hour}',0,0}' lat_lon >> ll_time
done
let start_date=`date -d "-1 days ago ${start_date}" +%Y%m%d`
done
