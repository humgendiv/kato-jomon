#!/bin/bash

#$ -cwd
#$ -V
#$ -l medium
#$ -l d_rt=02:00:00
#$ -l s_rt=02:00:00
#$ -l s_vmem=16G
#$ -l mem_req=16G
#$ -N smartpca
#$ -S /bin/bash

smartpca -p $1