#puppet-gitlab

Puppet manifest to install and configure gitlab

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-gitlab.png)](http://travis-ci.org/icalvete/puppet-gitlab)

See [gitlab site](https://about.gitlab.com/)


## Requisites

Only tested in ubuntu 14.04 LTS (trusty)

##Example:

```puppet
node /ubuntu01.smartpurposes.net/ inherits test_defaults {
  
  class {'gitlab':
    external_url=> 'gitlab.smartpurposes.net',
    ldap=>true,
    ldap_host=> 'metallica.lt.lg',
    ldap_port=> '636',
    ldap_user=> 'cn=Directory Manager',
    ldap_pass=> 'only4you',
    ldap_suffix=>'dc=smartpurposes,dc=net',
    ssl=>true,
    ssl_crt=>'puppet:///modules/roles/gitlab/cert/gitlab.crt',
    ssl_key=>'puppet:///modules/roles/gitlab/cert/gitlab.key'
  }
}

```

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
