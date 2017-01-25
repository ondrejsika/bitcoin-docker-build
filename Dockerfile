FROM debian:8

MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>

RUN apt-get update --fix-missing

RUN apt-get install -y \
    git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils \
    libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev

COPY libdb4.8_4.8.30-2_amd64.deb /root
RUN dpkg -i /root/libdb4.8_4.8.30-2_amd64.deb

COPY libdb4.8++_4.8.30-2_amd64.deb /root
RUN dpkg -i /root/libdb4.8++_4.8.30-2_amd64.deb

COPY libdb4.8-dev_4.8.30-2_amd64.deb /root
RUN dpkg -i /root/libdb4.8-dev_4.8.30-2_amd64.deb

COPY libdb4.8++-dev_4.8.30-2_amd64.deb /root
RUN dpkg -i /root/libdb4.8++-dev_4.8.30-2_amd64.deb

