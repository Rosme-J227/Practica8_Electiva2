FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server sudo

RUN mkdir /var/run/sshd

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd

RUN usermod -aG sudo ansible

RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]