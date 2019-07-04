#!/usr/bin/env bash


abi=$(adb shell getprop ro.product.cpu.abi)
# armeabi armeabi-v7a arm64-v8a ...
echo "Architecture: ${abi}"

bootMode=$(adb shell getprop ro.bootmod)
if [[ ${bootMode} == "" ]]; then
    bootMode=$(adb shell getprop ro.boot.mode)
fi
if [[ ${bootMode} == "" ]]; then
    echo "Cannot determine boot mode"
    exit 1
fi
echo "BootMode: ${bootMode}"


if [[ ${bootMode} == "recovery" ]]; then
    pushDir=/system
else
    pushDir=/data/local/tmp
    bootMode=normal
fi

hostExecutable=build/Release-${abi}-${bootMode}/android_hello_world
deviceExecutable=${pushDir}/android_hello_world

adb push ${hostExecutable} ${deviceExecutable}
adb shell chmod 755 ${deviceExecutable}
adb shell ${deviceExecutable}