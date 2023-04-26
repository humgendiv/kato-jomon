# vcf.gzファイルのいらない行を削除していく。formatも整える。

DATADIR=/home/mkato952/data/raw_vcf/
FILENAME=$1

# 1. gzファイルを展開し、パイプを繋いで１行ずつ処理する
gzcat $DATADIR$FILENAME | \
# 2. 各行の先頭の文字が#で始まる行は何もしない
awk '{if(substr($0,1,1)!="#") print $0}' | \
# 3. 各行の先頭が"chr"で始まる行は、その先頭のchrを削除する
awk '{if(substr($0,1,3)=="chr") print substr($0,4); else print $0}' | \
# 4. 各行の10列目の文字列のうち、":"で区切ったとき３番目に当たる数字について10未満であればその行を削除する
awk '{split($10,a,":"); if(a[3]<10) print $0}' | \
# 5. 以上の処理を経たデータを、gz圧縮して、DATADIRディレクトリに保存する
gzip > $DATADIR$FILENAME".clean.gz"

