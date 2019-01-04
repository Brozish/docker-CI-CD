#!/bin/bash

echo 'Docker containers update. Starting...'

# Download the latest version
docker pull nginx:latest
docker pull gitlab/gitlab-ce:latest
docker pull gitlab/gitlab-runner:latest
docker pull certbot/certbot:latest

# Stop and remove current gitlab-runner docker container
docker rm -f gitlab-runner

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

docker run -d --rm -it --name gitlab-runner \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume /srv/gitlab-runner/config:/etc/gitlab-runner \
gitlab/gitlab-runner:latest

docker exec -ti gitlab-runner ssh-keygen -t rsa -b 4096 -C "brozish@gmail.com" -N "" -f "/root/.ssh/id_rsa"
docker exec -ti gitlab-runner cat /root/.ssh/id_rsa.pub >> /home/core/.ssh/authorized_keys

# Remove old docker images
images=$(docker images | grep '<none>' | gawk '{ print $3 }')

echo 'Removing outdated images...'

for j in $images; do
  docker rmi $j
done

echo 'Docker containers update completed.'

exit 0
