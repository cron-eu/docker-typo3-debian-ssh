FROM remuslazar/typo3-debian:latest

ENV SSH_USER www-data

# install OpenSSH server
RUN apt-get update \
  && apt-get install -y openssh-server && mkdir /var/run/sshd \
  && rm -rf /var/lib/apt/lists/*

COPY /init.sh /
COPY /configure-ssh-authorized-keys.sh /
CMD /init.sh
