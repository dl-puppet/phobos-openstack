class openstack::user inherits openstack
{
  user { $user :
    ensure      => $user_ensure,
    uid         => $user_uid,
    managehome  => $user_managehome,
    shell       => $user_shell,
  }
}