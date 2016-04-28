#
class profile::wordpress {

  # MANAGE apache
  class { 'apache':
    docroot => '/var/wordpress'
  }

  # MANAGE mysql
  class { '::mysql::server':
    root_password => 'strongpassword',
  }

  # MANAGE wordpress
  class { 'wordpress':
    install_dir => '/var/wordpress',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => 'wp_password',
  }

  # BEER O'CLOCK!

}
