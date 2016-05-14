
#convert /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_t.sam to /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam 
echo "convert /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_t.sam to /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam"
/home/jwman/chipseq-automation/software/samtools-1.3.1/bin/samtools view --threads 5 -bS /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_t.sam -o /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam

#check alignment quality of /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam
echo "check alignment quality of /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam"
/home/jwman/chipseq-automation/software/samtools-1.3.1/bin/samtools flagstat /home/jwman/chipseq-automation/output/sam2bam/zy_ox_t.bam

#convert /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_c.sam to /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam 
echo "convert /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_c.sam to /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam"
/home/jwman/chipseq-automation/software/samtools-1.3.1/bin/samtools view --threads 5 -bS /home/jwman/chipseq-automation/output/bwa_mem/zy_ox_c.sam -o /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam

#check alignment quality of /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam
echo "check alignment quality of /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam"
/home/jwman/chipseq-automation/software/samtools-1.3.1/bin/samtools flagstat /home/jwman/chipseq-automation/output/sam2bam/zy_ox_c.bam