/usr/java/latest/bin/java -jar /home/jwman/chipseq-automation/software/Trimmomatic-0.36/trimmomatic-0.33.jar /home/jwman/chipseq-automation/input/zw_4/4_R1.fastq /home/jwman/chipseq-automation/input/zw_4/4_R2.fastq /home/jwman/chipseq-automation/output/trim/zw_4_t1_paired.fastq /home/jwman/chipseq-automation/output/trim/zw_4_t1_unpaired.fastq /home/jwman/chipseq-automation/output/trim/zw_4_t2_paired.fastq /home/jwman/chipseq-automation/output/trim/zw_4_t2_unpaired.fastq ILLUMINACLIP:t_adapter.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:23 