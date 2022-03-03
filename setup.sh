#!/usr/bin/env bash

# Check version of Ubuntu
. /etc/lsb-release
echo "Linux distribution: $DISTRIB_DESCRIPTION"
if [[ "$DISTRIB_DESCRIPTION" != *"Ubuntu 20.04"* ]]; then
  echo "Please use Ubuntu 20.04." >&2
  exit 1
fi

# Upgrade all packages
sudo apt update
sudo apt -y upgrade
sudo apt -y autoremove

# Install npm
sudo apt install -y npm

# Install bazelisk
sudo npm update
sudo npm install -g @bazel/bazelisk

# Install pip
sudo apt install -y python3-pip
sudo apt install -y python-is-python3

# Setup 'tools'
sudo pip install ./tools --upgrade
