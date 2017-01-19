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
	$user_ensure                  = $openstack::params::user_ensure,
	$user_uid                     = $openstack::params::user_uid,
	$user_managehome              = $openstack::params::user_managehome,
	$user_shell                   = $openstack::params::user_shell,

  #####   CHRONY  ######
  $chromy_allow                 = $openstack::params::chromy_allow,
  $chromy_servers               = $openstack::params::chromy_servers,

  #####   NETWORK  ######
  # Config /etc/sysconfig/network :
  $network_networking           = $openstack::params::network_networking,
  #$HOSTNAME                    = $openstack::params::HOSTNAME,
  $network_nm                   = $openstack::params::network_nm,
  $network_nozeroconf           = $openstack::params::network_nozeroconf,
  $network_gateway              = $openstack::params::network_gateway,
  #GATEWAY                      = $openstack::params::GATEWAY,
  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $resolv_device                = $openstack::params::resolv_device,
  $resolv_type                  = $openstack::params::resolv_type,
  $resolv_hotplug               = $openstack::params::resolv_hotplug,
  $resolv_onboot                = $openstack::params::resolv_onboot,
  $resolv_controlled            = $openstack::params::resolv_controlled,
  #$HWADDR                      = <%= scope.lookupvar('::macaddress_eth0') %>,
  $resolv_bootproto             = $openstack::params::resolv_bootproto,
  $resolv_peerdns               = $openstack::params::resolv_peerdns,
  $resolv_ipv6init              = $openstack::params::resolv_ipv6init,
  # /etc/host.conf:
  $host_conf                    = $openstack::params::host_conf,
  # /etc/hosts:
  $list_host                    = $openstack::params::list_host,

  #####   MESSAGE ######
  #/etc/motd: 
  $dynamic                      = $openstack::params::dynamic,
  $file_dynamic                 = $openstack::params::file_dynamic,
  $file_no_dynamic              = $openstack::params::file_no_dynamic,
  #/etc/issue.net: 
  $issue                        = $openstack::params::issue,
  $file_issue                   = $openstack::params::file_issue,
   
) inherits openstack::params  
{
  ###### PACKAGE ######
  validate_bool                  ($package_manage)
  validate_array                 ($package_name)
  validate_string                ($package_ensure)

  ###### CONFIG ######
  validate_string                ($file_ensure)      
  validate_string                ($file_backup)  
  #validate_string                ($file_group)   
  #validate_string                ($file_mode) 
  #validate_string                ($file_owner)   
  
  ###### SERVICE ######
  validate_string                ($service_name)
  validate_string                ($service_ensure)
  validate_bool                  ($service_enable)

   ###### USER ######
  validate_string                ($user)
  validate_string                ($user_ensure)
  validate_string                ($user_uid)
  validate_bool                  ($user_managehome)
  validate_string                ($user_shell)

  ###### CHROMY ######
  validate_string                ($chromy_allow)
  validate_array                 ($chromy_servers) 
  
  #####   NETWORK  ######
  # Config /etc/sysconfig/network :
  validate_string                ($network_networking)
  validate_string                ($network_nm)
  validate_string                ($network_nozeroconf)
  validate_string                ($network_gateway)
  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  validate_string                ($resolv_device)
  validate_string                ($resolv_type)
  validate_string                ($resolv_hotplug)
  validate_string                ($resolv_onboot)
  validate_string                ($resolv_controlled)
  validate_string                ($resolv_bootproto)
  validate_string                ($resolv_peerdns)
  validate_string                ($resolv_ipv6init)
  # /etc/host.conf:
  validate_string                ($host_conf)
  # /etc/hosts:
  validate_array                 ($list_host)
  
  ###### MESSAGE ######
  validate_bool           ($dynamic)
  validate_string         ($file_dynamic)
  validate_string         ($file_no_dynamic)
  validate_bool           ($issue)
  validate_string         ($file_issue)
  
  anchor { 'openstack::begin': } ->
    class { '::openstack::install': } ->
    class { '::openstack::config': } ~>
    class { '::openstack::service': } ->
    class { '::openstack::user': } ->
  anchor { 'openstack::end': }	  
}

