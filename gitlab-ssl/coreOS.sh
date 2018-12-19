mkdir gitlab
mkdir gitlab/logs
mkdir gitlab/data
mkdir gitlab/ssl
sudo cp ~/etc/letsencrypt/live/gitlab.brozish.com/fullchain.pem ~/etc/gitlab/ssl/gitlab.brozish.com.crt
sudo cp ~/etc/letsencrypt/live/gitlab.brozish.com/privkey.pem ~/etc/gitlab/ssl/gitlab.brozish.com.key
sudo cp ~/etc/letsencrypt/dhparam.pem ~/etc/gitlab/ssl/dhparam.pem
