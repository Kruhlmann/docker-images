# Docker images

Collection of docker images I use for development and production.

## OCaml

Example usage:

```Dockerfile
ARG OCAML_VERSION=3.11
ARG DEBIAN_VERSION=bookworm

FROM cr.kruhlmann.dev/debian-${DEBIAN_VERSION}-ocaml-${OCAML_VERSION}
WORKDIR /home/$USERNAME
USER $USERNAME
COPY Makefile dune-project *.opam .gitignore .gitattributes .
COPY ./make ./make
COPY ./bin ./bin
COPY ./lib ./lib

RUN eval $(opam env) \
    && opam install . --yes --deps-only \
    && make
```

## Python

Example usage:

```Dockerfile
ARG PYTHON_VERSION=3.11
ARG DEBIAN_VERSION=bookworm

FROM cr.kruhlmann.dev/debian-${DEBIAN_VERSION}-python-${PYTHON_VERSION} AS compile-image
COPY --chown=$USERNAME:$USERNAME . .
USER $USERNAME
RUN . "$VENV/bin/activate" \
    && make install

FROM cr.kruhlmann.dev/debian-${DEBIAN_VERSION}-python-${PYTHON_VERSION}
COPY --from=compile-image --chown=$USERNAME:$USERNAME "$VENV" "$VENV"
RUN ln -sf "$VENV/bin/my_bin" /usr/local/bin/my_bin
USER $USERNAME
WORKDIR /home/$USERNAME
ENTRYPOINT ["my_bin"]
```
