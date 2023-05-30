def calculate_f2(ancient_genotype, modern_freq):
    # Calculate f2 statistic
    # Here, I assume that ancient_genotype is in the form like '0/1', '0/0', './.'
    # and modern_freq is a float number.
    if ancient_genotype == '0/1' or ancient_genotype == '1/0':
        return (0.5 - modern_freq) ** 2
    elif ancient_genotype == '0/0':
        return modern_freq ** 2
    elif ancient_genotype == '1/1':
        return (1 - modern_freq) ** 2
    else:
        # This includes './.' case
        return None

data_dir="/home/mkato952/data/47prefecture/"
ancient_vcf=f"{data_dir}J4_for_47p.filled.vcf"
ken_num=1
modern_txt=f"{data_dir}prefectural_alfreq_data/vM_QC_PC_bi.Rsq03.ken{ken_num}.rand50.afreq"

ancient_dict = {}  # dict to store ancient vcf data
with open(ancient_vcf, 'r') as ancient_file:
    for line in ancient_file:
        if not line.startswith('#'):  # Skip header line
            items = line.split()
            ancient_dict[items[2]] = {'ref': items[3], 'alt': items[4], 'gt': items[9:]}  # ID is the key, genotype information is the value
print("ancient_dict構築終了")

modern_dict = {}  # dict to store modern frequency data
with open(modern_txt, 'r') as modern_file:
    for line in modern_file:
        if not line.startswith('#'):  # Skip header line
            items = line.split()
            modern_dict[items[1]] = {'ref': items[2], 'alt': items[3], 'freq': float(items[4])}
            if ancient_dict[items[1]]['ref'] == items[3] or ancient_dict[items[1]]['alt'] == items[2]:
                # !inversion!
                modern_dict[items[1]] = {'ref': items[3], 'alt': items[2], 'freq': 1 - float(items[4])}

print("modern_dict構築終了")

for k, v in ancient_dict.items():
    ancient_dict[k] = v['gt']

print("ancient_dict修正終了")

f2_values = {}
for id, genotypes in ancient_dict.items():
    if id in modern_dict:  # Check if the ID exists in modern data
        for i, genotype in enumerate(genotypes):
            if genotype != './.':
                f2_value = calculate_f2(genotype, modern_dict[id]['freq'])
                f2_values[(id, i)] = f2_value
