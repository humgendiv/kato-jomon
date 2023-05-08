#!/usr/bin/env bash
DATADIR=/home/mkato952/data/msmc/

INPUTDIR=$DATADIR/msmc_input/
OUTDIR=$DATADIR/effective_population_size/

if [ ! -d $OUTDIR ]; then
    mkdir -p $OUTDIR
fi


msmc2 -t 6 -p 1*2+15*1+1*2 -o $OUTDIR/Jomon3div.msmc2 -I 0,1,2,3 $INPUTDIR/T5I4FM020.chr1.multihetsep.txt