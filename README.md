mystation
===
My portable custom workstation. This container requires that you have `docker` group on the host allowing docker commands to be run without sudo.

From: <a href="http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo">http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo</a>
  * Add the docker group if it doesn't already exist.
```
sudo groupadd docker
```
  * Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user.
```
sudo gpasswd -a ${USER} docker
```
  * Restart the Docker daemon:
```
sudo service docker restart
```
  * If you are on Ubuntu 14.04 and up use docker.io instead:
```
sudo service docker.io restart
```
  * Either do a `newgrp docker` or log out/in to activate the changes to groups.

Basic run
---
This creates a user in the container of the same username as current login of the host and mounts current working directory to user's home/shared.
```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER}/shared
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -h mystation \
  srhopkins/mystation
```

This is the same as above but mounts cwd to user's home/. This is useful if you want to provide your own .bashrc, etc.
```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER} \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -h mystation \
  srhopkins/mystation
```

If you need to specify a specific uid for your username you can pass it through the UID environment variable.
```
docker run -it --rm \
  -e USER \
  -e UID=`id -u`
  -v `pwd`:/home/${USER} \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -h mystation \
  srhopkins/mystation
```

