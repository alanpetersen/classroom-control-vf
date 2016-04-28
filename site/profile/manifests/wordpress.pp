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

  # BEER O'CLOCK!

}
