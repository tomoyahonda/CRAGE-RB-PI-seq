#!/bin/bash
## specify an email address
#SBATCH --mail-user=THonda@lbl.gov
## specify when to send the email when job is (a)borted, (b)egins, or (e)nds
#SBATCH --mail-type=ALL
## specify allocation
#SBATCH --qos=regular
#SBATCH -A m342
## specify number of nodes
#SBATCH -N 1
## specify ram
#SBATCH --mem=118GB
## specify runtime
#SBATCH -t 02:00:00
#SBATCH -C haswell

cd /global/cscratch1/sd/thonda

mkdir promoter_barcode_140bp_v2

cp /global/dna/dm_archive/rqc/analyses/AUTO-335446/52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq.gz /global/cscratch1/sd/thonda/promoter_barcode_140bp_v2
cp /global/dna/dm_archive/rqc/analyses/AUTO-335445/52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq.gz /global/cscratch1/sd/thonda/promoter_barcode_140bp_v2
cp /global/dna/dm_archive/rqc/analyses/AUTO-335448/52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq.gz /global/cscratch1/sd/thonda/promoter_barcode_140bp_v2

cd /global/cscratch1/sd/thonda/promoter_barcode_140bp_v2

gunzip *.gz

shifter --image=bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq out1=gDNA_G1_fwd.fastq out2=gDNA_G1_rev.fastq
shifter --image=bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq out1=gDNA_G2_fwd.fastq out2=gDNA_G2_rev.fastq
shifter --image=bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq out1=gDNA_G3_fwd.fastq out2=gDNA_G3_rev.fastq

rm 52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq
rm 52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq
rm 52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq

rm gDNA_G1_rev.fastq
rm gDNA_G2_rev.fastq
rm gDNA_G3_rev.fastq

shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G1_fwd.fastq out=gDNA_G1_fwd_trimmed.fastq minlen=250
shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G2_fwd.fastq out=gDNA_G2_fwd_trimmed.fastq minlen=250
shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G3_fwd.fastq out=gDNA_G3_fwd_trimmed.fastq minlen=250

shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G1_fwd_trimmed.fastq out=gDNA_G1.fastq ftl=27 ftr=219
shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G2_fwd_trimmed.fastq out=gDNA_G2.fastq ftl=27 ftr=219
shifter --image=bryce911/bbtools:38.90 bbduk.sh in=gDNA_G3_fwd_trimmed.fastq out=gDNA_G3.fastq ftl=27 ftr=219

shifter --image=bryce911/bbtools:38.90 reformat.sh in=gDNA_G1.fastq out=gDNA_G1.fasta
shifter --image=bryce911/bbtools:38.90 reformat.sh in=gDNA_G2.fastq out=gDNA_G2.fasta
shifter --image=bryce911/bbtools:38.90 reformat.sh in=gDNA_G3.fastq out=gDNA_G3.fasta


rm gDNA_G1_fwd.fastq
rm gDNA_G2_fwd.fastq
rm gDNA_G3_fwd.fastq

rm gDNA_G1_fwd_trimmed.fastq
rm gDNA_G2_fwd_trimmed.fastq
rm gDNA_G3_fwd_trimmed.fastq

rm gDNA_G1.fastq
rm gDNA_G2.fastq
rm gDNA_G3.fastq


