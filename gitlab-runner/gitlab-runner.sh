docker pull gitlab/gitlab-runner


sudo mkdir /srv/gitlab-runner
sudo mkdir /srv/gitlab-runner/config


docker run -d --rm -it --name gitlab-runner \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume /srv/gitlab-runner/config:/etc/gitlab-runner \
gitlab/gitlab-runner:latest


docker exec -ti gitlab-runner bash
gitlab-runner register
