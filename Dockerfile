# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common

# Install any additional packages you need
# RUN apt-get install -y <additional-packages>

# Set up a non-root user (optional)
RUN useradd -ms /bin/bash devuser && echo 'devuser:password' | chpasswd && adduser devuser sudo

# Set the default user
USER devuser

# Set the working directory
WORKDIR /home/devuser

# Expose any ports if necessary
# EXPOSE <port-number>

# Command to run when starting the container
CMD ["bash"]
