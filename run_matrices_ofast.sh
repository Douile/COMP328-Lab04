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
module load compilers/intel/2019u5


# Compile with Ofast
echo Compiling with Ofast
icc -qopenmp -Ofast -parallel ./matrices.c -o ./matrices-ofast
echo Running with Ofast
time ./matrices-ofast

