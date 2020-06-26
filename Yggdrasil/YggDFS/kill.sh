#!/bin/bash

sudo fusermount -uz /tmp/YggDFS/mountdir

# shellcheck disable=SC2046
# shellcheck disable=SC2006
# shellcheck disable=SC2009
sudo kill -9 `ps aux | grep YggDFS | head -n 1 | awk '{print $2}'`
