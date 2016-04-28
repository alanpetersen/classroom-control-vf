#
class profile::wordpress {

  # MANAGE apache
  class { 'apache':
    docroot => '/var/wordpress'
  }
  include apache::mod::php

  # MANAGE mysql
  class { '::mysql::server':
    root_password => 'strongpassword',
  }
  class { 'mysql::bindings':
    php_enable => true,
  }

  group { 'wordpress':
    ensure => present,
  }

  user { 'wordpress':
    ensure => present,
    gid    => 'wordpress',
  }

  file { '/var/wordpress':
    ensure => directory,
    owner  => 'wordpress',
    group  => 'wordpress',
    mode   => '0755',
  }

  # MANAGE wordpress
  class { 'wordpress':
    #install_url => 'https://wordpress.org/wordpress-3.8.tar.gz',
    install_dir => '/var/wordpress',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => 'wp_password',
  }

  # BEER O'CLOCK!

}
