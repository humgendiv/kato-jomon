if [ ! -d /home/mkato952/data/AADR/east_asian/ ]; then
    mkdir -p /home/mkato952/data/AADR/east_asian/
fi

if [ ! -d /home/mkato952/data/AADR/east_ancient/ ]; then
    mkdir -p /home/mkato952/data/AADR/east_ancient/
fi

if [ ! -d /home/mkato952/data/AADR/genomes_1000/ ]; then
    mkdir -p /home/mkato952/data/AADR/genomes_1000/
fi

plink --bfile /home/mkato952/data/AADR/v54.1.p1_1240K_public --keep /home/mkato952/data/AADR/1240K_east_asian.fam --make-bed --out /home/mkato952/data/AADR/east_asian/v54.1.p1_1240K_public.east_asian
plink --bfile /home/mkato952/data/AADR/v54.1.p1_1240K_public --keep /home/mkato952/data/AADR/1240K_east_ancient.fam --make-bed --out /home/mkato952/data/AADR/east_ancient/v54.1.p1_1240K_public.east_ancient
plink --bfile /home/mkato952/data/AADR/v54.1.p1_1240K_public --keep /home/mkato952/data/AADR/1240K_genomes_1000.fam --make-bed --out /home/mkato952/data/AADR/genomes_1000/v54.1.p1_1240K_public.genomes_1000