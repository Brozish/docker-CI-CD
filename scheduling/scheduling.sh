su -

vim /etc/systemd/system/certbot-renew.service
vim /etc/systemd/system/certbot-renew.timer
systemctl enable --now certbot-renew.timer
systemctl start certbot-renew.timer

vim /etc/systemd/system/backup-gitlab.service
vim /etc/systemd/system/backup-gitlab.timer
systemctl enable --now backup-gitlab.timer
systemctl start backup-gitlab.timer

vim update-docker-containers.timer
vim update-docker-containers.service
systemctl enable --now update-docker-containers.timer
systemctl start update-docker-containers.timer

systemctl list-timers --all

exit
