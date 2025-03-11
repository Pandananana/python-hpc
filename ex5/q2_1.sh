#!/bin/bash
#BSUB -J q2_1
#BSUB -q hpc
#BSUB -W 5
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 10

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

echo "Running implementation 1"
time python q2_1_1.py

echo "Running implementation 2"
time python q2_1_2.py

echo "Running implementation 3"
time python q2_1_3.py