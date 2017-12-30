FROM ubuntu:16.04

#RUN apt-get update \
#    && apt-get install -y --no-install-recommends mysql-client \
#    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates build-essential

RUN git clone https://github.com/alter3d/omdcct \
    && cd omdcct\
    && make

#ENTRYPOINT ["/omdcct/plot"]
