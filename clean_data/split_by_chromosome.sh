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

# vcf.gzファイルのいらない行を削除していく。formatも整える。

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

zcat $DATADIR$FILENAME | bgzip > $DATADIR$FILENAME.bz
rm $DATADIR$FILENAME
mv $DATADIR$FILENAME.bz $DATADIR$FILENAME

bcftools index $DATADIR$FILENAME

bcftools index -s $DATADIR$FILENAME | \
cut -f 1 | \
while read C; do bcftools view -O z -o $OUTPUTDIR/split.${C}.vcf.gz $DATADIR$FILENAME "${C}" ; done