#!/bin/bash
#BSUB -J q2_4
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q2_%J.out
#BSUB -e logs/q2_%J.err
#BSUB -R "span[hosts=1] rusage[mem=10MB]"
#BSUB -n 4

sleep 60