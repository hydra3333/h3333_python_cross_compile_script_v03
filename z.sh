#!/bin/bash
set -x
echo "------------------------------------------------------------------------------------------------"
export
echo "------------------------------------------------------------------------------------------------"
# 2019.11.20 change these 3 lines per documentation https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#ubuntu-x86_64-deb		 
export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
echo "------------------------------------------------------------------------------------------------"
export
echo "------------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------------"
# 2019.11.20 change these 3 lines per documentation https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#ubuntu-x86_64-deb		 
export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
echo "------------------------------------------------------------------------------------------------"
export
echo "------------------------------------------------------------------------------------------------"
exit


# per     https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#ubuntu-x86_64-run
# and per https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#environment-setup 
# ignoring https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#cross-platform since Win64 usn't a supported target o/s
export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/nsight-compute-2019.5.0${PATH:+:${PATH}}
$ export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
						 