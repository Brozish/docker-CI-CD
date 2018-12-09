# https://mozilla.github.io/server-side-tls/ssl-config-generator/
# https://gist.github.com/cecilemuller/a26737699a7e70a7093d4dc115915de8#stronger-settings-for-a

docker run --rm -it --name certbot \
-v "/home/core/etc/letsencrypt:/etc/letsencrypt" \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d brozish.com

docker run --rm -it --name certbot \
-v "/home/core/etc/letsencrypt:/etc/letsencrypt" \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d www.brozish.com
