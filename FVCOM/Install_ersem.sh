#!/usr/bin/env bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CODE_DIR=$SCRIPT_DIR/code
INSTALL_DIR=$SCRIPT_DIR/model

num_cpu=$(nproc)

website=("https://github.com/UK-FVCOM-Usergroup/uk-fvcom.git" "https://github.com/pmlmodelling/ersem.git" "https://github.com/fabm-model/fabm.git")
name=("uk-fvcom" "ersem" "fabm")
branch=("FVCOM-FABM" "master" "master")

mkdir $CODE_DIR
cd $CODE_DIR || exit

echo "Obtaining source code"
for i in 0 1 2
do
    git clone ${website[i]} ${name[i]}
    cd ${name[i]} || exit
    git checkout ${branch[i]}
    cd $CODE_DIR || exit
done

cd $SCRIPT_DIR || exit

FABM=$CODE_DIR/fabm
ERSEM=$CODE_DIR/ersem
FABM_INSTALL=$INSTALL_DIR/FABM-ERSEM
FC=$(which mpifort)

mkdir -p $FABM_INSTALL

cd $FABM || exit
mkdir build
cd build || exit
# Production config:
cmake $FABM -DFABM_HOST=fvcom -DFABM_ERSEM_BASE=$ERSEM -DCMAKE_Fortran_COMPILER=$FC -DCMAKE_INSTALL_PREFIX=$FABM_INSTALL
# cmake ../../ -DFABM_HOST=fvcom -DFABM_ERSEM_BASE=/home/ocean/zcy/hhhhhh/code/ersem -DCMAKE_Fortran_COMPILER=mpifort -DCMAKE_INSTALL_PREFIX=/home/ocean/zcy/hhhhhh/model/FABM-ERSEM
make install -j $num_cpu
mkdir -p $FABM_INSTALL/lib
cp libfabm.a $FABM_INSTALL/lib

cd $SCRIPT_DIR || exit

sed -i 's|BASE_SETUP_DIR|'"$SCRIPT_DIR"'|g' make_ideal_estuary.inc
ln -s $SCRIPT_DIR/make_ideal_estuary.inc $SCRIPT_DIR/code/uk-fvcom/FVCOM_source/make.inc

# Installing FVCOM additional packages (METIS, Proj, etc)
##============UK版本============##
#cd $SCRIPT_DIR/code/uk-fvcom/FVCOM_source/libs || exit
#mv makefile makefile_
#ln -s makefile.CETO makefile
#make -j $num_cpu
##============US版本============##
#cd $SCRIPT_DIR/code/uk-fvcom/FVCOM_source/libs || exit
# 同fvcom编译lib方法

# Building FVCOM
cd ..
make -j $num_cpu
