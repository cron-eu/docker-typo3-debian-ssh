#!/usr/bin/env /bin/bash

/configure-ssh-authorized-keys.sh

exec /usr/sbin/sshd -D
