#!/bin/bash
#BSUB -J q2_3
#BSUB -q hpc
#BSUB -W 2
#BSUB -o logs/q2_%J.out
#BSUB -e logs/q2_%J.err
#BSUB -R "select[model == XeonE5_2660v3]"

lscpu
sleep 60