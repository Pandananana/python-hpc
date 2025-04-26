#!/bin/bash
#BSUB -J array[1-10]
#BSUB -q hpc
#BSUB -W 5
#BSUB -R "rusage[mem=512MB] span[hosts=1]"
#BSUB -n 1
#BSUB -o array_%J_%I.out
#BSUB -e array_%J_%I.err