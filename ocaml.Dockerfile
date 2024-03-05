ARG DEBIAN_VERSION=bookworm
ARG OCAML_VERSION

FROM cr.kruhlmann.dev/debian:${DEBIAN_VERSION}

ARG OCAML_VERSION

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        opam \
        libssl-dev \
        zlib1g-dev \
        llvm \
        curl \
        wget \
        m4 \
        git \
        build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && opam init -y --compiler=${OCAML_VERSION} --disable-sandboxing

