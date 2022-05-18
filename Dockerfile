FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y bison flex make

ADD . /repo
WORKDIR /repo
RUN make -j8
RUN make tools
