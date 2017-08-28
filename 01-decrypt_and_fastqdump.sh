#!/bin/bash

#Decrypting and fastq dumping phs000790 - Comparative Sequence Analysis Between Primary and Metastatic Colorectal Cancer Lesions

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=3gb
#PBS -l walltime=72:00:00
#PBS -l cput=72:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m ea
#PBS -o pbs_logs/
#PBS -e pbs_logs/

export WD=$PBS_O_WORKDIR

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human/sra"

if [ ! -d "$DIR" ]; then
    echo "Wrong directory dude!"
    exit 1
fi

cd $DIR

echo $(date) >> $WD/pbs_logs/"$PBS_JOBNAME".log

#check that all files are decrypted
vdb-decrypt ./*.sra &>>$WD/pbs_logs/"$PBS_JOBNAME".log

#get the fastq for all the sra files
fastq-dump ./*.sra &>>$WD/pbs_logs/"$PBS_JOBNAME".log

