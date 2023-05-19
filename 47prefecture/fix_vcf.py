# -*- coding: utf-8 -*-

import pandas as pd

# vcfのGTをf統計量用に改変

filename = '/home/mkato952/data/47prefecture/J4_for_47p.vcf' 


data = pd.read_csv(filename, sep='\t', comment='#')

data = data[['ID', 'REF', 'ALT', '0_DO', '0_FM020', '0_Jomon', '0_T5']]


replace_dict = { './.': '.', '0/0': '0', '0/1': '0.5', '1/0': '0.5', '1/1': '1' }
for col in ['0_DO', '0_FM020', '0_Jomon', '0_T5']:
    data[col] = data[col].map(replace_dict).fillna(data[col])


data.to_csv('/home/mkato952/data/47prefecture/J4_for_47p.fstat.txt', sep='\t', index=False)
