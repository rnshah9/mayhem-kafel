FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y bison flex make

ADD . /repo
WORKDIR /repo
RUN make -j8
RUN make tools

RUN mkdir -p /deps
RUN ldd /repo/tools/dump_policy_bpf/dump_policy_bpf | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /repo/tools/dump_policy_bpf/dump_policy_bpf /repo/tools/dump_policy_bpf/dump_policy_bpf
ENV LD_LIBRARY_PATH=/deps
