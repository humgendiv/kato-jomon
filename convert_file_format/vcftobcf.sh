#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=02:30:00
#$ -l s_rt=02:30:00
#$ -l s_vmem=128G
#$ -l mem_req=128G
#$ -N convert_vcf_tobcf
#$ -S /bin/bash

DATADIR=/home/mkato952/data/
SAMPLE_NAME=$1

bcftools norm -m-any --check-ref w -f $DATADIR/reference/human_g1k_v37.fasta "${DATADIR}clean_vcf/${SAMPLE_NAME}.vcf.gz" |
bcftools annotate -x ID -I +'%CHROM:%POS' | \
bcftools norm -Ob --rm-dup both > "${DATADIR}bcf/${SAMPLE_NAME}.bcf"
bcftools index "${DATADIR}bcf/${SAMPLE_NAME}.bcf"