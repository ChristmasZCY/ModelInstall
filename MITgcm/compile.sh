#!/bin/bash
#  -*- coding:UTF-8 -*-:

mkdir build code run
cd build || exit
../../../tools/genmake2 -mods ../code -mpi -of ../../../tools/build_options/linux_amd64_ifort11
make depend
echo "Change Makefile -ip to -p"
echo "Delete -xHost in Makefile"
exit
make -j 4
cd ../run || exit
ln -s ../build/mitgcmuv .
mpirun -np 4 ./mitgcmuv
