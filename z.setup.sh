#!/bin/bash
# to get rid of MSDOS format do this to this file: sudo sed -i s/\\r//g ./filename
# or, open in nano, control-o and then then alt-M a few times to toggle msdos format off and then save

set -x
sudo apt-get remove -y python python-pip cython
sudo apt autoremove -y
sudo apt-get install -y python3 python3-pip python3-distutils python3-dev python3-numpy
sudo apt-get install -y cython3

sudo pip  install progressbar2
sudo pip3 install progressbar2
sudo pip3 install py2exe

pip  install progressbar2
pip3 install progressbar2
pip3 install py2exe

sudo apt-get install -y texinfo yasm git make automake gcc gcc-c++ pax cvs svn flex bison patch libtoolize hg cmake gettext-autopoint
sudo apt-get install -y libxslt rake
sudo apt-get install -y gperf gyp p7zip docbook-to-man docbook2x pando p7zip

sudo apt-get install -y build-essential autoconf libtool-bin libtool gettext autopoint gyp gperf autogen bzip2 pandoc 
sudo apt-get install -y subversion curl texinfo g++ bison flex cvs yasm automake ed gcc cmake git make pkg-config mercurial unzip pax wget ant
sudo apt-get install -y git-remote-hg libxslt1.1 libxml2 rake docbook-utils docbook-style-xsl docbook-xsl docbook-to-man docbook2x p7zip p7zip-full
sudo apt-get install -y xsltproc itstool autoconf-archive
#sudo apt-get remove -y nasm
sudo apt-get remove -y doxygen
# gendef is installed with mingw
sudo apt-get install -y libmozjs-dev libxmu-dev libgconf2-dev libdbus-1-dev network-manager-dev xserver-xorg-dev # for libproxy
sudo apt-get install -y zlib1g-dev #warning: you may need to install zlib development headers first if you want to build mp4-box on ubuntu
sudo apt-get install -y p7zip-full
sudo apt-get install -y autoconf-archive
sudo apt-get install -y docbook2x docbook-xsl
sudo apt-get install -y dbtoepub docbook-xsl-doc-html docbook-xsl-doc-pdf docbook-xsl-doc-text docbook-xsl-saxon fop libsaxon-java libxalan2-java libxslthl-java xalan

sudo apt-get install -y python3 python3-pip
sudo apt-get install -y ninja-build
#sudo apt-get install -y meson
#pip3 install -y --user meson


cd ~/Desktop
#git clone https://github.com/mesonbuild/meson.git
git clone --depth 1 --branch "0.51.2" https://github.com/mesonbuild/meson.git "meson_git"
cd meson_git
sudo python3 setup.py clean build install register test

export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
cd ~/Desktop
sudo chmod 777 -R *
set +x

#------------------------------------------------------------------------------------------------
# 2017.05.26 x264 has a new dependency on nasm 2.14 or greater ... 
# before we do anything, build NASM if need be
set -x
if [[ ! -d "nasm-2.14.02" ]]; then
   echo "Downloading nasm 2.14.02"
   url="https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz"
   rm -f "nasm-2.14.02.tar.xz"
   curl -4 -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Cache-Control: max-age=0' "$url" --retry 50 -L --output "nasm-2.14.02.tar.xz" --fail # -L means "allow redirection" or some odd :|
   tar -xf "nasm-2.14.02.tar.xz" || unzip "nasm-2.14.02.tar.xz"
   echo "Configuring nasm 2.14.02"
   cd nasm-2.14.02
      ./autogen.sh || exit 1
      ./configure --prefix=/usr --exec_prefix=/usr --enable-sections --enable-lto  || exit 1
      echo "Make nasm 2.14"
      make  || exit 1
      echo "Installing nasm 2.14"
      sudo make install  || exit 1 # sudo so it copies into /usr folder tree
   cd ..
   echo "Done Building and Installing nasm 2.14.02"
fi
set +x
#read -p "After nasm build, press Enter to continue"
#------------------------------------------------------------------------------------------------
set -x

#------------------------------------------------------------------------------------------------
#CUDA SDK Toolkit 10.1 Install Commentary https://github.com/DeadSix27/python_cross_compile_script/issues/83#issuecomment-468670437
#CUDA SDK Toolkit 10.1 Download and Install Guideline https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
#CUDA SDK Toolkit 10.1 Local Runtime Download page for ubuntu
#------------------------------------------------------------
#Source Page
#https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=runfilelocal
#eg for ubuntu 18.04 points to 
#https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run
#eg for ubuntu 18.10 points to 
#https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run
#
#CUDA SDK Toolkit 10.1 Local Runtime Installation
#------------------------------------------------
#Install the TOOLKIT and SAMPLES like: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile
#
#sudo sh ./cuda_10.1.105_418.39_linux-ubuntu-18.04.run --silent --toolkit --samples 
#
#CUDA SDK Toolkit 10.1 - SETUP PATHS READY FOR CROSS-COMPILING
#-------------------------------------------------------------
#The PATH variable needs to include 
#/usr/local/cuda-10.1/bin and /usr/local/cuda-10.1/NsightCompute-<tool-version>. 
#<tool-version> refers to the version of Nsight Compute that ships with the CUDA toolkit, e.g. 2019.1.
#
#To add this path to the PATH variable:
#export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
#In addition, when using the runfile installation method, the LD_LIBRARY_PATH variable needs to contain /usr/local/cuda-10.1/lib64 on a 64-bit system, or /usr/local/cuda-10.1/lib on a 32-bit system
#To change the environment variables for 64-bit operating systems:
#export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
#                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#
#Hence for CUDA SDK Toolkit 10.1 64bit :-
#export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
#                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#
#CUDA SDK Toolkit 10.1 - UNINSTALL NOTES
#---------------------------------------
#To uninstall the CUDA Toolkit, run the uninstallation script provided in the bin directory of the toolkit. 
#By default, it is located in /usr/local/cuda-10.1/bin:#
#
#sudo /usr/local/cuda-10.1/bin/cuda-uninstaller
#
set -x
cd ~/Desktop
# https://developer.nvidia.com/cuda-downloads
# 64bit ubuntu 10.10 local runfile
#cuda_install_file=cuda_10.1.105_418.39_linux.run
#cuda_install_file=cuda_10.1.168_418.67_linux.run
cuda_install_file=cuda_10.1.243_418.87.00_linux.run
if [[ ! -f "$cuda_install_file" ]]; then
   echo "Downloading $cuda_install_file"
   url="http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/$cuda_install_file"
   rm -f "$cuda_install_file"
   curl -4 -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Cache-Control: max-age=0' "$url" --retry 50 -L --output "$cuda_install_file" --fail # -L means "allow redirection" or some odd :|
      echo "Installing $cuda_install_file"
      sudo sh ./$cuda_install_file --silent --toolkit --samples
   cd ..
   echo "Done Building and Installing $cuda_install_file"
fi
set +x
#read -p "After installing $cuda_install_file, press Enter to continue"
#------------------------------------------------------------------------------------------------
set -x
#export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
#                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#------------------------------------------------------------------------------------------------


cd ~/Desktop
