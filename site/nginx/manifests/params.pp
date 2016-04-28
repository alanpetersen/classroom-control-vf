#
class nginx::params {

  case $::osfamily {
    'redhat','debian': {
      $package         = 'nginx'
      $owner           = 'root'
      $group           = 'root'
      $default_docroot = '/var/www'
      $confdir         = '/etc/nginx'
      $logdir          = '/var/log/nginx'
    }
    'windows': {
      $package         = 'nginx-service'
      $owner           = 'Administrator'
      $group           = 'Administrators'
      $default_docroot = 'c:/ProgramData/nginx/html'
      $confdir         = 'c:/ProgramData/nginx'
      $logdir          = 'c:/ProgramData/nginx/logs'
    }
    default: {
      fail("${::osfamily} is not supported by this module")
    }
  }

  $nginx_user = $::osfamily ? {
    'redhat'  => 'nginx',
    'debian'  => 'www-data',
    'windows' => 'nobody',
  }
}
