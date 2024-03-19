## `make.inc`:
```makefile
TOPDIR        = /work/odiaz/FVCOM/source/FVCOM_v4.4.5/FVCOM/src
INSTALLDIR    = $(TOPDIR)/libs/install
# LOCAL INSTAL
             LIBDIR       =  -L$(INSTALLDIR)/lib
             INCDIR       =  -I$(INSTALLDIR)/include
             
#	STANDARD LIBRARIES FOR DATA AND TIME IN fVCOM:
#
	    DTLIBS	= $(LIBDIR) -ljulian
	    DTINCS	= $(INCDIR)           
	    
FLAG_USE_NETCDF4     = -DUSE_NETCDF4
             IOLIBS       =  -L/work/odiaz/libraries/netcdf/4.9.0/intel/2022.0.2/lib  -lnetcdff -lnetcdf
             IOINCS       =  -I/work/odiaz/libraries/netcdf/4.9.0/intel/2022.0.2/include

             FLAG_4 = -DMULTIPROCESSOR
             FLAG_411 = -DMETIS_5
             PARLIB = -lmetis              
             PARTINCS = $(INCDIR)
             PARTLIBS = $(LIBDIR)	  
             
             FLAG_6 = -DPROJ
             PROJLIBS       = $(LIBDIR) -lfproj4 -lproj -lm
             PROJINCS       = $(INCDIR)     
             
#--------------------------------------------------------------------------
#  Intel/MPI Compiler Definitions (SMAST)      
#--------------------------------------------------------------------------
         CPP      = /usr/bin/cpp
         COMPILER = -DIFORT  
         CC       = mpicc
         CXX      = mpicxx
         CFLAGS   = -O3 
         FC       = mpif90
         OPT      = -O3 
```

## Environment variable

```shell
export FVCOM_libs=/work/odiaz/FVCOM/source/FVCOM_v4.4.6/FVCOM/src/libs/install
export PATH=$FVCOM_libs/bin:$PATH
export INCLUDE=$FVCOM_libs/include:$INCLUDE
export LD_LIBRARY_PATH=$FVCOM_libs/lib:$LD_LIBRARY_PATH
export LIBPATH=$FVCOM_libs/lib
export INCLUDEPATH=$FVCOM_libs/include
```


## `metis-5.1.0.tgz`:
```shell
    tar -xvzf metis-5.1.0.tgz
    cd metis/GKlib
    make cc=mpicc cxx=mpicxx openmp=ON config
    make
    cd ..
    make cc=mpicc cxx=mpicxx openmp=ON gklib_path=./GKlib prefix=/work/odiaz/FVCOM/source/FVCOM_v4.4.6/FVCOM/src/libs/install config
    make install
```
