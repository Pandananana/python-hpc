#!/bin/bash
#BSUB -J combhist
#BSUB -q hpc
#BSUB -W 2
#BSUB -R "rusage[mem=512MB] span[hosts=1]"
#BSUB -w done(subhist)
#BSUB -n 1
#BSUB -o logs/combhist_%J_%I.out
#BSUB -e logs/combhist_%J_%I.err

python q2_2.py