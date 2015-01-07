class gitlab::params {

  $pre_package = ['openssh-server', 'postfix']

  $source_path = 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04'
  $source_file = 'gitlab_7.6.1-omnibus.5.3.0.ci.1-1_amd64.deb'
  $destination = '/tmp'

  $root_path           = '/etc'
  $gitlab_home         = "${root_path}/gitlab"
  $s3cmd_config_path   = hiera('s3cmd_config_path_backup')
  $s3cmd_config_bucket = hiera('s3cmd_config_bucket_backup')
  $repositories_path   = '/var/opt/gitlab/git-data/repositories/'
  $hooks_path          = '/opt/gitlab/embedded/service/gitlab-shell/hooks/'
}
