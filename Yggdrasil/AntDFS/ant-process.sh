#!/usr/bin/env bash

mountpoint=/home/jpantao/AntDFS/test

launch_command="/home/jpantao/Clion/cmake-build-raspi-*/bin/AntDFS -o allow_other $mountpoint"

make_dir () {
  mkdir -p $mountpoint
}

help() {
  echo "$0 -h    help"
  echo "$0 -k    kill AntDFS"
  echo "$0 -d    launch AntDFS in debug mode (gdb)"
  exit
}

# shellcheck disable=SC2032
destroy () {
  sudo fusermount -uz $mountpoint
  # shellcheck disable=SC2046
  # shellcheck disable=SC2006
  # shellcheck disable=SC2009
  # shellcheck disable=SC2033
  sudo kill -3 `ps aux | grep AntDFS | head -n 1 | awk '{print $2}'`
  exit
}

launch () {
  bash -c "sudo rm -rf /home/jpantao/AntDFS/antdfs.remote/*"
  bash -c "sudo rm -rf /home/jpantao/AntDFS/antdfs.blocks/*"
  bash -c "sudo $launch_command"
}

launch_debug () {
  bash -c "sudo rm -rf /home/jpantao/AntDFS/antdfs.remote/*"
  bash -c "sudo rm -rf /home/jpantao/AntDFS/antdfs.blocks/*"
  bash -c "sudo gdb --args $launch_command"
}

# shellcheck disable=SC1073
case "$@" in *"-h"*) help ;; esac
case "$@" in *"-k"*) destroy ;; esac
make_dir # create required directories
case "$@" in *"-d"*) launch_debug ;; esac
launch # default



