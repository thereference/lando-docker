# Docker container for using Lando

In order to use this container, you will need to execute the following commands:

```
docker run --privileged --name some-docker -d docker:stable-dind
docker run -ti --link some-docker:docker -v /var/run/docker.sock:/var/run/docker.sock thereference/lando-docker:latest /bin/bash
```
