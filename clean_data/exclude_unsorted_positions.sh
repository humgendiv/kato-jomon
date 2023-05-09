DATADIR=/home/mkato952/data/clean_vcf/

zcat "${DATADIR}I4.vcf.gz" | \
awk 'BEGIN {
         prev_chrom = 0;
         prev_pos = 0
     }
     {
         if (($1 ~ /^#/ || (($1 == prev_chrom && $2 > prev_pos) || $1 > prev_chrom)) && !($1 ~ /#/)) {
             print;
             prev_chrom = $1;
             prev_pos = $2
         }
     }' | \
bgzip > ${DATADIR}I4_filtered.vcf.gz
