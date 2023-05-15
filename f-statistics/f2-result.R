library("admixtools")

f2_blocks = f2_from_precomp("~/research_icloud/f2-genomes-1000/")
f2_blocks[,,1]                # f2-statistics of the 1st SNP block
apply(f2_blocks, 1:2, mean)   # average across all blocks
#f2_blocks[1, 2, ]       # f2(pop1, pop2) for all blocks