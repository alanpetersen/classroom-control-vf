#
define users::sysadmin(
  $gid   = 'admin',
  $shell = '/bin/bash',
  $home  = "/home/${title}",
) {

  if !defined(Group[$gid]) {
    group { $gid:
      ensure => present,
    }
  }

  user { $title:
    ensure     => present,
    gid        => $gid,
    shell      => $shell,
    home       => $home,
    managehome => true,
  }

  file { $home:
    ensure => directory,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
  }

  $scripts_dir = "${home}/scripts"

  file { $scripts_dir:
    ensure => directory,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
  }

  file { "${scripts_dir}/script1.sh":
    ensure => file,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
    source => 'puppet:///modules/users/script1.sh',
  }

  file { "${scripts_dir}/script2.sh":
    ensure => file,
    owner  => $title,
    group  => $gid,
    mode   => '0700',
    source => 'puppet:///modules/users/script2.sh',
  }

}
