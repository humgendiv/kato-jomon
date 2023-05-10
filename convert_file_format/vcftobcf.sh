#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=00:30:00
#$ -l s_rt=00:30:00
#$ -l s_vmem=16G
#$ -l mem_req=16G
#$ -N convert_vcf_tobcf
#$ -S /bin/bash

DATADIR=/home/mkato952/data/
SAMPLE_NAME=$1
INPUTDIR="${DATADIR}clean_vcf/${SAMPLE_NAME}/"
OUTPUTDIR="${DATADIR}bcf/${SAMPLE_NAME}/"
if [ ! -d $OUTPUTDIR ]; then
    mkdir -p $OUTPUTDIR
fi
CHR=$2

INPUTFILE="${INPUTDIR}${SAMPLE_NAME}.chr${CHR}.vcf.gz"
OUTPUTFILE="${OUTPUTDIR}${SAMPLE_NAME}.chr${CHR}.bcf"

bcftools norm -m-any --check-ref w -f $DATADIR/reference/human_g1k_v37.fasta $INPUTFILE |
bcftools annotate -x ID -I +'%CHROM:%POS' | \
bcftools norm -Ob --rm-dup both > $OUTPUTFILE
bcftools index $OUTPUTFILE
