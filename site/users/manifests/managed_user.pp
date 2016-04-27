#
define users::managed_user(
  $gid   = $title,
  $home  = "/home/${title}",
  $shell = '/bin/bash',
) {

  if !defined(Group[$gid]) {
    group { $gid:
      ensure => present,
    }
  }

  user { $title:
    ensure     => present,
    gid        => $gid,
    home       => $home,
    shell      => $shell,
    managehome => true,
  }

  file { $home:
    ensure => directory,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
  }

  file { "${home}/.ssh":
    ensure => directory,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
  }

}
