"""
input_file_path = "/Users/mkato/research_icloud/v54.1.p1_1240K_public.snp"
output_file_path = "/Users/mkato/research_icloud/v54.1.p1_1240K_public_new.snp"

with open(input_file_path, 'r') as input_file, open(output_file_path, 'w') as output_file:
    for line in input_file:
        columns = line.strip().split()

        if len(columns) >= 6:
            columns[0] = f'{columns[1]}:{columns[3]}'

        new_line = '\t'.join(columns)
        output_file.write(new_line + '\n')
"""

input_file_path = "/home/mkato952/data/AADR/v54.1.p1_1240K_public.bim"
output_file_path = "/home/mkato952/data/AADR/v54.1.p1_1240K_public_new.bim"

with open(input_file_path, 'r') as input_file, open(output_file_path, 'w') as output_file:
    for line in input_file:
        columns = line.strip().split()

        if len(columns) >= 6:
            columns[1] = f'{columns[0]}:{columns[3]}'

        new_line = '\t'.join(columns)
        output_file.write(new_line + '\n')