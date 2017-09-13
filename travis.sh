#!/bin/sh

set -e

cd /pkg

# makepkg cannot (and should not) be run as root:
useradd -m notroot

# Allow notroot to run stuff as root (to install dependencies):
mkdir /etc/sudoers.d
echo "notroot ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/notroot
chmod 400 /etc/sudoers.d/notroot

# Also, make sure we can do the actual building
chmod 777 /pkg

# Generally, refreshing without sync'ing is discouraged, but we've a clean
# environment here.
pacman -Sy --noconfirm base-devel

# Let's get to it!
sudo -u notroot gpg --recv-keys 5FAF0A6EE7371805
sudo -u notroot makepkg -fs --noconfirm
