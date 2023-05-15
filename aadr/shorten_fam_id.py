import csv

sample_name="east_ancient"

# 入力と出力のファイル名を設定
input_file_name = f"/home/mkato952/data/bed/aadr_{sample_name}/J4_aadr_{sample_name}.fam"
output_file_name = f"/home/mkato952/data/bed/aadr_{sample_name}/J4_aadr_{sample_name}.mod.fam"

# 入力ファイルを開く
with open(input_file_name, 'r') as infile:
    # CSVリーダーを作成
    reader = csv.reader(infile, delimiter='\t')

    # 出力ファイルを開く
    with open(output_file_name, 'w', newline='') as outfile:
        # CSVライターを作成
        writer = csv.writer(outfile, delimiter='\t')

        # 各行を読み取る
        for row in reader:
            # 2列目（インデックス1）の値をコロン以降の文字列に書き換える
            row[1] = row[1].split(':')[-1]

            # 最終列（インデックス5）の値が-9ならそれを1に書き換える
            if row[5] == '-9':
                row[5] = '1'


            # 修正した行を出力ファイルに書き込む
            writer.writerow(row)
