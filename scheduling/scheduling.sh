su -

vim /etc/systemd/system/certbot-renew.service
vim /etc/systemd/system/certbot-renew.timer
systemctl enable certbot-renew.timer
systemctl enable certbot-renew
systemctl start certbot-renew.timer
systemctl start certbot-renew

vim /etc/systemd/system/backup-gitlab.service
vim /etc/systemd/system/backup-gitlab.timer
systemctl enable backup-gitlab.timer
systemctl enable backup-gitlab
systemctl start backup-gitlab.timer
systemctl start backup-gitlab

systemctl list-timers --all

exit
