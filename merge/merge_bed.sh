#!/bin/bash

#!ここを変える！
bed_folder="bed_47p"

folder_path="/home/mkato952/data/bed/${bed_folder}" # フォルダのパスを指定する
for file in $(find "$folder_path" -type f -name "*.bim" -print); do
    echo "${file%.*}" # 拡張子'.bim'を省略して出力する
done > output.txt # 出力をファイルにリダイレクトする

plink --merge-list output.txt --out "${folder_path}/J4_${bed_folder}"

if test -e "${folder_path}/J4_${bed_folder}.missnp"; then
    while read line; do
        plink --make-bed --exclude "${folder_path}/J4_${bed_folder}.missnp" --bfile $line --out "${line}.tmp"
    done < output.txt
fi

while read line; do
    echo "$line.tmp" >> "output.tmp.txt"
done < output.txt

plink --merge-list output.tmp.txt --out "${folder_path}/J4_${bed_folder}"

rm output.txt
rm output.tmp.txt
rm "${folder_path}/J4_${bed_folder}.missnp"
find "$folder_path" -name "*tmp*" -type f -delete

