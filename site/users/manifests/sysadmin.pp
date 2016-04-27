#
define users::sysadmin(
  $group = 'admin',
  $shell = '/bin/bash',
) {

  if !defined(Group[$group]) {
    group { $group:
      ensure => present,
    }
  }

  user { $title:
    ensure => present,
    gid    => $group,
    shell  => $shell,
    home   => "/home/${title}",
  }

  file { "/home/${title}/scripts":
    ensure => directory,
    owner  => $title,
    group  => $group,
    mode   => '0700',
  }

  file { "/home/${title}/scripts/script1.sh":
    ensure => file,
    owner  => $title,
    group  => $group,
    mode   => '0700',
    source => 'puppet:///modules/users/script1.sh',
  }

  file { "/home/${title}/scripts/script2.sh":
    ensure => file,
    owner  => $title,
    group  => $group,
    mode   => '0700',
    source => 'puppet:///modules/users/script2.sh',
  }

}
