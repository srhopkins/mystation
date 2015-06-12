mystation
===
My portable custom workstation. 

Basic run
---
Basic usage using your own .bashrc, etc if present.
```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER} \
  -v /var/lib/docker:/var/lib/docker \
  --net=host \
  --privileged \
  srhopkins/mystation
```

If you need to specify a specific uid for your username you can pass it through the UID environment variable.
```
docker run -it --rm \
  -e USER \
  -e UID=`id -u`
  -v `pwd`:/home/${USER} \
  -v /var/lib/docker:/var/lib/docker \
  --net=host \
  --privileged \
  srhopkins/mystation
```

