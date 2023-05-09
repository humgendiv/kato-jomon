for sample in I4;
do
    for chr in {1..22}
    do
        qsub split_by_chromosome.sh $sample $chr
        sleep 1
    done
done