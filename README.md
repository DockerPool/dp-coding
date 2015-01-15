dp-coding
===

ENV of the dockerpool website


# Usage:

## Build image
e.g., to build version 1.2, should run
```
docker build -t dp:v1.2 .
```

## Run container

After the image is built successfully.

Start a mongodb container `db_run` first.
```
docker run -d  -p 107:22  -v /opt/data/db_run/dbrun:/usr/lib/mongodb -v /root/.ssh/:/root/.ssh --name db_run mongod:dwj /run.sh
```

Then start three website containers with
```
docker run -d -p 208:3003 -v /root/runner/dockerpool:/dockerpool -p 108:22 -v /root/.ssh/:/root/.ssh/ --name dp001 --link db_run:to_db dp:v1.2
docker run -d -p 210:3003 -v /root/runner/dockerpool:/dockerpool  --name dp002 --link db_run:to_db dp:v1.2
docker run -d -p 211:3003 -v /root/runner/dockerpool:/dockerpool  --name dp003 --link db_run:to_db dp:v1.2
```
