/usr/java/latest/bin/java -jar /home/jwman/chipseq-automation/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 10 PLACEHOLDER_PHRED /home/jwman/chipseq-automation/input/czl/T1.fastq /home/jwman/chipseq-automation/input/czl/T2.fastq /home/jwman/chipseq-automation/output/trim/czl_t1_paired.fastq /home/jwman/chipseq-automation/output/trim/czl_t1_unpaired.fastq /home/jwman/chipseq-automation/output/trim/czl_t2_paired.fastq /home/jwman/chipseq-automation/output/trim/czl_t2_unpaired.fastq ILLUMINACLIP:/home/jwman/chipseq-automation/output/qc/czl/T1_fastqc.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:PLACEHOLDER_MIN_LEN 
/usr/java/latest/bin/java -jar /home/jwman/chipseq-automation/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 10 PLACEHOLDER_PHRED /home/jwman/chipseq-automation/input/czl/C1.fastq /home/jwman/chipseq-automation/input/czl/C2.fastq /home/jwman/chipseq-automation/output/trim/czl_c1_paired.fastq /home/jwman/chipseq-automation/output/trim/czl_c1_unpaired.fastq /home/jwman/chipseq-automation/output/trim/czl_c2_paired.fastq /home/jwman/chipseq-automation/output/trim/czl_c2_unpaired.fastq ILLUMINACLIP:/home/jwman/chipseq-automation/output/qc/czl/C1_fastqc.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:PLACEHOLDER_MIN_LEN 
