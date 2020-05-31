#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

make clean
make
