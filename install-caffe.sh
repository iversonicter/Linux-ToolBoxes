#!/bin/bash

# Author: Yongjie Wang
# Email: yongjie.wang@ntu.edu.sg
# This script is writen to install caffe on Ubuntu 16.04,anaconda python 3.5 or 3.6

# install general dependencies

sudo apt-get update
sudo apt-get install -y build-essential cmake git pkg-config
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev

# install blas
sudo apt-get install -y libatlas-base-dev

# or install OpenBlas instead of bias
# sudo apt-get install -y libopenblas-dev

# install gflag, google-glog, lmdb
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

# install python=3.5 with conda
# conda install python=3.5 or conda install python=3.6

# git clone caffe
cd third
git clone https://github.com/BVLC/caffe.git
cd caffe

# modify Makefile.config
cp ../../Makefile.config .

make -j
# if error like this "cannot find -lboost_python3" appear
# please uncomment this command below
# sudo ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py35.so /usr/lib/x86_64-linux-gnu/liboost_python3.so 
# sudo ldconfig

make pycaffe -j
# if you want to install caffe which support matlab, uncomment this line below
# make matcaffe -j

set Pycaffe='pwd'/python
echo Pycaffe>>~/.bashrc
source ~/.bashrc

# update numpy, protobuf, matplotlib
pip install --upgrade pip
pip install --upgrade numpy
pip install --upgrate protobuf
pip install --upgrade matplotlib

# if install caffe successfully, this command return nothing
python -c 'import caffe'

# if it returns "no module named 'caffe' ", you have to google the error code to find the solutions or  send email to yongjie.wang@ntu.edu.sg

