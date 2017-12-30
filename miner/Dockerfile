FROM ubuntu:16.04

EXPOSE 80

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git ca-certificates build-essential \
    cmake libssl-dev wget sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN git clone https://github.com/Creepsky/creepMiner.git \
    && cd creepMiner \
    && sh ./install-poco.sh \
    && cmake CMakeLists.txt -DNO_GPU=ON -DCMAKE_BUILD_TYPE=RELEASE \
    && make -j 4

COPY mining.conf /creepMiner/
 
# Only works when run from the bin dir
WORKDIR /creepMiner/bin
ENTRYPOINT ["./creepMiner"]
CMD ["-c", "../mining.conf"]
