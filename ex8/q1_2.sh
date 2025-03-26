#!/bin/bash
#BSUB -J Ex8q2
#BSUB -q hpc
#BSUB -W 5
#BSUB -o logs/Ex8q2_%J.out
#BSUB -e logs/Ex8q2_%J.err
#BSUB -R "span[hosts=1] rusage[mem=5GB]"
#BSUB -R "select[model == XeonGold6226R]"
#BSUB -n 1

lscpu

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

echo "Chunk 1000"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_1.py /dtu/projects/02613_2025/data/dmi/2023_01.csv.zip 1000 2>&1

echo "Chunk 10000"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_1.py /dtu/projects/02613_2025/data/dmi/2023_01.csv.zip 10000 2>&1

echo "Chunk 100000"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_1.py /dtu/projects/02613_2025/data/dmi/2023_01.csv.zip 100000 2>&1

echo "Chunk 1000000"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_1.py /dtu/projects/02613_2025/data/dmi/2023_01.csv.zip 1000000 2>&1

echo "No chunking"
/usr/bin/time -f"mem=%M KB runtime=%e s" python q1_1_no_chunk.py /dtu/projects/02613_2025/data/dmi/2023_01.csv.zip 2>&1


# Chunk 1000
# 12548.630000000054
# mem=131384 KB runtime=24.96 s

# Chunk 10000
# 12548.629999999994
# mem=136604 KB runtime=15.19 s

# Chunk 100000
# 12548.629999999997
# mem=195100 KB runtime=14.39 s

# Chunk 1000000
# 12548.630000000001
# mem=581888 KB runtime=14.79 s

# No chunking
# 12548.630000000001
# mem=2070956 KB runtime=15.95 s