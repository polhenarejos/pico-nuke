#!/bin/bash

VERSION_MAJOR="1"
VERSION_MINOR="4"

if [ ! -d "build_release" ]; then
  mkdir build_release
fi
if [ ! -d "release" ]; then
    mkdir release
fi
cd release
rm -rf *
cd ../build_release

PICO_SDK_PATH="${PICO_SDK_PATH:-../../pico-sdk}"
board_dir=${PICO_SDK_PATH}/src/boards/include/boards
for board in "$board_dir"/*
do
    board_name="$(basename -- $board .h)"
    rm -rf *
    PICO_SDK_PATH="${PICO_SDK_PATH}" cmake .. -DPICO_BOARD=$board_name -DSECURE_BOOT_PKEY=../../ec_private_key.pem
    make -j`nproc`
    mv flash_nuke.uf2 ../release/pico_nuke_$board_name-$VERSION_MAJOR.$VERSION_MINOR.uf2

done
