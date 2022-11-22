#!/bin/bash

gem5=build/X86/gem5.opt
config=611_project/configs/project.py

#Arrays containing all pipeline depths, CPU clock speeds(GHz), and cache sizes(MB) used
depths=('7' '10' '15' '20' '25' '30' '40' '50')
cpu_clock_speeds=('4.562GHz' '6.238GHz' '8.741GHz' '10.931GHz' '12.863GHz' '14.59GHz' '17.519GHz' '19.940GHz')
cache_sizes=('1' '2' '4' '16' '32' '64' '128' '256' '512')

#Array of all our test files
binaries[0]='611_project/benchmarks/int/addition'
binaries[1]='611_project/benchmarks/int/multiplication'
binaries[2]='611_project/benchmarks/int/subtraction'
binaries[3]='611_project/benchmarks/int/division'
binaries[4]='611_project/benchmarks/float/addition'
binaries[5]='611_project/benchmarks/float/multiplication'
binaries[6]='611_project/benchmarks/float/subtraction'
binaries[7]='611_project/benchmarks/float/division'

#Name of output files for tests
stats[0]='stats_int_add.txt'
stats[1]='stats_int_mul.txt'
stats[2]='stats_int_sub.txt'
stats[3]='stats_int_div.txt'
stats[4]='stats_flt_add.txt'
stats[5]='stats_flt_mul.txt'
stats[6]='stats_flt_sub.txt'
stats[7]='stats_flt_div.txt'

#Make output directories if they don't exist
rm -rf output
mkdir output
for depth in "${depths[@]}"; do
    [ -d output/$depth ] || mkdir output/$depth
done

