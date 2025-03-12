#!/bin/bash
#BSUB -J q3_2
#BSUB -q hpc
#BSUB -W 30
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=10GB]"
#BSUB -R "select[model == XeonGold6342]"
#BSUB -n 48

lscpu

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python q3_2.py
