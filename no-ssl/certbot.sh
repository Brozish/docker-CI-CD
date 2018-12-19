docker run --rm -it --name certbot \
--volume /home/core/etc/letsencrypt:/etc/letsencrypt \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d brozish.com

docker run --rm -it --name certbot \
--volume /home/core/etc/letsencrypt:/etc/letsencrypt \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d www.brozish.com

docker run --rm -it --name certbot \
--volume /home/core/etc/letsencrypt:/etc/letsencrypt \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d gitlab.brozish.com

docker run --rm -it --name certbot \
--volume /home/core/etc/letsencrypt:/etc/letsencrypt \
certbot/certbot:latest \
certonly --webroot -w /etc/letsencrypt --email brozish@gmail.com -d www.gitlab.brozish.com
