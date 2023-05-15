for sample in I4 T5 FM020
do
    for chr in {1..22}
    do
        qsub execute_gen_multihetsep.sh $chr $sample
        echo "${chr}番染色体"
        sleep 1
    done
done