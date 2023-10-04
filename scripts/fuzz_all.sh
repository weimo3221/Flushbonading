#!/bin/bash

cur_root=`pwd`
dirlist=`find ./ -type d -name '*root*'`
echo core >/proc/sys/kernel/core_pattern

for dir in $dirlist 
do
    cd $dir
    export QEMU_LD_PREFIX=.
    chmod a-w .
    find . -type f -exec file {} \; | grep "ARM" | cut -d: -f1 | while read -r file; do
        # file_name=$(echo "$file" | tr '/' '-')
        fuzz_in="${file}_fuzz-in"
        fuzz_out="/opt/origin_output"
        mkdir -p $fuzz_in
        mkdir -p $fuzz_out
        if grep -q "unrar" "$file"; then
            afl-fuzz -D -i $fuzz_in -o $fuzz_out -Q "$file" e @@
        fi
    done
    cd $cur_root
done
