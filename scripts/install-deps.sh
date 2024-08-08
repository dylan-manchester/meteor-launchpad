#!/bin/bash

set -e

printf "\n[-] Installing base OS dependencies...\n\n"

# install base dependencies

apt-get update

# ensure we can get an https apt source if redirected
# https://github.com/jshimko/meteor-launchpad/issues/50

apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl bzip2 bsdtar build-essential python git gnupg gosu
