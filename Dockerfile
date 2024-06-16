# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages including openssh-server
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    openssh-server

# Configure SSH server
RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Expose SSH port
EXPOSE 2222

# Set up a non-root user (optional)
RUN useradd -ms /bin/bash devuser && echo 'devuser:password' | chpasswd && adduser devuser sudo

# Set the default user back to root to start SSH
USER root

# Start SSH service and keep the container running
CMD service ssh start && tail -f /dev/null
