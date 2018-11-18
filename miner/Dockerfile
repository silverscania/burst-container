FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git ca-certificates build-essential \
    cmake libssl-dev wget sudo curl
RUN apt-get install -y --no-install-recommends python-pip
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install conan

RUN useradd -m burstminer && \
    echo "burstminer:burstminer" | chpasswd

#RUN git clone https://github.com/Creepsky/creepMiner.git
COPY getLatestRelease.sh /getLatestRelease.sh
RUN /getLatestRelease.sh

RUN chown -R burstminer /creepMiner
USER burstminer

WORKDIR /creepMiner
RUN conan install . --build=missing -s compiler.libcxx=libstdc++11
RUN cmake CMakeLists.txt -DNO_GPU=ON -DCMAKE_BUILD_TYPE=RELEASE \
    && make -j 4

COPY --chown=burstminer mining.conf /creepMiner

EXPOSE 8080
 
# Only works when run from the resources dir
WORKDIR resources
ENV LD_LIBRARY_PATH ../lib
ENTRYPOINT ["../bin/creepMiner"]
CMD ["-c", "/creepMiner/mining.conf"]
