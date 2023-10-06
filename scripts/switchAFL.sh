#!/bin/bash

if [ $# -eq 0 ]; then
  echo "未提供命令行参数。"
  exit 1
fi

cd /opt/AFLplusplus
mv /opt/src/afl-fuzz-one.c ./src/afl-fuzz-one.c
if [ "$1" = "LL" ]; then
    new_content="  int check_system = system(\"cd /opt/src && python moduleload-LL.py\");"
    sed -i "618s/.*/${new_content}/" "./src/afl-fuzz-one.c"
fi
if [ "$1" = "TT" ]; then
    new_content="  int check_system = system(\"cd /opt/src && python moduleload-TT.py\");"
    sed -i "618s/.*/${new_content}/" "./src/afl-fuzz-one.c"
fi
make && make install
cd /opt/firmwares