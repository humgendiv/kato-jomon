from glob import glob
import pandas as pd

data_dir = "/Volumes/T7/prefectural_afreq_data/"

# data_dirに入っている全ての.afreqファイルのパスを取得
file_paths = glob(data_dir + "*.afreq")

# file_pathsから１つのパスを取り出す
file_path = file_paths[0]

# file_pathをタブ区切りファイルとして読み込む
data = pd.read_csv(file_path, sep="\t")

# dataの1列目から4列目までを抽出してbase_df.txtとして保存
data.iloc[:, 0:4].to_csv(f"{data_dir}base_df.txt", sep="\t", index=False)

# base_df.txtを読み込む
base_df = pd.read_csv(f"{data_dir}base_df.txt", sep="\t")
# base_dfの5列目にken1, ６列めにken2,..., 51列目にken47を追加
# 追加する列の値は-1で初期化
for i in range(1, 48):
    base_df[f"ken{i}"] = -1
# 再度base_df.txtとして保存
base_df.to_csv(f"{data_dir}base_df.txt", sep="\t", index=False)

# file_pathsから順番にパスを取り出す
for file_path in file_paths:
    # 各ファイルパスのファイル名を取得し、ファイル名に含まれるkenの直後に入る1桁または2桁の数字を取得
    ken = int(file_path.split("/")[-1].split(".")[0][3:])
    print(ken)
    break