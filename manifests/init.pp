class gitlab (

  $external_url = undef,
  $ldap         = false,
  $ldap_host    = undef,
  $ldap_port    = undef,
  $ldap_user    = undef,
  $ldap_pass    = undef,
  $ldap_suffix  = undef,
  $ssl          = false,
  $ssl_crt      = undef,
  $ssl_key      = udef,
  $s3_backup    = false

) inherits gitlab::params {

  if ! $external_url {
    fail(':external_url parameter must be defined')
  }

  if $ldap and ! $ldap_host {
    fail(':ldap_host parameter must be defined')
  }

  if $ldap and ! $ldap_port {
    fail(':ldap_port parameter must be defined')
  }

  if $ldap and ! $ldap_user {
    fail(':ldap_user parameter must be defined')
  }

  if $ldap and ! $ldap_pass {
    fail(':ldap_pass parameter must be defined')
  }

  if $ldap and ! $ldap_suffix {
    fail(':ldap_suffix parameter must be defined')
  }
  
  if $ssl and ! $ssl_crt {
    fail(':ssl_crt parameter must be defined')
  }

  if $ssl and ! $ssl_key {
    fail(':ssl_key parameter must be defined')
  }

  anchor {'gitlab::begin':
    before => Class['gitlab::install']
  }
  class {'gitlab::install':
    require => Anchor['gitlab::begin']
  }
  class {'gitlab::config':
    require => Class['gitlab::install']
  }
  if $s3_backup {
    class {'gitlab::backup':
      require => Class['gitlab::config'],
      before  => Anchor['gitlab::end']
    }
  }
  anchor {'gitlab::end':
    require => Class['gitlab::config']
  }
}
