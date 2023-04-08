#!/bin/bash

for bin in *.bin
do
	binwalk -Me "$bin"
done

filelist=`find ./ -name 'squashfs-root'`
fs=()
for file in $filelist
do
    fs+=($file)
done
echo ${fs[@]}
tar czvf all.tar.gz ${fs[@]}
