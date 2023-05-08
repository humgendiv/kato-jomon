BCFDIR=/home/mkato952/data/bcf/
BEDDIR=/home/mkato952/data/bed/
SAMPLE_NAME="${1}.bcf"

plink --noweb --bcf ${BCFDIR}/${SAMPLE_NAME} --keep-allele-order --vcf-idspace-to _ --const-fid --allow-extra-chr 0 --split-x b37 no-fail --makebed \
--out $BEDDIR/${1}