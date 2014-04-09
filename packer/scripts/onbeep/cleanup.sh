#!/bin/bash -eux
#
# this removes specific linux kernels, such as
# linux-image-3.11.0-15-generic but
# * keeps the current kernel
# * does not touch the virtual packages, e.g.'linux-image-generic', etc.
#
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v `uname -r` | xargs apt-get -y purge

# delete X11 libraries
apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6

# delete oddities
apt-get -y purge popularity-contest

apt-get -y autoremove
apt-get -y clean
rm -f /tmp/chef*deb
