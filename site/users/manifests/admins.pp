#
class users::admins {

  users::managed_user { 'jose': }
  users::managed_user { 'alice': }
  users::managed_user { 'chen': }

  Users::Sysadmin {
    group => 'admin',
    shell => '/bin/sh',
  }

  users::sysadmin { 'bob': }
  users::sysadmin { 'mary': }




}
