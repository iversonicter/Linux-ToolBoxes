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
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make && \
make install




# Installing yasm, if you want install yasm from source code. commit line 36, and uncommit line 39~44
sudo apt-get install yasm

#cd ~/ffmpeg_sources && \
#wget -O yasm-1.3.0.tar.gz http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
#tar xzvf yasm-1.3.0.tar.gz && \
#cd yasm-1.3.0 && \
#./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
#make && \
#make install





# Installing libx264, if you want to install libx264 from source code, commit line 51 and uncommit line 54~58
sudo apt-get install libx264-dev

# Install libx264 from source code
t -C x264 pull 2> /dev/null || git clone --depth 1 http://git.videolan.org/git/x264 && \
cd x264 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static && \
PATH="$HOME/bin:$PATH" make && \
make install




# Install libx265, if you want to install libx265 from source code. commit line 64 and uncommit line 67~71
sudo apt-get install libx265-dev

# Installing libx265
sudo apt-get install cmake mercurial
cd ~/ffmpeg_sources
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install
make distclean





# Install libvpx 
sudo apt-get install libvpx-dev

# Install libvpx from source code
cd ~/ffmpeg_sources && \
git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
cd libvpx && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
PATH="$HOME/bin:$PATH" make && \
make install




# Install libfdk-acc
sudo apt-get install libfdk-aac-dev

# Installing libfdk-aac
cd ~/ffmpeg_sources
wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master
tar xzvf fdk-aac.tar.gz
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean

# Installing libmp3lame
sudo apt-get install libmp3lame-dev

# Installing libmp3lame from source code
cd ~/ffmpeg_sources && \
wget -O lame-3.100.tar.gz http://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz && \
tar xzvf lame-3.100.tar.gz && \
cd lame-3.100 && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
PATH="$HOME/bin:$PATH" make && \
make install





# Installing libopus
sudo apt-get install libopus-dev

# Installing libopus
cd ~/ffmpeg_sources
wget http://downloads.xiph.org/releases/opus/opus-1.1.tar.gz
tar xzvf opus-1.1.tar.gz
cd opus-1.1
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make clean






# Installing ffmpeg
cd ~/ffmpeg_sources
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" \
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
PATH="$HOME/bin:$PATH" make
make install
make distclean
hash -r
