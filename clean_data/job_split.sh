#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=24:00:00
#$ -l s_rt=24:00:00
#$ -l s_vmem=8G
#$ -l mem_req=8G
#$ -N split_data
#$ -S /bin/bash

python3 /home/mkato952/Repo/kato-jomon/clean_data/split_by_chromosome.py $1