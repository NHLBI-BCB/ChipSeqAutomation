#!/bin/bash
#bulid alignment script using command bwa mem 
pid=$$
work=`pwd`

#check if  input parameter is correct
if [ $# -lt 1 ]
then
	echo "Usage: sh script [code]"
	exit
fi

#experiment code
code=$1

#import config
source config/executable.conf
source config/output.conf
source config/exp_${code}.conf

#parametr to do bwa mem
exe=${work}/${dir_exe}/${bwa}
thread=10
idx=${work}/${dir_out}/${bwa_idx}/$code

#input file name, from previous step, trimmomatic
comm_prefix=${work}/${dir_out}/${trim}/${code}_
t=t.fastq
c=c.fastq
t1=t1_paired.fastq
t2=t2_paired.fastq
c1=c1_paired.fastq
c2=c2_paired.fastq

#output file name
t_sam=${work}/${dir_out}/${bwa_mem}/${code}_t.sam
c_sam=${work}/${dir_out}/${bwa_mem}/${code}_c.sam

#generate script
script=script/bwa_mem_${code}.sh
rm -rf $script && touch $script && chmod 751 $script

#treatment
if [ ${treatment_2} = 'NULL' ]
then
	#se
	echo "$exe mem $idx -t $thread $t ${t_sam} " >> $script
else
	#pe
	echo "$exe mem $idx -t $thread $t1 $t2 ${t_sam}" >> $script
fi

#control
if [ ${control_1} != 'NULL' ]
then
	if [ ${control_2} ='NULL' ]
	then
		#se
		echo "$exe mem $idx -t $thread $c ${c_sam} " >> $script
	else
		#pe
		echo "$exe men $idx -t $thread $c1 $c2 ${c_sam}" >> $script
	fi
fi
echo -e ">>>>Complete!<<<<<, $code bwa mem script generated at: ${work}/${script} \n"
