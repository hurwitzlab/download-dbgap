#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=3gb
#PBS -l walltime=72:00:00
#PBS -l cput=72:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m ea
#PBS -j oe
#PBS -o out/

#encryption key, change to whatever yours is
export KEY="prj_9499.ngc"

#cart downloaded from dbgap "run browser" container list of files to download
export CART="cart_prj9499_201709191342.krt"

export WD=$PBS_O_WORKDIR

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human"

if [ ! -d "$DIR" ]; then
    mkdir -p $DIR
fi

cd $DIR

#Downloading phs000374 - Genomic Sequencing of Colorectal Adenocarcinomas 

vdb-config --import $KEY ./ &>$WD/out/dbgap_download.log

prefetch --max-size 1T $CART \
    &>>$WD/out/dbgap_download.log

