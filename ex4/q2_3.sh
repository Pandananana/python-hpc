#!/bin/bash
#BSUB -J q2_3
#BSUB -q hpc
#BSUB -W 60
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python -m cProfile -s cumulative q2_3.py locations/locations.csv

# Profile
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
# 1   10.556   10.556   10.556   10.556 q2_3.py:4(distance_matrix)
# 1    0.687    0.687    1.876    1.876 q2_3.py:23(distance_stats)
# 1    0.000    0.000    0.012    0.012 q2_3.py:18(load_points)