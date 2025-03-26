#!/bin/bash
#BSUB -J Ex8q4
#BSUB -q hpc
#BSUB -W 5
#BSUB -o logs/Ex8q4_%J.out
#BSUB -e logs/Ex8q4_%J.err
#BSUB -R "span[hosts=1] rusage[mem=5GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

lscpu

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

echo "Chunk 100_000"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_5.py 2>&1

# 12548.629999999997
# mem=153184 KB runtime=2.34 s