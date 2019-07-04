cmake_minimum_required(VERSION 3.0)
project(android_hello_world)

if (${ANDROID_RECOVERY_MODE})
    message(STATUS "Android recovery mode")
    set(CMAKE_EXE_LINKER_FLAGS "-static ${CMAKE_EXE_LINKER_FLAGS}")
endif ()

set(BUILD_TARGET android_hello_world)

add_executable(${BUILD_TARGET} main.c)
