#!/bin/bash

echo "downloading part2"
echo

wget https://raw.githubusercontent.com/vikoiv/z3c/1.2_sapling-explorer/part2.sh

echo "---------------"
# Install zcash dependencies:

echo "installing zcash"
echo

sudo apt-get install \
build-essential pkg-config libc6-dev m4 g++-multilib \
autoconf libtool ncurses-dev unzip git python3 python3-zmq \
zlib1g-dev curl bsdmainutils automake libtinfo5

# download zcash source from fork with block explorer patches
git clone https://github.com/vikoiv/zcash-patched-for-explorer zcash

cd zcash

# switch to sprout version of source code; this will change in the future
git checkout vikoiv-patch-1

# download proving parameters
./zcutil/fetch-params.sh

# build patched zcash
./zcutil/build.sh --disable-tests -j$(nproc)

# install lintian
sudo apt-get -y install lintian

# package zcash
./zcutil/build-debian-package.sh

# install zcash
sudo dpkg -i zcash-2.0.1-4e1c255-amd64.deb

echo "---------------"
echo "installing node and npm"
echo

# install node and dependencies
cd ..
sudo apt-get -y install npm

echo "---------------"
echo "installing nvm"
echo

# install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

echo "logout of this shell, log back in and run:"
echo "bash part2.sh"
