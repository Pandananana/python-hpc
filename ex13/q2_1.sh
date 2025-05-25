#!/bin/bash
#BSUB -J q2_1
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q2_1_%J.out
#BSUB -e logs/q2_1_%J.err
#BSUB -R "span[hosts=1] rusage[mem=10GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python q2_1.py