#!/bin/bash

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

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human"

if [ ! -d "$DIR" ]; then
    mkdir -p $DIR
fi

cd $DIR

#Downloading phs000790 - Comparative Sequence Analysis Between Primary and Metastatic Colorectal Cancer Lesions

vdb-config --import prj_9499.ngc ./ &>$WD/pbs_logs/dbgap_download.log

#prefetch -t ascp -a '/home/u18/scottdaniel/bin/ascp|/home/u18/scottdaniel/etc/asperaweb_id_dsa.openssh' \
#    --max-size 1T cart_prj9499_201708251742.krt \
#    &>>$WD/pbs_logs/dbgap_download.log

prefetch --max-size 1T cart_prj9499_201708251742.krt \
    &>>$WD/pbs_logs/dbgap_download.log

