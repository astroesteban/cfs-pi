ARG VARIANT="20.04"
FROM ubuntu:${VARIANT} as base

ARG DEBIAN_FRONTEND=noninteractive

COPY .docker/scripts scripts/

# Install required packages as well as setup the prettier bash prompt and a
# Python virtual environment.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    cmake \
    ccache \
    doxygen \
    cppcheck \
    clang-format \
    clang-tidy \
    python3 \
    python3-setuptools \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && cat scripts/set_bash_prompt.sh >> ~/.bashrc \
    && python3 -m venv /tmp/cfs-venv \
    && . /tmp/cfs-venv/bin/activate \
    && python3 -m pip install PyQt5 pyzmq \
    && printf '\n[ -d "%s" ] && . %s/bin/activate\n' /tmp/cfs-venv /tmp/cfs-venv >> ~/.bashrc