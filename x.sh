#!/bin/bash
# to get rid of MSDOS format do this to this file: sudo sed -i s/\\r//g ./filename
# or, open in nano, control-o and then then alt-M a few times to toggle msdos format off and then save

set -x
export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
cd ~/Desktop
rm -fv ./0.debug-ff.log

./h3333_cross_compiler_v03.001.py --force --debug -d liblsw_holywu 2>&1 | tee -a ./0.debug-ff.log
exit
read -p "After, press Enter to continue"

./h3333_cross_compiler_v03.001.py --force --debug -d libogg 2>&1 | tee -a ./0.debug-ff.log
read -p "After, press Enter to continue"

./h3333_cross_compiler_v03.001.py --force --debug -d libopus 2>&1 | tee -a ./0.debug-ff.log
read -p "After, press Enter to continue"

./h3333_cross_compiler_v03.001.py --force --debug -d libsndfile 2>&1 | tee -a ./0.debug-ff.log
read -p "After, press Enter to continue"

./h3333_cross_compiler_v03.001.py --force --debug -d librubberband 2>&1 | tee -a ./0.debug-ff.log
read -p "After, press Enter to continue"

./h3333_cross_compiler_v03.001.py --force --debug -p ffmpeg_static_non_free_opencl  2>&1 | tee -a ./0.debug-ff.log
#./h3333_cross_compiler_v03.001.py --force --debug -p ffmpeg_static_non_free_opencl  2>&1 | tee ./0.debug-ff.logg
