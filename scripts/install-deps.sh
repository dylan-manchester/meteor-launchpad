#!/bin/bash

set -e

printf "\n[-] Installing base OS dependencies...\n\n"

# install base dependencies

apt-get update

# ensure we can get an https apt source if redirected
# https://github.com/jshimko/meteor-launchpad/issues/50

apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl bzip2 bsdtar build-essential git gpg gnupg2 gosu

### Conda
# Install our public GPG key to trusted store
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg
# Check whether fingerprint is correct (will output an error message otherwise)
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806
# Add our Debian repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list
apt-get update
apt-get install -y conda
