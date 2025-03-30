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

step_lengths=(1 2 4 8 16)
for step_length in "${step_lengths[@]}"
do
    echo "Step length ${step_length}"
    /usr/bin/time -f"mem=%M KB runtime=%e s" python q2_3.py "/dtu/projects/02613_2025/data/mandelbrot/mandelbrot.raw" 4000 $step_length 2>&1
done