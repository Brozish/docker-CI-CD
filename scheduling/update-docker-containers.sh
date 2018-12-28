#!/bin/bash

echo 'Docker containers update. Starting...'

# Download the latest version
docker pull nginx:latest
docker pull gitlab/gitlab-ce:latest

# Recreate docker containers using new images
cd /home/core/etc
/opt/bin/docker-compose up -d

# Remove old docker images
images=$(docker images | grep '<none>' | gawk '{ print $3 }')

echo 'Removing outdated images...'

for j in $images; do
  docker rmi $j
done

echo 'Docker containers update completed.'

exit 0
