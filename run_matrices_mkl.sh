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

echo Compiling with mkl
icc -qopenmp -O3 -mkl=sequential ./matrices-mkl.c -o ./matrices-mkl
echo Running with mkl
./matrices-mkl
