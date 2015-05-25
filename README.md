mystation
===
My portable custom workstation

```
docker run -it --rm \
  -v `pwd`:/root/shared \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e USER \
  -h mystation \
  srhopkins/mystation
```
