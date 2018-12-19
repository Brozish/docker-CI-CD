sudo usermod -aG docker core
id -nG



sudo mkdir -p /opt/bin
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /opt/bin/docker-compose
sudo chmod +x /opt/bin/docker-compose



# https://coreos.com/os/docs/latest/adding-swap.html
su -
mkdir -p /var/vm
fallocate -l 4096m /var/vm/swapfile
chmod 600 /var/vm/swapfile
mkswap /var/vm/swapfile

vim /etc/systemd/system/var-vm-swapfile.swap
[Unit]
Description=CoreOS swap

[Swap]
What=/var/vm/swapfile

[Install]
WantedBy=multi-user.target

systemctl enable --now var-vm-swapfile.swap
echo 'vm.swappiness=10' | tee /etc/sysctl.d/80-swappiness.conf
systemctl restart systemd-sysctl



docker pull nginx
docker pull certbot/certbot
docker pull gitlab/gitlab-ce
