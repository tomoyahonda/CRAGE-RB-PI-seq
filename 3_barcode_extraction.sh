gunzip *.gz

for prefix in $(ls *_L002_R1_001.fastq | sed -r 's/_L002_R1_001.fastq//' | uniq)
do
cat ${prefix}_L002_R1_001.fastq | bbduk.sh in=stdin.fastq out=${prefix}_cut.fastq ftl=33 ftr=52 int=f
done


for prefix in $(ls *_cut.fastq | sed -r 's/_cut.fastq//' | uniq)
do
cat ${prefix}_cut.fastq | reformat.sh in=stdin.fastq out=${prefix}.fasta int=f
done
