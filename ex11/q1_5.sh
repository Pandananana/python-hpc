#!/bin/bash
#BSUB -J array2[1-5]
#BSUB -q hpc
#BSUB -W 5
#BSUB -R "rusage[mem=512MB] span[hosts=1]"
#BSUB -w ended(array)
#BSUB -n 1
#BSUB -o array2_%J_%I.out
#BSUB -e array2_%J_%I.err