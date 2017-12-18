# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# http://answers.opencv.org/question/121651/fata-error-lapacke_h_path-notfound-when-building-opencv-32/
sudo apt-get install liblapacke-dev checkinstall

# Documentation:
sudo apt-get install -y doxygen


# INSTALL THE LIBRARY (YOU CAN CHANGE '3.1.0' FOR THE LAST STABLE VERSION)

sudo apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/2.4.13.4.zip
unzip 2.4.13.4.zip
rm 2.4.13.4.zip
cd opencv-2.4.13.4
mkdir build
cd build
# http://answers.opencv.org/question/121651/fata-error-lapacke_h_path-notfound-when-building-opencv-32/
#cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
cmake -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DWITH_CUDA=ON ..
make -j
sudo make install
sudo ldconfig


# EXECUTE SOME OPENCV EXAMPLES AND COMPILE A DEMONSTRATION

# To complete this step, please visit 'http://milq.github.io/install-opencv-ubuntu-debian'.
