# 1240Kの個体数が多すぎるので削減する。

import re

east_asian = [
        r"China",              # "China"の単語全体の一致
        r"CHB",                # "CHB"の単語全体の一致
        r"CDX",                # "CDX"の単語全体の一致
        r"JPT",                # "JPT"の単語全体の一致
        r"KHV",                # "KHV"の単語全体の一致(ベトナム)
        r"CHS",                # "CHS"の単語全体の一致
        r"Japan",              # "Japan"の単語全体の一致
        r"Korea",                  # "Korea"の部分一致
        r"\b(Chinese|Han)\b",      # "Chinese"または"Han"の単語全体の一致
        r"(Taiwan|Taipei)"     # "Taiwan"または"Taipei"の単語全体の一致
    ]

east_ancient = [
        r"China",              # "China"の単語全体の一致
        r"Japan",              # "Japan"の単語全体の一致
        r"Korea",                  # "Korea"の部分一致
        r"\b(Chinese|Han)\b",      # "Chinese"または"Han"の単語全体の一致
        r"(Taiwan|Taipei)"     # "Taiwan"または"Taipei"の単語全体の一致
]



def is_individual_matching_patterns(line, patterns):
    fields = line.split('\t')
    region_info = fields[1]

    # 各パターンを検索し、一致したらTrueを返す
    for pattern in patterns:
        if re.search(pattern, region_info, re.IGNORECASE):
            return True

    return False

def is_1000Genomes_invididual(line):
    if is_individual_matching_patterns(line, patterns=['Japan',]):
        return True
    fields = line.split('\t')
    individual_info = fields[1]

    # 個体情報をピリオドで分割し、前半部分を取得
    parts = individual_info.split(':')
    if len(parts) == 2:
        first_half = parts[0].split('.')[0]

        # 前半部分が大文字の3文字であるかチェック
        if len(first_half) == 3 and first_half.isupper():
            return True


    return False

file_path = "/home/mkato952/data/AADR/v54.1.p1_1240K_public.fam"

east_asian_file_path = "/home/mkato952/data/AADR/1240K_east_asian.fam"
Genomes1000_file_path = "/home/mkato952/data/AADR/1240K_genomes_1000.fam"
east_ancient_file_path = "/home/mkato952/data/AADR/1240K_east_ancient.fam"

with open(file_path, 'r') as file, \
open(east_asian_file_path, 'w') as eaf, \
open(Genomes1000_file_path, 'w') as g1f, \
open(east_ancient_file_path, 'w') as anf:
    for line in file:
        if is_individual_matching_patterns(line, east_asian):
            eaf.write(line)
        if is_1000Genomes_invididual(line):
            g1f.write(line)
        if is_individual_matching_patterns(line, east_ancient):
            anf.write(line)