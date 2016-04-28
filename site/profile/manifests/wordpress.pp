#
class profile::wordpress {

  # MANAGE apache
  class { 'apache':
    docroot => '/var/wordpress'
  }

  # MANAGE mysql

  # MANAGE wordpress

  # BEER O'CLOCK!

}
