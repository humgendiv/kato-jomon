v54DIR=/home/mkato952/data/AADR/
j4DIR=/home/mkato952/data/bed/bed_1240K/J4_bed_1240K
v54=v54.1.p1_1240K_public

first="${v54DIR}"

en=
ea=east_asian
ge=genomes_1000

plink --make-bed --bfile "/home/mkato952/data/AADR/${en}/v54.1.p1_1240K_public.east_ancient --bmerge /home/mkato952/data/bed/bed_1240K/J4_bed_1240K --out /home/mkato952/data/AADR/east_ancient/J4_merge.east_ancient
