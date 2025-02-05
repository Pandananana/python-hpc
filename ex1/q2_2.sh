#!/bin/bash
#BSUB -J q2_2
#BSUB -q hpc
#BSUB -W 1
#BSUB -o logs/q2_%J.out
#BSUB -e logs/q2_%J.err
#BSUB -B
#BSUB -N

sleep 120