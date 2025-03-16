#!/bin/bash
#BSUB -J q4
#BSUB -q hpc
#BSUB -W 60
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=50GB]"
#BSUB -n 16

lscpu

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python q4.py /dtu/projects/02613_2025/data/celeba/celeba_100K.npy
