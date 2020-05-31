FROM archlinux/base:latest

RUN pacman -Syu --needed --noconfirm binutils fakeroot sudo make git

RUN useradd build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
