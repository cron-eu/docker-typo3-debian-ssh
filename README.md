TYPO3 Docker Debian SSH Container
====

Abstract
----

This is a SSH Docker Container for the existing typo3-debian Docker image

Usage
----

```bash
cat <<EOF >docker-compose.ssh.yml
---
version: '3.1'
secrets:
  authorized_keys:
    file: ~/.ssh/id_rsa.pub
services:
  ssh:
    secrets:
      - authorized_keys
    image: remuslazar/typo3-debian-ssh:latest
    ports:
      - '2200:22'
    links:
      - db
      - web
    volumes:
      - data:/var/www
EOF
```

Start the SSH container using:

```
docker-compose -f docker-compose.yml -f docker-compose.ssh.yml up -d
```

### Access the ssh container via SSH

```bash
ssh -p 2200 www-data@$(docker-machine ip $DOCKER_MACHINE_NAME)
```

----

Development
----

### Build this image locally

```
docker build -t remuslazar/typo3-debian-ssh:latest .
```

Author
----

Remus Lazar (rl at cron dot eu)
