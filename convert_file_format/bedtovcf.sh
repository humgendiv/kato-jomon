#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=00:30:00
#$ -l s_rt=00:30:00
#$ -l s_vmem=16G
#$ -l mem_req=16G
#$ -N convert_bed_tovcf
#$ -S /bin/bash


plink --bfile /home/mkato952/data/bed/bed_47p/J4_bed_47p --recode vcf bgz --out /home/mkato952/data/47prefecture/J4_for_47p