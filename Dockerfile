FROM ubuntu:22.04

RUN apt update && apt install -y \
    curl wget sudo git openssh-client && \
    apt clean

# Install sshx.io client
RUN curl -fsSL https://sshx.io/get | sh

CMD ["sshx"]
