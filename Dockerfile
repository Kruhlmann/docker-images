ARG DEBIAN_VERSION=bookworm

FROM ghcr.io/linuxserver/baseimage-debian:${DEBIAN_VERSION}
ENV USERNAME="dockeruser"
ENV HOME="/home/$USERNAME"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        locales \
    && localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && useradd -m --shell /bin/bash -u 1000 $USERNAME
