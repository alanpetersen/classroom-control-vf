#
class nginx (
  $package = $nginx::params::package,
  $owner   = $nginx::params::owner,
  $group   = $nginx::params::group,
  $docroot = $nginx::params::default_docroot,
  $confdir = $nginx::params::confdir,
  $logdir  = $nginx::params::logdir,
  $nginx_user = $nginx::params::nginx_user,
) inherits nginx::params {

  $svc = 'nginx'
  $source_base = "puppet:///modules/${module_name}"

  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
  }

  # PACKAGE
  package { $package:
    ensure => present,
  }

  # DOCROOT
  file { $docroot:
    ensure => directory,
  }

  # WEB PAGE
  file { "${docroot}/index.html":
    source => "${source_base}/index.html",
  }

  # CONFIG FILES
  file { "${confdir}/nginx.conf":
    #source  => "${source_base}/nginx.conf",
    content => template('nginx/nginx.conf.erb'),
    require => Package[$package],
    notify  => Service[$svc],
  }

  file { "${confdir}/conf.d/default.conf":
    #source  => "${source_base}/default.conf",
    content => template('nginx/default.conf.erb'),
    require => Package[$package],
    notify  => Service[$svc],
  }

  # SERVICE
  service { $svc:
    ensure => running,
    enable => true,
  }

}
