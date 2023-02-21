#!/bin/sh

# Use course queue
#SBATCH -p course

# Include current directory
#SBATCH -D ./

# Include environment variables
#SBATCH --export=ALL

# Time limit for job
#SBATCH -t 3

# Load the compiler module
# module load compilers/intel/2019u5
# module load libs/intel-mkl/2019u5/bin

maxThreads=${SLURM_CPUS_PER_TASK:-1} # if ‘-c’ not used then default to 1

echo Compiling with mkl
icc -qopenmp -O3 -mkl=parallel ./matrices-mkl.c -o ./matrices-mkl-threaded
echo Running with mkl (threaded)
for k in `seq 1 $maxThreads`; do 
    export OMP_NUM_THREADS=$k 
    echo using ${OMP_NUM_THREADS} OpenMP threads 
    ./matrices-mkl-threaded
done
