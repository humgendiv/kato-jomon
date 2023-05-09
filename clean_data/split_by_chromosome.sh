#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=00:30:00
#$ -l s_rt=00:30:00
#$ -l s_vmem=8G
#$ -l mem_req=8G
#$ -N split_by_chromosome
#$ -S /bin/bash

## !!!これで動くならそれに越したことはないが、うまくいかない場合はsplit_by_chromosome2.shを試すこと!!!

DATADIR=/home/mkato952/data/clean_vcf/
# DATADIRが存在しない場合は作成する
if [ ! -d $DATADIR ]; then
    mkdir -p $DATADIR
fi

SAMPLE_NAME=$1
CHR=$2

FILENAME="${1}.vcf.gz"
BASENAME=$SAMPLE_NAME
OUTPUTDIR=/home/mkato952/data/clean_vcf/$BASENAME/
if [ ! -d $OUTPUTDIR ]; then
    mkdir -p $OUTPUTDIR
fi


bcftools filter "${DATADIR}${FILENAME}" -r $CHR | bgzip > "${OUTPUTDIR}${SAMPLE_NAME}.chr${CHR}.vcf.gz"