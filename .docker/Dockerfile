ARG VARIANT="22.04"
FROM ubuntu:${VARIANT} AS dev

ARG DEBIAN_FRONTEND=noninteractive

COPY .docker/scripts scripts/

# Install required packages as well as setup the prettier bash prompt and a
# Python virtual environment.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    iputils-ping \
    openssh-server \
    sshpass \
    build-essential \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    gdb-multiarch \
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

# create this environment variable so we can use it in vs code.
ENV PYTHON_INSTALL_LOC=/tmp/cfs-venv/bin/python3

# * The following sections are optional but useful for using SSH + Git in the container
# Setup SSH
RUN mkdir -p -m 0700 ${HOME}/.ssh && \
    mkdir /var/run/sshd && \
    echo "StrictHostKeyChecking no " > ~/.ssh/config && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

# Create symbolic links to the secrets so that we can use them with git
# Note that we need to delete any existing files to avoid a simlink error
RUN ln -s /run/secrets/ssh_public_key ~/.ssh/id_rsa.pub && \
   ln -s /run/secrets/ssh_private_key ~/.ssh/id_rsa && \
   ln -s /run/secrets/gitconfig ~/.gitconfig
