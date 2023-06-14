#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=06:00:00
#$ -l s_rt=06:00:00
#$ -l s_vmem=128G
#$ -l mem_req=128G
#$ -N collect_1000
#$ -S /bin/bash

extract_product=$1 ;
extract_bim=$2 ;

if [ ! -d /home/mkato952/data/genomes_1000/$extract_product ]; then
    mkdir -p /home/mkato952/data/genomes_1000/$extract_product ;
fi

cd /home/mkato952/data/genomes_1000/ ;

for chr in {1..22}; do
    plink --noweb \
      --bcf chr"${chr}".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.bcf \
      --keep-allele-order \
      --extract $extract_bim \
      --vcf-idspace-to _ \
      --const-fid \
      --allow-extra-chr 0 \
      --split-x b37 no-fail \
      --make-bed \
      --out ./$extract_product/chr"${chr}".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes ;
done

cd $extract_product ;

find . -name "*.bim" > ForMerge.list ;
sed -i 's/.bim//g' ForMerge.list ;

plink --merge-list ForMerge.list --out Merge ;