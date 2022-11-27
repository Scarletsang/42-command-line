FROM debian:latest
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git-core gcc cmake make -y
RUN git clone https://github.com/o-reo/push_swap_visualizer.git visualizer
WORKDIR /visualizer
RUN mkdir build && cd build
RUN cmake ..
RUN make .
CMD [ "./bin/visualizer" ]