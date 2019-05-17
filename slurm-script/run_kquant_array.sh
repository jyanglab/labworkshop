#!/bin/bash -l
#SBATCH -D /Users/yangjl/Documents/Github/ZeaGTEx
#SBATCH -o /Users/yangjl/Documents/Github/ZeaGTEx/slurm-log/testout-%j.txt
#SBATCH -e /Users/yangjl/Documents/Github/ZeaGTEx/slurm-log/err-%j.txt
#SBATCH -J run_kquant
#SBATCH --array=1-1
#SBATCH --mail-user=yangjl0930@gmail.com
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL #email if fails
set -e
set -u

sh slurm-script/run_kquant_$SLURM_ARRAY_TASK_ID.sh
