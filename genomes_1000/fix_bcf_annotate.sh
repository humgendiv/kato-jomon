#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=03:00:00
#$ -l s_rt=03:00:00
#$ -l s_vmem=16G
#$ -l mem_req=16G
#$ -N collect_1000
#$ -S /bin/bash

cd /home/mkato952/data/genomes_1000/

prefix="ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr" ;

suffix=".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz" ;

# for chr in {1..22}; do
#    wget "${prefix}""${chr}""${suffix}" "${prefix}""${chr}""${suffix}".tbi ;
# done

# wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/working/20130606_sample_info/20130606_g1k.ped

for chr in {1..22}; do
    bcftools norm -m-any --check-ref w -f /home/mkato952/data/reference/human_g1k_v37.fasta \
      ALL.chr"${chr}".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.bcf | \
      bcftools annotate -x ID -I +'%CHROM:%POS' | \
        bcftools norm -Ob --rm-dup both \
          > chr"${chr}".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.bcf ;

    bcftools index chr"${chr}".phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.bcf ;
done
