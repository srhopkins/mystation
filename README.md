mystation
===
My portable custom workstation. 

Basic run
---
This is the same as above but mounts cwd to user's home/. This is useful if you want to provide your own .bashrc, etc.
```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER} \
  -h mystation \
  srhopkins/mystation
```

If you need to specify a specific uid for your username you can pass it through the UID environment variable.
```
docker run -it --rm \
  -e USER \
  -e UID=`id -u`
  -v `pwd`:/home/${USER} \
  -h mystation \
  srhopkins/mystation
```

