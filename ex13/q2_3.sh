#!/bin/bash
#BSUB -J q2_1
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q2_1_%J.out
#BSUB -e logs/q2_1_%J.err
#BSUB -R "span[hosts=1] rusage[mem=10GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 8

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

NUM_THREADS=8
OMP_NUM_THREADS=$NUM_THREADS
MPI_NUM_THREADS=$NUM_THREADS
MKL_NUM_THREADS=$NUM_THREADS
OPENBLAS_NUM_THREADS=$NUM_THREADS
python q2_1.py