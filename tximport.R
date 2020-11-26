BiocManager::install("tximport")
library(tximport)

# input files are the output file "abundance.h5" from kallisto
dir <- "~/scDASH_Project/kallisto/"
list.files(dir)
mysample <- list.files(dir)
samples<-as.data.frame(mysample)
tx2gene<-read.csv("~/scDASH_Project/gencodev29_tx2gene_rRNA_patch.csv",header = F)
tx2gene <- tx2gene[,2:3]
files <- file.path(dir,samples[,1],"abundance.h5")
names(files) <- mysample

txi.kallisto <- tximport(files, type = 'kallisto', ignoreTxVersion = T, ignoreAfterBar= T, tx2gene = tx2gene, countsCol = "est_counts", abundanceCol = "tpm")
head(txi.kallisto$counts)
head(txi.kallisto$abundance)
counts<-txi.kallisto$counts
TPM<-txi.kallisto$abundance
eff_length <- txi.kallisto$length
write.csv(counts,"dash_gene_counts.csv")
write.csv(TPM,"dash_gene_tpm.csv")
write.csv(eff_length,"dash_gene_eff_length.csv")

