

## netcdf3.6.3

1. make check，遇到一个关于sfc_pres_temp_rd.cpp的错误

    ```shell
    vi sfc_pres_temp_rd.cpp
    ```

    改为

    ```cpp
    #include <iostream>
    #include <string.h>
    #include <netcdfcpp.h>
    ```

