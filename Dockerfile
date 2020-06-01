FROM archlinux/base:latest

RUN pacman -Syu --needed --noconfirm base-devel binutils fakeroot sudo make git go tree

RUN useradd build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
