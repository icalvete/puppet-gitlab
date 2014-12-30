class gitlab::config {

  exec{ 'configure_gitlab':
    command  => '/usr/bin/gitlab-ctl reconfigure',
  }
  
  if $gitlab::ssl {

    
    file{ "${gitlab::params::gitlab_home}/ssl/":
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    file { 'gitlab_ssl_crt':
      ensure  => present,
      path    => "${gitlab::params::gitlab_home}/ssl/${gitlab::external_url}.crt",
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      source  => $gitlab::ssl_crt,
      require => File["${gitlab::params::gitlab_home}/ssl"]
    }

    file { 'gitlab_ssl_key':
      ensure  => present,
      path   => "${gitlab::params::gitlab_home}/ssl/${gitlab::external_url}.key",
      owner   => 'root',
      group   => 'root',
      mode    => '0400',
      source  => $gitlab::ssl_key,
      require => File["${gitlab::params::gitlab_home}/ssl"]
    }
  }
}

