#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=02:00:00
#$ -l s_rt=02:00:00
#$ -l s_vmem=200G
#$ -l mem_req=200G
#$ -N convert_bcf_tobed
#$ -S /bin/bash

DATADIR=/home/mkato952/data/
BCFDIR="${DATADIR}bcf/"
BEDDIR="${DATADIR}bed/"
EXTRACT="${DATADIR}AADR/1240K.bim"
SAMPLE_NAME="${1}.bcf"

plink --noweb --bcf ${BCFDIR}/${SAMPLE_NAME} --extract $EXTRACT --keep-allele-order --vcf-idspace-to _ --const-fid --allow-extra-chr 0 --split-x b37 no-fail --make-bed \
--out $BEDDIR/${1}