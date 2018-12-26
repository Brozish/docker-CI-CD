sudo vim etc/gitlab/gitlab.rb

gitlab_rails['backup_keep_time'] = 86400

gitlab_rails['backup_upload_connection'] = {
  'provider'              => 'AWS',
  'region'                => 'ams3',
  'aws_access_key_id'     => 'access_key',
  'aws_secret_access_key' => 'secret_access_key',
  'endpoint'              => 'https://ams3.digitaloceanspaces.com'
}

gitlab_rails['backup_upload_remote_directory'] = 'brozish'



docker exec -ti gitlab bash
gitlab-ctl reconfigure
gitlab-rake gitlab:backup:create DIRECTORY=gitlab
