#!/bin/bash
#BSUB -J q2
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q1_2_%J.out
#BSUB -e logs/q1_2_%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

echo "Running q2_3.py with 256"
python q2_3.py 256

echo "Running q2_3.py with 512"
python q2_3.py 512

echo "Running q2_3.py with 1024"
python q2_3.py 1024