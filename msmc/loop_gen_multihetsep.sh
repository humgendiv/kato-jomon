for chr in {1..22}
do
    qsub execute_gen_multihetsep.sh $chr
    echo "${chr}番染色体"
    sleep 1
done