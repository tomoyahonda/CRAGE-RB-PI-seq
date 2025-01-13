library("Biostrings")
library("dplyr")

setwd("/Volumes//QB3seqdata/Read1")
df_groupAll_index <- read.csv("promoter_barcode_pairs_G23.csv", header = T)
df_groupAll_index$promoters = as.character(df_groupAll_index$promoters)
df_groupAll_index$barcodes = as.character(df_groupAll_index$barcodes)


setwd("/Volumes//QB3seqdata/Read1/DNA")

fileNames <- Sys.glob("*.fasta")

for (fileName in fileNames) {
  barcode_input = readDNAStringSet(fileName)
  barcode <- subseq(barcode_input, 1, 20)
  barcodes = paste(barcode)
  barcode_count <- data.frame(table(barcodes))
  barcode_count$barcodes = as.character(barcode_count$barcodes)
  df_groupAll_index <- left_join(df_groupAll_index, barcode_count, by = "barcodes")
}

names(df_groupAll_index) <- c("promoters", "barcodes", "group", "Name", "Length", "Min", "Max", fileNames) # change column name based on the fasta file names 


write.csv(df_groupAll_index, file = "DNA_barcodes.csv", na="")
