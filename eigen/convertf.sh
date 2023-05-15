#!/bin/bash

#$ -cwd
#$ -V
#$ -l intel
#$ -l d_rt=03:00:00
#$ -l s_rt=03:00:00
#$ -l s_vmem=32G
#$ -l mem_req=32G
#$ -N converf
#$ -S /bin/bash

convertf -p $1
