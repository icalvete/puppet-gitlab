class gitlab::install {
  
  package{ $gitlab::params::pre_package:
    ensure  => present
  }

  wget::fetch { 'download_gitlab':
    source      => "${gitlab::source_path}/${gitlab::source_file}",
    destination => "${gitlab::params::destination}/${gitlab::source_file}",
    timeout     => 0,
    verbose     => false,
  }

  exec{ 'decompress_gitlab':
    command => "/usr/bin/dpkg -i ${gitlab::destination}/$gitlab::source_file",
    user    => 'root',
    require => Wget::Fetch['download_gitlab'],
    unless  => "/usr/bin/test -d ${gitlab::params::gitlab_home}/"
  }
  
  file{"${gitlab::params::gitlab_home}/gitlab.rb":
    ensure  => present,
    content => template("${module_name}/gitlab.rb.erb"),
    mode    => '0600',
    owner   => root,
    group   => root,
    require => Exec['decompress_gitlab']
  }
}
