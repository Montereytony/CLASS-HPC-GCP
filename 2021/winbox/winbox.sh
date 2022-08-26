#!/bin/bash

set -x

mkdir -p $HOME/.docker-winbox

CONTAINER=$(docker run -v $HOME/.docker-winbox:/home/winbox \
	-d -p 127.0.0.1::22 montereytony/winbox)

echo $CONTAINER

PORT=$(docker port $CONTAINER 22 | sed -e 's/^.*://')
echo $PORT

for x in $(seq 10); do
	sshpass -pwinbox ssh -X -p $PORT -o StrictHostKeyChecking=no \
		-o UserKnownHostsFile=/dev/null \
		winbox@127.0.0.1 wine64 /winbox.exe && break
	sleep 1
done

docker stop $CONTAINER
docker rm -f $CONTAINER
