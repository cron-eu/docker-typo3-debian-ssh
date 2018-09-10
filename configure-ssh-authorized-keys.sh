#!/usr/bin/env /bin/bash
set -ex

##
# Configure authorized_keys for the www-data user
#

cd /var/www || exit 1

mkdir -p .ssh
chmod 700 .ssh

if [ -f /run/secrets/authorized_keys ] ; then
  cp /run/secrets/authorized_keys .ssh/
  chmod 600 .ssh/authorized_keys
fi

chown www-data .ssh -R
