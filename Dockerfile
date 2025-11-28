FROM ubuntu:latest
RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:meharaj463' | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
