class openstack 
(  
  ######### PACKAGES ########
  $package_manage               = $openstack::params::package_manage,
  $package_name                 = $openstack::params::package_name,
  $package_ensure               = $openstack::params::package_ensure,    

  ###### CONFIG_FILES ###### 
  $file_ensure                  = $openstack::params::file_ensure,      
  $file_backup                  = $openstack::params::file_backup,           
  $file_group                   = $openstack::params::file_group,        
  $file_mode                    = $openstack::params::file_mode,        
  $file_owner                   = $openstack::params::file_owner,       

  ######### SERVICES ########
  $service_name                 = $openstack::params::service_name, 
  $service_ensure               = $openstack::params::service_ensure,            
  $service_enable               = $openstack::params::service_enable,   

  ####### USER #######  
  $user                         = $openstack::params::user,
  $group                        = $openstack::params::group,
	$user_ensure                  = $openstack::params::user_ensure,
	$user_gid                     = $openstack::params::user_gid,
	$user_managehome              = $openstack::params::user_managehome,
	$user_home                    = $openstack::params::user_home,
	$user_password                = $openstack::params::user_password,


  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $resolv_device1               = $openstack::resolv_device1,
  $resolv_name1                 = $openstack::resolv_name1,
  $resolv_network               = $openstack::resolv_network,
  $resolv_ipaddr                = $openstack::resolv_ipaddr,
  $resolv_netmask               = $openstack::resolv_netmask,
  $resolv_gateway               = $openstack::resolv_gateway,
  $resolv_broadcast             = $openstack::resolv_broadcast,
 
  # /etc/sysconfig/network-scripts/ifcfg-eth1:
  $resolv_device2               = $openstack::resolv_device2,
  $resolv_name2                 = $openstack::resolv_name2,  
   
) inherits openstack::params  
{
  validate_bool                  ($package_manage)
  validate_array                 ($package_name)
  validate_string                ($package_ensure)

  validate_string                ($file_ensure)      
  validate_string                ($file_backup)  
  validate_string                ($file_group)   
  validate_string                ($file_mode) 
  validate_string                ($file_owner)   
  
  validate_string                ($service_name)
  validate_string                ($service_ensure)
  validate_bool                  ($service_enable)

  validate_string                ($user)
  validate_string                ($group)
  validate_string                ($user_ensure)
  validate_string                ($user_gid)
  validate_string                ($user_managehome)
  validate_string                ($user_home)
  validate_string                ($user_password)

  anchor { 'openstack::begin': } ->
    class { '::openstack::install': } ->
    class { '::openstack::config': } ~>
    class { '::openstack::service': } ->
    class { '::openstack::user': } ->
  anchor { 'openstack::end': }	  
}

