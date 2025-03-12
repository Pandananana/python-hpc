#!/bin/bash
#BSUB -J q3_4
#BSUB -q hpc
#BSUB -W 10
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=1GB]"
#BSUB -R "select[model == XeonGold6342]"
#BSUB -n 48

lscpu

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python q3_4.py
