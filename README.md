# cmake_android_executable_template

A template project for building executable for android (including normal mode and recovery mode)

## Build & Run

1. install cmake
2. define these env vars
    ```bash
    $ export ANDROID_SDK_ROOT=xxx
    $ export ANDROID_HOME="${ANDROID_SDK_ROOT}"
    $ export ANDROID_NDK_HOME=xxx
    ```
3. open `build.sh` to see what profile you need, and feel free to edit this file
4. exec `./build.sh` to build
5. exec `./run.sh` to run on a connected device

**Note:** 
1. For recovery mode, you should mount `/system` as `r/w` before run.
2. For recovery mode, `libc` and `libm` are static linked.
3. ~~For recovery mode, you may got a link issue with c++ stl, so I suggest **Pure C** instead of c++ if you need recovery mode support~~
4. If c++ link issue occurred, try these steps in `CMakeLists.txt`
    ```cmake
    # If c++ link issue occurred (-ldl not found), uncomment line blow, then `rm -rf build` and try again
    # string(REPLACE "-nodefaultlibs -lgcc -lc -lm -ldl" "" CMAKE_CXX_STANDARD_LIBRARIES ${CMAKE_CXX_STANDARD_LIBRARIES})
    
    # If c++ link issue occurred (multiple definition of `operator delete(void*)'), uncomment line blow, then `rm -rf build` and try again
    #set(CMAKE_CXX_FLAGS "-fno-exceptions ${CMAKE_CXX_FLAGS}")
    ```
