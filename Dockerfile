FROM python:3

ENV CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/python3.7m/

RUN apt update && apt upgrade -y &&  apt install -y curl tar make gcc git build-essential wget bash \ 
		cmake g++ zlib1g-dev zlib1g bzip2 libbz2-dev && \
	wget https://github.com/ablab/spades/archive/v0.5-recomb.tar.gz && \
	tar xf v0.5-recomb.tar.gz && cd spades-0.5-recomb/assembler && \
	./spades_compile.sh && cp -R bin / && cd / && \
	rm -rf spades-0.5-recomb v0.5-recomb.tar.gz

WORKDIR /data

CMD pathracer


