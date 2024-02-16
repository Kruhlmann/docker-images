ARG DEBIAN_VERSION=bookworm
ARG PYTHON_VERSION

FROM cr.kruhlmann.dev/debian:${DEBIAN_VERSION}

ARG DEBIAN_VERSION=bookworm
ARG PYTHON_VERSION

ENV VENV="$HOME/.venv"
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$VENV/bin:$PYENV_ROOT/bin:$PATH:$PATH"

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        make \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libxml2-dev \
        libxmlsec1-dev \
        libffi-dev \
        liblzma-dev \
        git \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://pyenv.run | bash \
    && pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pyenv virtualenv venv \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME \
    && ln -sf $HOME/.pyenv/versions/venv $VENV

