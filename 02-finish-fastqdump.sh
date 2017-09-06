#!/bin/bash

#fastq dumping the rest of phs000790 - Comparative Sequence Analysis Between Primary and Metastatic Colorectal Cancer Lesions

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=6:mem=36gb:pcmem=6gb
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

#get the fastq for all the sra files
#getting unaligned because we want a look at bacterial first
#aligned is to the human GRCh37 reference genome
#https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR1592383

export LIST="temp_file_list"

find ./ -iname "*.sra" >> $LIST

while read SRA; do
    
    if [ ! -e $(basename $SRA .sra).fastq ]; then
        fastq-dump --unaligned $SRA &>>$WD/pbs_logs/"$PBS_JOBNAME".log
    fi

done < $LIST


