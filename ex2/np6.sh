#!/bin/bash
#BSUB -J np5
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/np5_%J.out
#BSUB -e logs/np5_%J.err
#BSUB -R "span[hosts=1] rusage[mem=10MB]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python np5.py input.npy 10