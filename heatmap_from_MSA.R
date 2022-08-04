library(Biostrings)
library(ggmsa)

protein_sequences <- system.file("extdata", "sample5.fasta", package = "ggmsa")


aln = readAAMultipleAlignment(protein_sequences)

ggmsa(protein_sequences, start = 265, end = 300)


aln = unmasked(aln)
names(aln)[1]


ref = aln[1]

bm = sapply(1:length(aln),function(i){
  as.numeric(as.matrix(aln[i])==as.matrix(ref))
})

bm = t(bm)
rownames(bm) = names(aln)

library(pheatmap)
pheatmap(bm[nrow(bm):1,265:300],cluster_rows=FALSE,cluster_cols=FALSE)