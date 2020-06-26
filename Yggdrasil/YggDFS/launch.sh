#!/usr/bin/env bash

mountdir=/tmp/YggDFS/mountdir
rootdir=/tmp/YggDFS/rootdir
cachedir=/tmp/YggDFS/cachedir

mkdir -p $mountdir
mkdir -p $rootdir
mkdir -p $cachedir

# shellcheck disable=SC2211
sudo /tmp/tmp.*/cmake-build-raspi-101/bin/YggDFS -o allow_other $mountdir $cachedir $rootdir
