#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=01:00:00
#$ -l s_rt=01:00:00
#$ -l s_vmem=64G
#$ -l mem_req=64G
#$ -N split_by_chromosome
#$ -S /bin/bash

DATADIR=/home/mkato952/data/clean_vcf/
# DATADIRが存在しない場合は作成する
if [ ! -d $DATADIR ]; then
    mkdir -p $DATADIR
fi

FILENAME=$1

BASENAME=${FILENAME%.*}
OUTPUTDIR=/home/mkato952/data/clean_vcf/$BASENAME/
if [ ! -d $OUTPUTDIR ]; then
    mkdir -p $OUTPUTDIR
fi

# 1. vcfファイルをbgzipで展開する
zcat $DATADIR$FILENAME | \
# 2. 展開したファイルに対して各行で以下の処理を行う。
# 2-1. 1列目の文字列が1から22,X,Y,MT以外の場合はその行を削除する。ただし#で始まる行は削除しない。

# 2-2. 1列目の文字列が1から22,X,Y,MTの場合は、その行を各ファイルに出力する
awk -F'\t' '{
    if ($0 ~ /^#/) {
        header = header $0 "\n"
    } else {
        file = "chr" $1 ".vcf.gz"
        if (!seen[file]++) {
            print header | bgzip > file
        }
        print | "bgzip >> " file
    }
}'

