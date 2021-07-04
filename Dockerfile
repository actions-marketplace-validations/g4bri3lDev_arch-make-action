FROM archlinux:latest

RUN pacman -Syu --needed --noconfirm base-devel gcc binutils fakeroot sudo make git go tree fftw gtk3 libmtp intltool ppp fuse2 nss libnma xl2tpd libnm openssl libsecret python python-setuptools libxml2 libzip gcc gnuplot imagemagick gcc-libs xdg-user-dirs rsync xorg-util-macros
 
RUN useradd -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build
#RUN  curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
