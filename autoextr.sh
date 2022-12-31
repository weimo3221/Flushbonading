#!/bin/bash
filelist=`ls ./`

for file in $filelist
do 
    if [[ "$file" = *.bin ]];then
        binwalk -Me $file --run-as=root  # 若binwalk需要增加其他选项，可以修改这里
    fi
done

fs=()
for file in $filelist
do
    if [[ "$file" = *.extracted ]];then
        binlist=`ls ./$file`
        for item in $binlist
        do
            if [[ "$item" = *-root ]];then
                fs+=(./$file/$item)
            fi
        done
    fi
done
echo ${fs[@]}
tar czvf all.tar.gz ${fs[@]}