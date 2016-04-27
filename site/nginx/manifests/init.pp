#
class nginx {

  $docroot = '/var/www'
  $pkg = 'nginx'
  $svc = 'nginx'
  $nginx_configdir = '/etc/nginx'
  $source_base = 'puppet:///modules/nginx'

  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  # PACKAGE
  package { $pkg:
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
  file { "${nginx_configdir}/nginx.conf":
    source  => "${source_base}/nginx.conf",
    require => Package[$pkg],
    notify  => Service[$svc],
  }

  file { "${nginx_configdir}/conf.d/default.conf":
    source  => "${source_base}/default.conf",
    require => Package[$pkg],
    notify  => Service[$svc],
  }

  # SERVICE
  service { $svc:
    ensure => running,
    enable => true,
  }

}
