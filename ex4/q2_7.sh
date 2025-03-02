#!/bin/bash
#BSUB -J q2_7
#BSUB -q hpc
#BSUB -W 60
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python -m cProfile -s cumulative q2_7.py locations/locations.csv

# THIS WAS NOT FASTER THAN Q2_3.py
# Profile
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
# 1   11.018   11.018   11.018   11.018 q2_7.py:4(distance_matrix)
# 1    0.691    0.691    1.879    1.879 q2_7.py:25(distance_stats)
# 1    0.000    0.000    0.013    0.013 q2_7.py:20(load_points)
