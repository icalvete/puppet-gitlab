class gitlab::backup {

  cron{ 'gitlab_backup_repositories':
    command => "/usr/bin/s3cmd -c ${gitlab::params::s3cmd_config_path} put --recursive ${gitlab::params::repositories_path} s3://${gitlab::params::s3cmd_config_bucket}/`hostname`${gitlab::params::repositories_path}",
    user    => 'root',
    hour    => 3,
    minute  => 1
  }
  
  cron{ 'gitlab_backup_hooks':
    command => "/usr/bin/s3cmd -c ${gitlab::params::s3cmd_config_path} put --recursive ${gitlab::params::hooks_path} s3://${gitlab::params::s3cmd_config_bucket}/`hostname`${gitlab::params::hooks_path}",
    user    => 'root',
    hour    => 3,
    minute  => 1
  }
}
