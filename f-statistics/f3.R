library("admixtools")

pop1 = 'JPT'
pop2 = c('F23', 'I4', 'T5', 'FM0')
pop3 = 'YRI'

f2_blocks = f2_from_precomp("~/research_icloud/f2-genomes-1000/")

qp3pop(f2_blocks, pop1, pop2, pop3)