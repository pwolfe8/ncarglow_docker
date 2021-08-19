FROM ubuntu:20.04

### set your timezone here ###
ARG TIMEZONE="America/New_York"

### set default shell as bash ###
SHELL ["/bin/bash", "-c"]

### apt install prereqs ###
RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=${TIMEZONE} apt install -y \
    cmake \
    gfortran \
    python3.9 \
    python3-pip \
    python3-tk \
    git

### symlink gfortran and python3 ###
RUN ln -s /usr/bin/gfortran /usr/local/bin/gfortran
RUN ln -s /usr/bin/python3 /usr/bin/python

### install python packages ###
RUN pip install \
    pytest \
    numpy \
    matplotlib \
    scipy \
    pandas

### install optional debug packages (xeyes & ping if you need them)
RUN apt install -y \
    x11-apps \
    iputils-ping \
    net-tools \
    vim

### set working directory to /root/ ###
WORKDIR /root/

### uncomment to clone, build, & test ncar glow in docker if you want. otherwise do manually after ###
# RUN git clone https://github.com/space-physics/ncar-glow
# RUN cd ncar-glow && cmake -B build && cmake --build build
# RUN pip install -e ncar-glow
# # pytest runs tests that download geomagnetic indices using FTP (port 21) make sure that port is open if it's closed for some reason
# RUN pytest ncar-glow
