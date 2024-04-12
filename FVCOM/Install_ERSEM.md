
[toc]

# ERSEM


## [Install ERSEM](https://ersem.readthedocs.io/en/latest/tutorials/fvcom.html)
**说明写的是需要FVCOM UK version，实际使用的是FVCOM原版**
由于intel2019编译器编译netcdf3.6.3时出现错误，所以使用netcdf4版本，
但是FVCOM-UK编译时报错，不确定是否是netcdf4的原因，多次测试无果之后
选择用FVCOM原版尝试，成功

**文档上原来写的`FABM=$CODE_DIR/fabm/src`需要改成`FABM=$CODE_DIR/fabm/`**

**[改完之后的版本](./Install_ersem.sh)**


[make_ideal_estuary.inc原版本](https://ersem.readthedocs.io/en/latest/tutorials/fvcom.html)

**[make_ideal_estuary.inc改后的版本](./make_ideal_estuary.inc)**

**注意更改编译器、NETCDF的路径**
