FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake git
RUN apt-get -y install libgtk2.0-dev pkg-config
RUN apt-get -y build-essential 
RUN apt-get -y libavcodec-dev 
RUN apt-get -y libavformat-dev 
RUN apt-get -y libswscale-dev 
RUN apt-get -y python3-dev 
RUN apt-get -y python3-numpy 
RUN apt-get -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libcanberra-gtk-module libcanberra-gtk3-module

# RUN git clone https://github.com/opencv/opencv.git
# RUN mkdir -p build && cd build
# RUN cmake ../opencv
# RUN make -j4
# RUN make install

RUN git clone https://github.com/opencv/opencv.git && \
    cd /opencv && mkdir build && cd build && \
    cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j"$(nproc)" && \
    make install && \
    rm -rf /opencv

WORKDIR app

COPY . .

