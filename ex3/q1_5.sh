#!/bin/bash
#BSUB -J q1_2
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q1_2_%J.out
#BSUB -e logs/q1_2_%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python q1_5.py