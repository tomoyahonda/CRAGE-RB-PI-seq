library("Biostrings")
library("dplyr")

setwd("/global/cscratch1/sd/thonda/promoter_barcode_140bp_v2")

gDNA1 = readDNAStringSet("gDNA_G1.fasta")
promoter <- subseq(gDNA1, 1, 140)
barcode <- subseq(gDNA1, 174, 193)
#seq_name = names(gDNA1)
promoters = paste(promoter)
barcodes = paste(barcode)
df_gDNA1 <- data.frame(promoters, barcodes)

df_group1 <- df_gDNA1
nrow(df_group1) # 7508234

# Accept the pair if a set of promoter & barcode appears more than 100 times (remove possible reading errors)
df_group1$pairs = paste(df_group1$promoters, df_group1$barcodes, sep="_") #combine promoter and barcode seq
n_occur <- data.frame(table(df_group1$pairs)) #gives dataframe with a list of pairs and the number of times they occurred
df_group1_new <- df_group1[df_group1$pairs %in% n_occur$Var1[n_occur$Freq > 100],] #accept if detected more than 100
nrow(df_group1_new) #promoter-barcode pair after removeing low-detected sequences: 3384332


df_group1_unique <- unique(df_group1_new[c("promoters", "barcodes")]) #remove duplicated sets
nrow(df_group1_unique) #118433
length(unique(df_group1_unique$promoters)) #variation of promoters: 14235
length(unique(df_group1_unique$barcodes)) #variation of barcodes: 117624


#returns the barcodes with only one occurrence: https://stackoverflow.com/questions/16905425/find-duplicate-values-in-r
n_occur <- data.frame(table(df_group1_unique$barcodes)) #gives dataframe with a list of barcodes and the number of times they occurred
df_group1_index <- df_group1_unique[df_group1_unique$barcodes %in% n_occur$Var1[n_occur$Freq < 2],] #remove barcode duplicates
nrow(df_group1_index) #promoter-barcode seq after removeing sequences with duplicated barcodes: 117328

hist(n_occur$Freq, breaks=seq(0,35000,by=1), xlim = c(0,10), col="green",xlab = "#duplicated barcodes") #duplicated barcode frequency
n_occur[n_occur$Freq > 1,] #list of barcodes occurred more than once
sum(n_occur[n_occur$Freq > 1,]$Freq) #total number of multiplicated barocdes: 1105 (this + nrow(df_group1_index) = nrow(df_group1_unique))



df_ref <- read.csv("RS_reference_v2.csv", header = T)
names(df_ref)[3] <- "promoters"

#Convert promoter and barcode from factors to characters, otherwise get a warning. Check conversion by str(df)
df_ref$promoters = as.character(df_ref$promoters)
df_group1_index$promoters = as.character(df_group1_index$promoters)
df_group1_index$barcodes = as.character(df_group1_index$barcodes)

df_group1_summary <- left_join(df_group1_index, df_ref, by = "promoters")
nrow(df_group1_summary) #117328

df_group1_summary <- df_group1_summary[!is.na(df_group1_summary$Name), ] #remove mutated promoters (no assignment by ref)
nrow(df_group1_summary) #number of correct promoter library: 105176 
length(unique(df_group1_summary$promoters)) #variation of promoters: 1834
length(unique(df_group1_summary$barcodes)) #variation of barcodes: 105176 (same as nrow(df_group1_summary))
length(unique(df_group1_summary$Name)) #variation of gene names: 1013
unique(df_group1_summary$group) #group2 & 3 contaminated

n_occur <- data.frame(table(df_group1_summary$promoters)) #gives dataframe with a list of promoter (1834) and the number of times they occurred
hist(n_occur$Freq, col="pink", breaks=seq(0,3000,by=20), xlim = c(0,3000), xlab = "#covered by barcodes")

write.csv(df_group1_summary, file = "group1.csv", na="")
