#!/usr/bin/env bash

mountdir=/tmp/YggDFS/mountdir
cachedir=/tmp/YggDFS/cachedir
rootdir=/tmp/YggDFS/rootdir

mkdir -p $mountdir
mkdir -p $cachedir
mkdir -p $rootdir

# shellcheck disable=SC1010
if [ "$1" == "-d" ]
then
  sudo gdb --args /tmp/tmp.*/cmake-build-raspi-101/bin/YggDFS -o allow_other $mountdir $cachedir $rootdir
else
  # shellcheck disable=SC2211
  sudo /tmp/tmp.*/cmake-build-raspi-101/bin/YggDFS -o allow_other $mountdir $cachedir $rootdir
fi