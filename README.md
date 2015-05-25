mystation
===
My portable custom workstation. This container requires that you have docker group on the host allowing docker commands to be run without sudo.

Basic run
---
This creates a user on container of ther same user you are logged in as on host and mounts current working directory to user's home/shared.
```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER}/shared
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/bash_completion.d/docker:/etc/bash_completion.d/docker \
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
  -v /etc/bash_completion.d/docker:/etc/bash_completion.d/docker \
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
  -v /etc/bash_completion.d/docker:/etc/bash_completion.d/docker \
  -h mystation \
  srhopkins/mystation
```

