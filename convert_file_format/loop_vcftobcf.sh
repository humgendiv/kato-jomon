for sample in F23 I4 T5 FM020
do

    for chr in {1..22}
    do
        qsub vcftobcf.sh $sample $chr
        sleep 1
    done
done