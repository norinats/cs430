#!/bin/bash

#SBATCH -J OpenMP_MM     # job name
#SBATCH -o log_slurm.txt  # output and error file name (%j expands to jobID)
#SBATCH -n 2           # total number of tasks requested
#SBATCH -N 1 		  # number of nodes you want to run on	
#SBATCH -p classroom  # queue (partition) -- defq, eduq, gpuq, shortq
#SBATCH -t 00:05:00       # run time (hh:mm:ss)
# Generally needed modules:
module load slurm
module load gcc

# Execute the program
export OMP_NUM_THREADS=$4
./bin/omp-mm $1 $2 $3

## Some examples:
# mpirun python3 script.py

# Exit if mpirun errored:
status=$?
if [ $status -ne 0 ]; then
    exit $status
fi

# Do some post processing.