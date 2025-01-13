
## 1. convert files ##
## for loop; https://www.biostars.org/p/98222/

cd /Volumes/LaCieOrange/QB3seqdata/Read1/RNA

gunzip *.gz


for prefix in $(ls *_L002_R1_001.fastq | sed -r 's/_L002_R1_001.fastq//' | uniq)
do
cat ${prefix}_L002_R1_001.fastq | bbduk.sh in=stdin.fastq out=${prefix}_cut.fastq ftl=33 ftr=52 int=f
done


for prefix in $(ls *_cut.fastq | sed -r 's/_cut.fastq//' | uniq)
do
cat ${prefix}_cut.fastq | reformat.sh in=stdin.fastq out=${prefix}.fasta int=f
done



## 2. rename files (use excel sheet) ##
mv YYTH001A_S19.fasta RNA_C_R1_T1.fasta
mv YYTH001B_S18.fasta RNA_C_R1_T2.fasta
mv YYTH001C_S17.fasta RNA_C_R1_T3.fasta
mv YYTH001D_S16.fasta RNA_P_R1_T1.fasta
mv YYTH001E_S15.fasta RNA_P_R1_T2.fasta
mv YYTH001F_S14.fasta RNA_P_R1_T3.fasta
mv YYTH001G_S13.fasta RNA_C_R2_T1.fasta
mv YYTH001H_S12.fasta RNA_C_R2_T2.fasta
mv YYTH001I_S11.fasta RNA_C_R2_T3.fasta
mv YYTH001J_S10.fasta RNA_C_R3_T1.fasta
mv YYTH001K_S9.fasta RNA_C_R3_T2.fasta
mv YYTH001L_S8.fasta RNA_C_R3_T3.fasta
mv YYTH001M_S7.fasta RNA_P_R2_T1.fasta
mv YYTH001N_S6.fasta RNA_P_R2_T2.fasta
mv YYTH001O_S5.fasta RNA_P_R2_T3.fasta
mv YYTH001P_S4.fasta RNA_P_R3_T1.fasta
mv YYTH001Q_S3.fasta RNA_P_R3_T2.fasta
mv YYTH001R_S2.fasta RNA_P_R3_T3.fasta
mv YYTH001S_S1.fasta RNA_C_R4_T1.fasta
mv YYTH001T_S23.fasta RNA_C_R4_T2.fasta
mv YYTH001U_S22.fasta RNA_C_R4_T3.fasta
mv YYTH001V_S21.fasta RNA_P_R4_T1.fasta
mv YYTH001W_S20.fasta RNA_P_R4_T2.fasta
mv YYTH001X_S27.fasta RNA_P_R4_T3.fasta
mv YYTH001Y_S26.fasta RNA_P_R5_T1.fasta
mv YYTH001Z_S25.fasta RNA_P_R5_T2.fasta
mv YYTH001ZA_S24.fasta RNA_P_R5_T3.fasta

mv YYTH002A_S32.fasta DNA_C_R1_T1.fasta
mv YYTH002B_S31.fasta DNA_C_R1_T2.fasta
mv YYTH002C_S30.fasta DNA_C_R1_T3.fasta
mv YYTH002D_S29.fasta DNA_P_R1_T1.fasta
mv YYTH002E_S28.fasta DNA_P_R1_T2.fasta
mv YYTH002F_S52.fasta DNA_P_R1_T3.fasta
mv YYTH002G_S51.fasta DNA_C_R2_T1.fasta
mv YYTH002H_S50.fasta DNA_C_R2_T2.fasta
mv YYTH002I_S49.fasta DNA_C_R2_T3.fasta
mv YYTH002J_S48.fasta DNA_C_R3_T1.fasta
mv YYTH002K_S47.fasta DNA_C_R3_T2.fasta
mv YYTH002L_S46.fasta DNA_C_R3_T3.fasta
mv YYTH002M_S45.fasta DNA_P_R2_T1.fasta
mv YYTH002N_S44.fasta DNA_P_R2_T2.fasta
mv YYTH002O_S43.fasta DNA_P_R2_T3.fasta
mv YYTH002P_S42.fasta DNA_P_R3_T1.fasta
mv YYTH002Q_S41.fasta DNA_P_R3_T2.fasta
mv YYTH002R_S40.fasta DNA_P_R3_T3.fasta
mv YYTH002S_S39.fasta DNA_C_R4_T1.fasta
mv YYTH002T_S38.fasta DNA_C_R4_T2.fasta
mv YYTH002U_S37.fasta DNA_C_R4_T3.fasta
mv YYTH002V_S36.fasta DNA_P_R4_T1.fasta
mv YYTH002W_S35.fasta DNA_P_R4_T2.fasta
mv YYTH002X_S34.fasta DNA_P_R4_T3.fasta
mv YYTH002Y_S33.fasta DNA_P_R5_T1.fasta
mv YYTH002Z_S54.fasta DNA_P_R5_T2.fasta
mv YYTH002ZA_S53.fasta DNA_P_R5_T3.fasta




