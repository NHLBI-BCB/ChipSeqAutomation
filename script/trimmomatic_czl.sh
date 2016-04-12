/usr/java/latest/bin/java -jar /home/jwman/chipseq-automation/software/Trimmomatic-0.36/trimmomatic-0.33.jar /home/jwman/chipseq-automation/input/czl/T1.fastq /home/jwman/chipseq-automation/input/czl/T2.fastq output/trim/czl_paired_T1.fastq output/trim/czl_unpaired_T1.fastq output/trim/czl_paired_T2.fastq output/trim/czl_unpaired_T2.fastq ILLUMINACLIP:t_adapter.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:23 
/usr/java/latest/bin/java -jar /home/jwman/chipseq-automation/software/Trimmomatic-0.36/trimmomatic-0.33.jar /home/jwman/chipseq-automation/input/czl/C1.fastq /home/jwman/chipseq-automation/input/czl/C2.fastq output/trim/czl_paired_C1.fastq output/trim/czl_unpaired_C1.fastq output/trim/czl_paired_C2.fastq output/trim/czl_unpaired_C2.fastq ILLUMINACLIP:t_adapter.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:23 