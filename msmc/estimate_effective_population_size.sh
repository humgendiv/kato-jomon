#!/bin/bash

#$ -cwd
#$ -V
#$ -l short
#$ -l d_rt=01:00:00
#$ -l s_rt=01:00:00
#$ -l s_vmem=32G
#$ -l mem_req=32G
#$ -N msmc
#$ -S /bin/bash


DATADIR=/home/mkato952/data/msmc/

INPUTDIR=$DATADIR/msmc_input/
OUTDIR="${DATADIR}effective_population_size/"

if [ ! -d $OUTDIR ]; then
    mkdir -p $OUTDIR
fi

sample=$1

msmc2 -t 6 -o $OUTDIR/$sample.msmc2 $INPUTDIR/$sample.chr{1..22}.multihetsep.txt