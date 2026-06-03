FROM ubuntu:24.04

# Avoid prompts during apt install
ENV DEBIAN_FRONTEND=noninteractive

# Update apt and install dependencies
RUN apt-get update && apt-get install -y \
    p7zip-full \
    gawk \
    coreutils \
    bc \
    brotli \
    clang \
    cmake \
    cpio \
    curl \
    webp \
    ffmpeg \
    file \
    attr \
    git \
    openjdk-17-jdk \
    lz4 \
    make \
    perl \
    protobuf-compiler \
    python3 \
    python3-venv \
    python3-pip \
    rsync \
    sed \
    sudo \
    tar \
    unzip \
    xxd \
    zip \
    zstd \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user "builder" with passwordless sudo
RUN useradd -m -s /bin/bash builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set the working directory
WORKDIR /UN1CA

# Switch to the new user
USER builder

# Default command
CMD ["/bin/bash"]
