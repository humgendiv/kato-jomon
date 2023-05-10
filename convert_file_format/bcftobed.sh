#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=00:20:00
#$ -l s_rt=00:20:00
#$ -l s_vmem=16G
#$ -l mem_req=16G
#$ -N convert_bcf_tobed
#$ -S /bin/bash

DATADIR=/home/mkato952/data/
BCFDIR="${DATADIR}bcf/${1}"
BEDDIR="${DATADIR}bed/bed_47p/${1}"/
if [ ! -d $BEDDIR ]; then
    mkdir -p $BEDDIR
fi
EXTRACT="${DATADIR}47prefecture/array_ID_ken.txt"


CHR=$2
SAMPLE_NAME="${1}.chr${2}.bcf"

plink --noweb --bcf ${BCFDIR}/${SAMPLE_NAME} --extract $EXTRACT --keep-allele-order --vcf-idspace-to _ --const-fid --allow-extra-chr 0 --split-x b37 no-fail --make-bed \
--out "${BEDDIR}${1}.chr${2}" --memory 15000