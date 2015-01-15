dp-coding
===

ENV of the dockerpool website


# Usage:

## Build image
e.g., to build version 1.0, should run
```
docker build -t dp:v1.0 .
```

## Run container
After the image is built successfully, start a container with

```
docker run -d -p 3003:3003  -v /root/dockerpool:/dockerpool  dp:v1.0 
```
