FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG NINJA_VERSION=v1.10.0

RUN apt-get update
RUN apt-get install build-essential cmake git wget unzip -y
RUN wget https://github.com/ninja-build/ninja/releases/download/${NINJA_VERSION}/ninja-linux.zip && \
unzip ninja-linux.zip && \
mv ninja /usr/local/bin/ninja && \
rm ninja-linux.zip
