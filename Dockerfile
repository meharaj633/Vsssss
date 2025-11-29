FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl wget git openssh-client tmate && \
    apt clean

# Keep container alive and start tmate session automatically
CMD tmate -F
