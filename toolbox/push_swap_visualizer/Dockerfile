FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get install g++-11 -y
RUN apt-get install git-core cmake make -y
RUN apt-get install libgl1-mesa-dev libx11-dev libxrandr-dev libudev-dev libfreetype6-dev -y
RUN git clone https://github.com/o-reo/push_swap_visualizer.git visualizer
WORKDIR /visualizer
RUN mkdir build
WORKDIR /visualizer/build
# RUN cmake -D CMAKE_CXX_COMPILER=/usr/bin/clang++-10 ..
# RUN make
# CMD [ "./bin/visualizer" ]