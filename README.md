mystation
===
My portable custom workstation

```
docker run -it --rm \
  -e USER \
  -v `pwd`:/home/${USER}/shared
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -h mystation \
  srhopkins/mystation
```
