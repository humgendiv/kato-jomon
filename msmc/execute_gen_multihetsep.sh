#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=01:00:00
#$ -l s_rt=01:00:00
#$ -l s_vmem=8G
#$ -l mem_req=8G
#$ -N bamcaller
#$ -S /bin/bash

DATADIR=/home/mkato952/data/msmc/
chr=$1

OUTDIR="${DATADIR}msmc_input"

sample_mask="_chr${chr}_mask.bed.gz"

sample_vcf="_chr${chr}.vcf.gz"

ref_mask="/home/mkato952/data/reference/ref_masks/hs37d5_chr${chr}.mask.bed"

/home/mkato952/msmc/msmc-tools/generate_multihetsep.py \
--mask="${DATADIR}I4${sample_mask}" --mask="${DATADIR}T5${sample_mask}" --mask="${DATADIR}FM020${sample_mask}" --mask=$ref_mask \
 "${DATADIR}I4${sample_vcf}" "${DATADIR}T5${sample_vcf}" "${DATADIR}FM020${sample_vcf}" > $OUTDIR/T5I4FM020.chr${chr}.multihetsep.txt