#!/bin/bash
#title  97_rum_exp.sh
#author j1angvei
#date   20160505
#usage  build script to run spedified experiment scripts in order.
#==========================================================================================

#init parameter
work=`pwd`

#test if input parameters are correct
if [ $# -lt 1 ]
then
	echo "Usage: sh 97_start_exp.sh [code] "
	exit
fi

#receive passing arguments
code=$1

#import config
source config/directory.conf
source config/executable.conf
source config/preference.conf

#generate script
script=${work}/${dir_sh}/${code}_start.sh
rm -rf $script && touch $script && chmod 751 $script

#write info into script
sh_prefix=${work}/${dir_sh}/${code}_
log_prefix=${work}/${dir_log}/${code}_

#record start running time
echo -e "\n#mark job start time" >> $script
echo "echo \" \`date\` ${code} start analysis!\"" >> $script

#=====fastqc======  
echo -e "\n#do quality contrl using FastQC for ${code} experiment" >> $script
echo "echo \" \`date\` >>>>>${code} fastqc START!\"" >> $script
echo "sh ${sh_prefix}fastqc.sh > ${log_prefix}fastqc.log 2>&1" >> $script
echo "echo \" \`date\` <<<<<${code} fastqc FINISH!\"" >> $script

#=====qc_out======
echo -e "\n#handle qc output for experiment ${code} " >> $script
echo "echo \" \`date\` >>>>>${code} qc_out START!\"" >> $script
echo "sh ${sh_prefix}qc_out.sh > ${log_prefix}qc_out.log 2>&1" >> $script
echo "echo \" \`date\` <<<<<${code} qc_out FINISH!\" " >> $script

#=====trimmomatic======
echo -e "\n#do trim work using trimmomatic for experiment ${code}" >> $script
echo "echo \" \`date\` >>>>>${code} trimmomatic START!\"" >> $script
echo "sh ${sh_prefix}trimmomatic.sh > ${log_prefix}trimmomatic.log 2>&1" >> $script
echo "echo \" \`date\` <<<<<${code} trimmomatic FINISH!\" " >> $script

#=====do fastqc after trim=====
echo -e "\n#do fastqc using fastqc for experiment ${code}" >> $script
echo "echo \" \`date\` >>>>>${code} fastqc again START!\"" >> $script
echo "nohup sh ${sh_prefix}clean.sh >${log_prefix}clean.log 2>&1 &" >> $script
echo "echo \"\`date\` <<<<<${cdoe} fastqc again submit successfully, pid is \$! \"" >> $script

#=====bwa_mem=====
echo -e "\n#do alignment using bwa mem for experiment ${code}" >> $script
echo "echo \" \`date\` >>>>>${code} bwa mem alignment  START!\"" >> $script
echo "sh ${sh_prefix}bwa_mem.sh > ${log_prefix}bwa_mem.log 2>&1 " >> $script
echo "echo \" \`date\` >>>>>${code} bwa mem alignment FINISH!\" " >> $script

#=====sam2bam=====
echo -e "\n#do convert sam file to bam file using samtools for experiment ${code}" >>$script
echo "echo \" \`date\` >>>>>${code} sam2bam convert START!\"" >> $script
echo "sh ${sh_prefix}sam2bam.sh > ${log_prefix}sam2bam.log 2>&1 " >> $script
echo "echo \" \`date\` <<<<<${code} sam2bam convert FINISH!\" " >> $script

#=====bam_sort=====
echo -e "\n#do bam sort using samtools for experiment ${code}" >> $script
echo "echo \" \`date\` >>>>>${code} bam sort START!\"" >> $script
echo "sh ${sh_prefix}bam_sort.sh > ${log_prefix}bam_sort.log 2>&1" >> $script
echo "echo \" \`date\` <<<<<${code} bam sort FINISH!\" " >> $script

#=====macs=====
echo -e "\n#do peak calling using macs for experiment ${code} " >> $script

#add environment variable to $PATH as macs requested.
path_macs=${work}/${dir_exe}/${upk_macs}
python_v=`$python -V 2>&1`
python_v=${python_v:7:3}
echo "export PYTHONPATH=${path_macs}/lib/python${python_v}/site-packages:\$PYTHONPATH" >> $script
echo "export PATH=${path_macs}/bin:\$PATH" >> $script

#write command into script
echo "echo \" \`date\` >>>>>${code} macs START!\"" >> $script
echo "sh ${sh_prefix}macs.sh > ${log_prefix}macs.log 2>&1" >>$script
echo "echo \" \`date\` <<<<<${code} macs FINISH!\" " >> $script

#=====All done======
echo ">>>>>Script generated at: ${script}"
