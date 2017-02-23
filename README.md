# Build

```
$ docker build -t phocean/beef .
```

# Run

```
$ docker run --rm -it --net=host -v /home/phocean/.msf4:/root/.msf4:Z -v /tmp/msf:/tmp/data:Z --name=beef phocean/beef"
```
