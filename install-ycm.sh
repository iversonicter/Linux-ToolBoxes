!#/bin/bash

# step 1: download vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# step 2: download youcompleteme
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

# step 3: compile youcompleteme
./install.py --clang-completer

# step 4: Upload .vimrc file to home directory
