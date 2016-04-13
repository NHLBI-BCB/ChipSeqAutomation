#!/bin/bash
#title  build_trimmomatic.sh
#author j1angvei
#date   20160412
#usage  data filter for fastq file using trimmomatic.jar
# Input parameter as exe, pe/se, -threads thread, R1.fastq (R2.fastq) R1_paried.fastq R1_unpaired.fastq (R2_paired.fastq R2_unpaired.fastq)
# Other parameter, ILLUMINACLIP:/path/TruSeq5-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:50
#==========================================================================================

#init parameter
pid=$$
work=`pwd`
#check input parameter
if [ $# -lt 2 ]
then 
	echo 'Usage: sh build_trimmomatic.sh [code] [min lenght] [treatment_adapter.fa] [control_adapter.fa]'
	exit
fi

#input parameter with script
code=$1
min_len=$2
param="LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 AVGQUAL:20 MINLEN:${min_len}"
param_t=$param
param_c=$param

#treatment trim parameter
if [ $# -ge 3 ]
then 
param_t="ILLUMINACLIP:${3}:2:30:10 $param"
fi

#control trim parameter
if [ $# -eq 4 ]
then
param_c="ILLUMINACLIP:${4}:2:30:10 $param"
fi

#generate script
script=script/${code}_trimmomatic.sh
rm -rf $script
touch $script
chmod 751 $script

#import user config
source config/environment.conf
source config/executable.conf
source config/exp_${code}.conf
source config/input.conf
source config/output.conf

#paramter for trimmomatic
exe=${work}/${dir_exe}/${trimmomatic}
out=${work}/${dir_out}/${trim}

#absolute path of all input fastq file
exp_dir=${work}/${dir_in}/${code}
t1=${exp_dir}/${treatment_1}
t2=${exp_dir}/${treatment_2}
c1=${exp_dir}/${control_1}
c2=${exp_dir}/${control_2}

#treatment
if [ ${treatment_2} = 'NULL' ]
then
	#se mode 
	echo "$java -jar $exe $t1 ${out}/${code}_t.fastq ${param_t} " >> $script
else
	#pe mode
	echo "$java -jar $exe $t1 $t2 ${out}/${code}_t1_paired.fastq ${out}/${code}_t1_unpaired.fastq ${out}/${code}_t2_paired.fastq ${out}/${code}_t2_unpaired.fastq ${param_t} " >> $script
fi

#control
if [ ${control_1} != 'NULL' ]
then
	if [ ${control_2} = 'NULL' ]
	then
       		 #se mode 
       		 echo "$java -jar $exe $c1 ${out}/${code}_c.fastq ${param_c} " >> $script
	else 
		#pe mode
       		 echo "$java -jar $exe $c1 $c2 ${out}/${code}_c1_paired.fastq ${out}/${code}_c1_unpaired.fastq ${out}/${code}_c2_paired.fastq ${out}/${code}_c2_unpaired.fastq ${param_t} ">> $script
	fi
fi
#output complete info	
echo -e ">>>>> Complete <<<<<<  trimmomatic script $code generated at: ${work}/$script \n"
