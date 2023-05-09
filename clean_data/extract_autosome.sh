DATADIR="/home/mkato952/data/clean_vcf/"

SAMPLE_NAME="FM020"

zcat "${DATADIR}/${SAMPLE_NAME}.vcf.gz" | awk '!/^M/' | bgzip > "${DATADIR}/${SAMPLE_NAME}.autosome.vcf.gz"