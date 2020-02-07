# burpsuite
docker burpsuite

```
docker build . -t burpsuite
docker run --rm -dit -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/ burpsuite
```