[ -d output/"${depths[0]}"/32 ] || mkdir  output/"${depths[0]}"/32
[ -d output/"${depths[0]}"/128 ] || mkdir  output/"${depths[0]}"/128
[ -d output/"${depths[0]}"/256 ] || mkdir  output/"${depths[0]}"/256
[ -d output/"${depths[0]}"/512 ] || mkdir  output/"${depths[0]}"/512
[ -d output/"${depths[1]}"/32 ] || mkdir  output/"${depths[1]}"/32
[ -d output/"${depths[1]}"/128 ] || mkdir  output/"${depths[1]}"/128
[ -d output/"${depths[1]}"/256 ] || mkdir  output/"${depths[1]}"/256
[ -d output/"${depths[2]}"/2 ] || mkdir  output/"${depths[2]}"/2
[ -d output/"${depths[2]}"/32 ] || mkdir  output/"${depths[2]}"/32
[ -d output/"${depths[2]}"/64 ] || mkdir  output/"${depths[2]}"/64
[ -d output/"${depths[2]}"/128 ] || mkdir  output/"${depths[2]}"/128
[ -d output/"${depths[3]}"/1 ] || mkdir  output/"${depths[3]}"/1
[ -d output/"${depths[3]}"/16 ] || mkdir  output/"${depths[3]}"/16
[ -d output/"${depths[3]}"/64 ] || mkdir  output/"${depths[3]}"/64
[ -d output/"${depths[3]}"/128 ] || mkdir  output/"${depths[3]}"/128
[ -d output/"${depths[4]}"/2 ] || mkdir  output/"${depths[4]}"/2
[ -d output/"${depths[4]}"/16 ] || mkdir  output/"${depths[4]}"/16
[ -d output/"${depths[4]}"/32 ] || mkdir  output/"${depths[4]}"/32
[ -d output/"${depths[4]}"/128 ] || mkdir  output/"${depths[4]}"/128
[ -d output/"${depths[5]}"/4 ] || mkdir  output/"${depths[5]}"/4
[ -d output/"${depths[5]}"/16 ] || mkdir  output/"${depths[5]}"/16
[ -d output/"${depths[5]}"/32 ] || mkdir  output/"${depths[5]}"/32
[ -d output/"${depths[5]}"/64 ] || mkdir  output/"${depths[5]}"/64
[ -d output/"${depths[6]}"/2 ] || mkdir  output/"${depths[6]}"/2
[ -d output/"${depths[6]}"/16 ] || mkdir  output/"${depths[6]}"/16
[ -d output/"${depths[6]}"/32 ] || mkdir  output/"${depths[6]}"/32
[ -d output/"${depths[6]}"/64 ] || mkdir  output/"${depths[6]}"/64
[ -d output/"${depths[7]}"/2 ] || mkdir  output/"${depths[7]}"/2
[ -d output/"${depths[7]}"/16 ] || mkdir  output/"${depths[7]}"/16
[ -d output/"${depths[7]}"/32 ] || mkdir  output/"${depths[7]}"/32
[ -d output/"${depths[7]}"/64 ] || mkdir  output/"${depths[7]}"/64

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[0]}"/32/"${stats[i]}" $config --l1_size="32kB" --latency=2 --cpu_clock="${cpu_clock_speeds[0]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[0]}"/128/"${stats[i]}"  $config --l1_size="128kB" --latency=3 --cpu_clock="${cpu_clock_speeds[0]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[0]}"/256/"${stats[i]}"  $config --l1_size="256kB" --latency=4 --cpu_clock="${cpu_clock_speeds[0]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[0]}"/512/"${stats[i]}"  $config --l1_size="512kB" --latency=7 --cpu_clock="${cpu_clock_speeds[0]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[1]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=3 --cpu_clock="${cpu_clock_speeds[1]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[1]}"/128/"${stats[i]}"  $config --l1_size="128kB" --latency=4 --cpu_clock="${cpu_clock_speeds[1]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[1]}"/256/"${stats[i]}"  $config --l1_size="256kB" --latency=5 --cpu_clock="${cpu_clock_speeds[1]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[2]}"/2/"${stats[i]}"  $config --l1_size="2kB" --latency=3 --cpu_clock="${cpu_clock_speeds[2]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[2]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=4 --cpu_clock="${cpu_clock_speeds[2]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[2]}"/64/"${stats[i]}"  $config --l1_size="64kB" --latency=5 --cpu_clock="${cpu_clock_speeds[2]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[2]}"/128/"${stats[i]}"  $config --l1_size="128kB" --latency=6 --cpu_clock="${cpu_clock_speeds[2]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[3]}"/1/"${stats[i]}"  $config --l1_size="1kB" --latency=4 --cpu_clock="${cpu_clock_speeds[3]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[3]}"/16/"${stats[i]}"  $config --l1_size="16kB" --latency=5 --cpu_clock="${cpu_clock_speeds[3]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[3]}"/64/"${stats[i]}"  $config --l1_size="64kB" --latency=6 --cpu_clock="${cpu_clock_speeds[3]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[3]}"/128/"${stats[i]}"  $config --l1_size="128kB" --latency=7 --cpu_clock="${cpu_clock_speeds[3]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[4]}"/2/"${stats[i]}"  $config --l1_size="2kB" --latency=5 --cpu_clock="${cpu_clock_speeds[4]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[4]}"/16/"${stats[i]}"  $config --l1_size="16kB" --latency=6 --cpu_clock="${cpu_clock_speeds[4]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[4]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=7 --cpu_clock="${cpu_clock_speeds[4]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[4]}"/128/"${stats[i]}"  $config --l1_size="128kB" --latency=8 --cpu_clock="${cpu_clock_speeds[4]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[5]}"/4/"${stats[i]}"  $config --l1_size="4kB" --latency=6 --cpu_clock="${cpu_clock_speeds[5]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[5]}"/16/"${stats[i]}"  $config --l1_size="16kB" --latency=7 --cpu_clock="${cpu_clock_speeds[5]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[5]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=8 --cpu_clock="${cpu_clock_speeds[5]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[5]}"/64/"${stats[i]}"  $config --l1_size="64kB" --latency=9 --cpu_clock="${cpu_clock_speeds[5]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[6]}"/2/"${stats[i]}"  $config --l1_size="2kB" --latency=7 --cpu_clock="${cpu_clock_speeds[6]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[6]}"/16/"${stats[i]}"  $config --l1_size="16kB" --latency=7 --cpu_clock="${cpu_clock_speeds[6]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[6]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=9 --cpu_clock="${cpu_clock_speeds[6]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[6]}"/64/"${stats[i]}"  $config --l1_size="64kB" --latency=10 --cpu_clock="${cpu_clock_speeds[6]}" "${binaries[i]}" 
done

for i in {0..7}; do
    $gem5 --stats-file=../output/"${depths[7]}"/2/"${stats[i]}"  $config --l1_size="2kB" --latency=8 --cpu_clock="${cpu_clock_speeds[7]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[7]}"/16/"${stats[i]}"  $config --l1_size="16kB" --latency=9 --cpu_clock="${cpu_clock_speeds[7]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[7]}"/32/"${stats[i]}"  $config --l1_size="32kB" --latency=10 --cpu_clock="${cpu_clock_speeds[7]}" "${binaries[i]}" 
    $gem5 --stats-file=../output/"${depths[7]}"/64/"${stats[i]}"  $config --l1_size="64kB" --latency=12 --cpu_clock="${cpu_clock_speeds[7]}" "${binaries[i]}" 
done