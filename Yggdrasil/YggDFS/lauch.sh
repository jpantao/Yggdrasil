#!/usr/bin/env bash

mountdir=/tmp/YggDFS/mountdir
rootdir=/tmp/YggDFS/rootdir

mkdir -p $mountdir
mkdir -p $rootdir

# shellcheck disable=SC2211
sudo /tmp/tmp.*/cmake-build-raspi-101/bin/YggDFS -o allow_other "$@" $mountdir $rootdir