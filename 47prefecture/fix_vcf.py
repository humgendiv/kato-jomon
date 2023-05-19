import os

import pandas as pd

# ファイル名 (適宜変更してください)
filename = '~/research_icloud/47prefecture/J4_for_47p.vcf' 
expanded_path =os.path.expanduser(filename)

# 列名を取得するために最初のコメント行を無視せずにファイルを読み込む
with open(expanded_path, 'r') as f:
    lines = f.readlines()

# 列名が保存されている行を見つける
header_line = [line for line in lines if line.startswith('#CHROM')][0]

# 列名を取得
header = header_line.strip().split('\t')

# ファイルを読み込む (コメント行を無視)
data = pd.read_csv(filename, sep='\t', comment='#', names=header, skiprows=1)

# 必要な列だけを残す
data = data[['ID', 'REF', 'ALT', '0_DO', '0_FM020', '0_Jomon', '0_T5']]

# 最後の4列の値を置換
replace_dict = { './.': '.', '0/0': '0', '0/1': '0.5', '1/0': '0.5', '1/1': '1' }
for col in ['0_DO', '0_FM020', '0_Jomon', '0_T5']:
    data[col] = data[col].map(replace_dict).fillna(data[col])

# 結果を新しいファイルに保存
data.to_csv('~/research_icloud/47prefecture/J4_for_47p.fstat.txt', sep='\t', index=False)