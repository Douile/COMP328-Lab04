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

# Compile with O0
echo Compiling with O0
icc -qopenmp -O0 ./matrices.c -o ./matrices-o0
echo Running with O0
time ./matrices-o0

# Compile with O3
echo Compiling with O3
icc -qopenmp -O3 ./matrices.c -o ./matrices-o3
echo Running with O3
time ./matrices-o3

# Check timings for both
hyperfine --warmup 5 "icc -qopenmp -O0 ./matrices.c -o ./matrices-o0" "icc -qopenmp -O3 ./matrices.c -o ./matrices-o3"
