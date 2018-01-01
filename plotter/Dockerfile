FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates build-essential

#RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install -y gcc-7
#ENV CC=gcc-7

RUN git clone https://github.com/alter3d/omdcct \
    && cd omdcct\
    && make

ENTRYPOINT ["/omdcct/plot"]
CMD ["--help"]
