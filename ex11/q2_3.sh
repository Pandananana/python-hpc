#!/bin/bash
#BSUB -J subhist[1-203]
#BSUB -q hpc
#BSUB -W 2
#BSUB -R "rusage[mem=512MB] span[hosts=1]"
#BSUB -n 1
#BSUB -o logs/subhist_%J_%I.out
#BSUB -e logs/subhist_%J_%I.err

JOBID=$(($LSB_JOBINDEX - 1))

python q2_1.py $JOBID