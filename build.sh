#!/bin/bash
mkdir -p build
gcc -Wall -Bsymbolic -shared -o build/libgltun.so -fPIC main.c
