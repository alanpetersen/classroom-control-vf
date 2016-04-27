#
define users::managed_user(
  $gid   = $title,
  $home  = "/home/${title}",
  $shell = '/bin/bash',
) {

  user { $title:
    ensure     => present,
    gid        => $gid,
    home       => $home,
    shell      => $shell,
    managehome => true,
  }

  file { "${home}/.ssh":
    ensure => directory,
    owner  => $title,
    group  => $gid,
    mode   => '0600',
  }

}
