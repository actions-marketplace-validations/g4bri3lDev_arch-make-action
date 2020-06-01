FROM archlinux/base:latest

RUN pacman -Syu --needed --noconfirm base-devel gcc binutils fakeroot sudo make git go tree fftw gtk3 libmtp intltool ppp fuse nss libnma xl2tpd libnm openssl libsecret python libxml2 libzip gcc8 gnuplot libxlsxwriter
 
RUN useradd -m build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER build
RUN  curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
