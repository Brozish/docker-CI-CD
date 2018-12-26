#!/bin/bash

echo 'Backup Gitlab CE. Starting...'

docker exec -ti gitlab gitlab-rake gitlab:backup:create DIRECTORY=gitlab

echo 'Backup has completed.'

exit 0
