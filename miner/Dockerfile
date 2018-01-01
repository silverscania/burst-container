FROM ubuntu:16.04

EXPOSE 8080

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git ca-certificates build-essential \
    cmake libssl-dev wget sudo

RUN useradd -m burstminer && \
    echo "burstminer:burstminer" | chpasswd

RUN git clone https://github.com/Creepsky/creepMiner.git

# install-poco needs root
RUN cd creepMiner && sh ./install-poco.sh

COPY mining.conf /creepMiner

RUN chown -R burstminer /creepMiner
USER burstminer

WORKDIR /creepMiner
RUN cmake CMakeLists.txt -DNO_GPU=ON -DCMAKE_BUILD_TYPE=RELEASE \
    && make -j 4
 
# Only works when run from the bin dir
WORKDIR bin
ENTRYPOINT ["./creepMiner"]
CMD ["-c", "../mining.conf"]
