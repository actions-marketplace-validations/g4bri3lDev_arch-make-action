FROM archlinux/base:latest

RUN pacman -Syu --needed --noconfirm base-devel gcc binutils fakeroot sudo make git go tree fftw gtk3 libmtp intltool ppp fuse

RUN useradd -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build
RUN  curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
RUN cd /home/build
RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay
RUN echo -e "y\ny" | makepkg -si
RUN cd ..
RUN rm -rf yay
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
