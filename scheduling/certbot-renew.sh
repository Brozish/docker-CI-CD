#!/bin/bash

echo 'Update ssl certificates. Starting...'

/usr/bin/docker run --rm -it --name certbot \
--volume /home/core/etc/letsencrypt:/etc/letsencrypt \
certbot/certbot:latest renew

echo 'Update completed.'

exit 0
