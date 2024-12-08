FROM alpine
LABEL Description="Build environment for the packet-decoder project"

RUN apk update && apk add --no-cache \
    g++ \
    gcc \
    cmake \
    make \
    python3 \
    py3-pip \
    git \
    gdb \
    bash \
    openssh \
    libstdc++ \
    libc-dev && \
    pip3 install --break-system-packages conan

WORKDIR /app

ENTRYPOINT [ "/app/configure.sh", "docker" ]