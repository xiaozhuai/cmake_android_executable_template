cmake_minimum_required(VERSION 3.0)
project(test_android_fb)

if (${ANDROID_RECOVERY_MODE})
    message(STATUS "Android recovery mode")
    set(CMAKE_EXE_LINKER_FLAGS "-static ${CMAKE_EXE_LINKER_FLAGS}")
endif ()

set(BUILD_TARGET test_android_fb)

add_executable(${BUILD_TARGET} main.c)
