import csv

# 単にindをconvertfで変換すると情報が失われるので、それを捕捉したfamファイルを生成するスクリプト

input_path = "/home/mkato952/data/AADR/v54.1.p1_1240K_public.ind"
output_path = "/home/mkato952/data/AADR/v54.1.p1_1240K_public.fam"

#入力ファイルを読み込みます。
with open(input_path, 'r') as input_file:
    reader = csv.reader(input_file, delimiter=" ")
    lines = [' '.join(line).split() for line in reader]  # 各行を結合してから再スプリットします。


#出力ファイルを作成します。
with open(output_path, 'w') as output_file:
    writer = csv.writer(output_file, delimiter="\t")
    
    # 各行に対して、指定された形式でデータを作成します。
    for line in lines:
        new_line = []
        new_line.append(0)  # 1列目
        new_line.append(f"{line[2]}:{line[0]}")  # 2列目
        new_line.append(0)  # 3列目
        new_line.append(0)  # 4列目

        # 5列目
        if line[1] == 'M':
            new_line.append(1)
        elif line[1] == 'F':
            new_line.append(2)
        else:
            new_line.append(0)

        new_line.append(1)  # 6列目

        # 新しい行を出力ファイルに書き込みます。
        writer.writerow(new_line)

