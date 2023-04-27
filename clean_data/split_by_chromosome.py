import os
import sys
import gzip

input_dir = "/home/mkato952/data/clean_vcf/"
output_base_dir = "/home/mkato952/data/clean_vcf"

def split_vcf_by_chrom(input_file, output_dir):
    with gzip.open(os.path.join(input_dir, input_file), 'rt') as vcf:
        current_chrom_file = None
        current_chrom = None

        for line in vcf:
            if line.startswith('#'):
                if current_chrom_file is not None:
                    current_chrom_file.write(line)
            else:
                chrom = line.split('\t')[0]

                if chrom != current_chrom:
                    if current_chrom_file is not None:
                        current_chrom_file.close()

                    current_chrom = chrom
                    output_file_path = os.path.join(output_dir, f"{current_chrom}.vcf.gz")
                    current_chrom_file = gzip.open(output_file_path, 'wt')

                current_chrom_file.write(line)

        if current_chrom_file is not None:
            current_chrom_file.close()

if __name__ == "__main__":
    input_file = sys.argv[1]
    input_name_without_ext = os.path.splitext(input_file)[0]
    output_dir = os.path.join(output_base_dir, input_name_without_ext)

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    split_vcf_by_chrom(input_file, output_dir)
