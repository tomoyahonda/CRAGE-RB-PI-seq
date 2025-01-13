#G1 52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq.gz
#G2 52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq.gz
#G3 52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq.gz

gunzip *.gz

bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq out1=gDNA_G1_fwd.fastq out2=gDNA_G1_rev.fastq
bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq out1=gDNA_G2_fwd.fastq out2=gDNA_G2_rev.fastq
bryce911/bbtools:38.90 reformat.sh in=52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq out1=gDNA_G3_fwd.fastq out2=gDNA_G3_rev.fastq

bryce911/bbtools:38.90 bbduk.sh in=gDNA_G1_fwd.fastq out=gDNA_G1_fwd_trimmed.fastq minlen=250
bryce911/bbtools:38.90 bbduk.sh in=gDNA_G2_fwd.fastq out=gDNA_G2_fwd_trimmed.fastq minlen=250
bryce911/bbtools:38.90 bbduk.sh in=gDNA_G3_fwd.fastq out=gDNA_G3_fwd_trimmed.fastq minlen=250

bryce911/bbtools:38.90 bbduk.sh in=gDNA_G1_fwd_trimmed.fastq out=gDNA_G1.fastq ftl=27 ftr=219
bryce911/bbtools:38.90 bbduk.sh in=gDNA_G2_fwd_trimmed.fastq out=gDNA_G2.fastq ftl=27 ftr=219
bryce911/bbtools:38.90 bbduk.sh in=gDNA_G3_fwd_trimmed.fastq out=gDNA_G3.fastq ftl=27 ftr=219

bryce911/bbtools:38.90 reformat.sh in=gDNA_G1.fastq out=gDNA_G1.fasta
bryce911/bbtools:38.90 reformat.sh in=gDNA_G2.fastq out=gDNA_G2.fasta
bryce911/bbtools:38.90 reformat.sh in=gDNA_G3.fastq out=gDNA_G3.fasta

rm 52443.1.335961.TTCCAAGG-CCTTGGAA.filter-DNA.fastq
rm 52443.1.335961.CATGTTCC-GGAACATG.filter-DNA.fastq
rm 52443.1.335961.AAGTCGAG-CTCGACTT.filter-DNA.fastq

rm gDNA_G1_rev.fastq
rm gDNA_G2_rev.fastq
rm gDNA_G3_rev.fastq

rm gDNA_G1_fwd.fastq
rm gDNA_G2_fwd.fastq
rm gDNA_G3_fwd.fastq

rm gDNA_G1_fwd_trimmed.fastq
rm gDNA_G2_fwd_trimmed.fastq
rm gDNA_G3_fwd_trimmed.fastq

rm gDNA_G1.fastq
rm gDNA_G2.fastq
rm gDNA_G3.fastq


