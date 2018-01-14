#!/bin/bash

# Author: Yongjie Wang
# Email: wangyongjie@ict.ac.cn
# This script is writen to install caffe on Ubuntu 16.04


# install general dependencies

sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev

# install blas
sudo apt-get install -y libatlas-base-dev

# or install OpenBlas instead of bias
# sudo apt-get install -y libopenblas-dev

# install gflag, google-glog, lmdb
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

# git clone caffe
git clone https://github.com/BVLC/caffe.git

# modify Makefile.config
