class openstack::user inherits openstack
{
  group { '$group':
    ensure => present,
  }
  user { '$user':
    ensure      => $user_ensure,
    gid         => $user_gid,
    managehome  => $user_managehome,
    home        => $user_home,
    password    => $user_password,
  }
}