export CWD=$PWD
export SCRIPT_DIR=$CWD
#root project dir
export PRJ_DIR="/rsgrps/bhurwitz/scottdaniel/download-sra"
#where the worker scripts are (PBS batch scripts and their python/perl workdogs)
export WORKER_DIR="$SCRIPT_DIR/workers"

#cart downloaded from dbgap "run browser" container list of files to download
export CART="PRJNA397886_SRR_Acc_List.txt"

#main download / working directory
export SRA_DIR="/rsgrps/bhurwitz/hurwitzlab/data/BioProject397886"

# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
