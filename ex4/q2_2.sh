#!/bin/bash
#BSUB -J q2_1
#BSUB -q hpc
#BSUB -W 60
#BSUB -o logs/%J.out
#BSUB -e logs/%J.err
#BSUB -R "span[hosts=1] rusage[mem=16GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

python -m cProfile -s cumulative q2_1.py locations/locations.csv

# Profile 1000 points
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
# 1    8.428    8.428    8.428    8.428 q2_1.py:4(distance_matrix)
# 1    0.000    0.000    0.026    0.026 q2_1.py:19(load_points)
# 1    0.004    0.004    0.015    0.015 q2_1.py:24(distance_stats)

# Profile all points
# 1 1523.797 1523.797 1523.814 1523.814 q2_1.py:4(distance_matrix)
# 1    0.000    0.000    0.011    0.011 q2_1.py:19(load_points)
# 1    0.783    0.783    2.158    2.158 q2_1.py:24(distance_stats)