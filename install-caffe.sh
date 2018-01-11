#!/bin/bash

# Author: Yongjie Wang
# Email: wangyongjie@ict.ac.cn
# This script is writen to install caffe on Ubuntu 16.04


# install general dependencies

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev

# install blas
sudo apt-get install libatlas-base-dev

# or install OpenBlas instead of bias
apt-get install libopenblas-dev

# install gflag, google-glog, lmdb
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

# git clone caffe
git clone https://github.com/BVLC/caffe.git

# modify Makefile.config
