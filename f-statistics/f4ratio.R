library("admixtools")

pop1 = 'CDX'
pop2 = 'YRI'
pop3 = 'JPT'
pop4 = 'FM0'
#c('T5','F23','I4','FM0')
pop5 = 'CHS'

f2_blocks = f2_from_precomp("~/research_icloud/f2-genomes-1000/")
qpf4ratio(f2_blocks, c(pop1,pop2,pop3,pop4,pop5))