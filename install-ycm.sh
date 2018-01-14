#!/bin/bash

sudo apt-get -y install build-essential cmake

# step 1: download vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# step 2: download youcompleteme
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

# step 3: compile youcompleteme
./install.py --clang-completer

# step 3: try another way to compile youcomplete
# if ./install.py failed (CMake Error at ycm/CMakeLists.txt:102 (file):
# expected hash: [58c1171f326108cfb7641441c5ede7846d58823bce3206c86a84c7ef7748860d]
# actual hash: [e3b0c44298fc1c149afbf4c8996fb92427aGe41e4649b934ca495991b7852b855]
# status: [22;"HTTP response code said error"]


# step 3.1 update clang for ubuntu 16.04, the default clang is v3.8. Ycm id designed to work with libclang version 3.9 or higher. So you should install update clang.
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
# sudo apt-get update
# sudo apt-get install -y clang-5.0

# step 3.2 compile YCM mannually. 
# cd ~ & mkdir ycm_build
# cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp 
# cmake --build . --target ycm_core --config Release


# step 4. modify the .vimrc file 
