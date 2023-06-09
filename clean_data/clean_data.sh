#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=03:00:00
#$ -l s_rt=03:00:00
#$ -l s_vmem=4G
#$ -l mem_req=4G
#$ -N clean_data
#$ -S /bin/bash

# vcf.gzファイルのいらない行を削除していく。formatも整える。

DATADIR=/home/mkato952/data/raw_vcf/
# DATADIRが存在しない場合は作成する
if [ ! -d $DATADIR ]; then
    mkdir -p $DATADIR
fi
OUTPUTDIR=/home/mkato952/data/clean_vcf/
# OUTPUTDIRが存在しない場合は作成する
if [ ! -d $OUTPUTDIR ]; then
    mkdir -p $OUTPUTDIR
fi

FILENAME="${1}.vcf.gz"

# 1. gzファイルを展開し、パイプを繋いで１行ずつ処理する
zcat $DATADIR$FILENAME | \
# 2. 各行の先頭が"chr"で始まる行は、その先頭のchrを削除する
awk '{if(substr($0,1,3)=="chr") print substr($0,4); else print $0}' | \
# 2. 各行の先頭が"##contig=<ID=chr"で始まる行は、その先頭の##contig=<ID=chrを##contig=<ID=にする
awk '{if(substr($0,1,16)=="##contig=<ID=chr") { sub("##contig=<ID=chr", "##contig=<ID=", $0); } print $0 }' | \
# 3. 各行の先頭が"#"で始まる行は、4の処理を行わない。
awk '{if(substr($0,1,1)!="#") print $0; else print $0}' | \
# 4. 各行の10列目の文字列について、コロンを区切り文字としてDPに当たる文字列が10未満の数字の場合その行を削除する。
awk -F '\t' '{
    if ($0 ~ /^#/) {
        print
    } else {
        split($9, col9_arr, ":");
        for (i in col9_arr) {
            if (col9_arr[i] == "DP") {
                dp_index = i;
                break;
            }
        }
        if (dp_index > 0) {
            split($10, col10_arr, ":");
            if (col10_arr[dp_index] >= 10) {
                print
            }
        }
    }
}' | \
# 5. 以上の処理を経たデータを、gz圧縮して、OUTPUTDIRディレクトリに保存する
bgzip > $OUTPUTDIR$FILENAME

