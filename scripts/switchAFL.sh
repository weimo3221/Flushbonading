#!/bin/bash

cd /opt/AFLplusplus
mv /opt/src/afl-fuzz-one.c ./src/afl-fuzz-one-pro.c
mv ./src/afl-fuzz-one.c /opt/src
mv ./src/afl-fuzz-one-pro.c ./src/afl-fuzz-one.c
make && make install
cd /opt/firmwares