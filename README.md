mystation
===
My portable custom workstation

```
docker run -it --rm \
  -v `pwd`:/root/shared \
  -v `which docker`:`which docker` \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -h mystation \
  srhopkins/mystation
```
