FROM python:3

ENV CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/python3.7m/

RUN apt update && apt upgrade -y &&  apt install -y curl tar make gcc git build-essential wget bash \ 
		cmake g++ zlib1g-dev zlib1g bzip2 libbz2-dev && \
	wget https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz && \
	tar xf boost_1_70_0.tar.gz && \
	wget https://github.com/ablab/spades/archive/v0.5-recomb.tar.gz && \
	tar xf v0.5-recomb.tar.gz && cd spades-0.5-recomb/assembler && \
	rm -rf ext/include/boost && mv /boost_1_70_0/boost ext/include && \
	sed -i '347d' src/projects/pathracer/main.cpp && \
	sed -i '48d' src/common/sequence/sequence_tools.hpp && \
	./spades_compile.sh && cp -R bin / && cd / && \
	rm -rf boost_1_70_0 spades-0.5-recomb boost_1_70_0.tar.gz v0.5-recomb.tar.gz

WORKDIR /data

CMD pathracer


