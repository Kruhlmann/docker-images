ARG DEBIAN_VERSION=bookworm

FROM ghcr.io/linuxserver/baseimage-debian:${DEBIAN_VERSION}
ENV USERNAME="dockeruser"
ENV HOME="/home/$USERNAME"

RUN useradd -m --shell /bin/bash -u 1000 $USERNAME