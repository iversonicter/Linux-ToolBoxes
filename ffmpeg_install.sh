# THis is a script about how to install ffmpeg on Ubuntu 
# Author: Yongjie Wang
# Email:  wangyongjie@ict.ac.cn
# For this scripts I have followed offical link https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#ffmpeg



# Get the Dependencies 
sudo apt-get update
sudo apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
  libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev

# Making sure for installing pre-required dependancies
sudo apt-get git

# Source dir
mkdir ~/ffmpeg_sources



# install NASM
cd ~/ffmpeg_sources && \
wget http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01.tar.bz2 && \
tar xjvf nasm-2.13.01.tar.bz2 && \
cd nasm-2.13.01 && \
./autogen.sh && \
./configure  && \
make -j && \
make install -j




# Installing yasm, if you want install yasm from source code. commit line 36, and uncommit line 39~44
#sudo apt-get install yasm

#cd ~/ffmpeg_sources && \
wget -O yasm-1.3.0.tar.gz http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
tar xzvf yasm-1.3.0.tar.gz && \
cd yasm-1.3.0 && \
./configure && \
make -j && \
make install -j





# Installing libx264, if you want to install libx264 from source code, commit line 51 and uncommit line 54~58
# sudo apt-get install libx264-dev

# Install libx264 from source code
git -C x264 pull 2> /dev/null || git clone --depth 1 http://git.videolan.org/git/x264 && \
cd x264 && \
./configure --enable-static && \
make -j && \
make install -j




# Install libx265, if you want to install libx265 from source code. commit line 64 and uncommit line 67~71
#sudo apt-get install libx265-dev

# Installing libx265
cd ~/ffmpeg_sources && \
if cd x265 2> /dev/null; then hg pull && hg update; else hg clone https://bitbucket.org/multicoreware/x265; fi && \
cd x265/build/linux && \
cmake -G "Unix Makefiles" -DENABLE_SHARED:bool=off ../../source && \
make -j && \
make install -j




# Install libvpx 
# sudo apt-get install libvpx-dev

# Install libvpx from source code
cd ~/ffmpeg_sources && \
git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
cd libvpx && \
./configure --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
make -j&& \
make install -j




# Install libfdk-acc
# sudo apt-get install libfdk-aac-dev

# Installing libfdk-aac
cd ~/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --disable-shared && \
make -j&& \
make install -j

# Installing libmp3lame
# sudo apt-get install libmp3lame-dev

# Installing libmp3lame from source code
cd ~/ffmpeg_sources && \
wget -O lame-3.100.tar.gz http://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
tar xzvf lame-3.100.tar.gz && \
cd lame-3.100 && \
./configure --disable-shared --enable-nasm && \
make -j && \
make install -j





# Installing libopus
# sudo apt-get install libopus-dev

# Installing libopus
cd ~/ffmpeg_sources && \
git -C opus pull 2> /dev/null || git clone --depth 1 https://github.com/xiph/opus.git && \
cd opus && \
./autogen.sh && \
./configure --disable-shared && \
make -j && \
make install -j





# Installing ffmpeg
cd ~/ffmpeg_sources
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
./configure \
  --pkg-config-flags="--static" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
make -j &&\
make install -j &&\
hash -r
