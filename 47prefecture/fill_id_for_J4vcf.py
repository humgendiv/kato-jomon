data_dir = "/home/mkato952/data/47prefecture/"
vcf_file = f"{data_dir}J4_for_47p.vcf"
ken_array = f"{data_dir}array_ID_ken.txt"

with open(vcf_file, mode='r') as vfile, open(ken_array, mode='r') as afile:
    vcf_lines = vfile.readlines()
    array_ids = [id.strip() for id in afile.readlines()]

    vcf_dict = {line.split()[2]: line for line in vcf_lines if not line.startswith('#')}
    vcf_header = [line for line in vcf_lines if line.startswith('#')]
    print("辞書構築完了")

with open(f"{data_dir}J4_for_47p.filled.vcf", "w") as file:
    for header_line in vcf_header:
        file.write(header_line)

    for id in array_ids:
        # IDがvcfファイルに存在する場合、その行を書き込む。
        if id in vcf_dict:
            file.write(vcf_dict[id])
        # IDがVCFファイルに存在しない場合、補完する。
        else:
            chrom, pos = id.split(':')
            file.write(f"{chrom}\t{pos}\t{id}\t.\t.\t.\t.\tPR\tGT\t./.\t./.\t./.\t./.\n")

