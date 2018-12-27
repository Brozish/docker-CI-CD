#!/bin/bash

echo 'Docker containers update. Starting...'

# Download the latest version
docker pull nginx:latest
docker pull gitlab/gitlab-ce:latest

# Stop current docker containers
current=$(docker ps -a | grep Up | gawk '{ print $2 }')

for i in $current; do
  docker stop $i
done

# Recreate docker containers using new images
cd /home/core/etc
/opt/bin/docker-compose up -d

while true; do
    echo 'Checking status Gitlab...'

    output=$(docker inspect -f {{.State.Health.Status}} gitlab)

    if [ "$output" == "healthy" ]
    then
        echo 'Gitlab status is healthy.'
        break
    fi

    sleep 30
done

docker exec gitlab gitlab-rake gitlab:backup:restore force=yes

# Remove old docker images
images=$(docker images | grep '<none>' | gawk '{ print $3 }')

echo 'Removing outdated images...'

for j in $images; do
  docker rmi $j
done

echo 'Docker containers update completed.'

exit 0
