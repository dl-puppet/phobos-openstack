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

  #####   NETWORK  ######
  # Config /etc/sysconfig/network :
  $network_networking           = $system::params::network_networking,
  #$HOSTNAME                    = $system::params::HOSTNAME,
  $network_nm                   = $system::params::network_nm,
  $network_nozeroconf           = $system::params::network_nozeroconf,
  $network_gateway              = $system::params::network_gateway,
  #GATEWAY                      = $system::params::GATEWAY,
  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $resolv_device                = $system::params::resolv_device,
  $resolv_type                  = $system::params::resolv_type,
  $resolv_hotplug               = $system::params::resolv_hotplug,
  $resolv_onboot                = $system::params::resolv_onboot,
  $resolv_controlled            = $system::params::resolv_controlled,
  #$HWADDR                      = <%= scope.lookupvar('::macaddress_eth0') %>,
  $resolv_bootproto             = $system::params::resolv_bootproto,
  $resolv_peerdns               = $system::params::resolv_peerdns,
  $resolv_ipv6init              = $system::params::resolv_ipv6init,
  # /etc/host.conf:
  $host_conf                    = $system::params::host_conf,
  # /etc/hosts:
  $list_host                    = $system::params::list_host,

  #####   MESSAGE ######
  #/etc/motd: 
  $dynamic                      = $system::params::dynamic,
  $file_dynamic                 = $system::params::file_dynamic,
  $file_no_dynamic              = $system::params::file_no_dynamic,
  #/etc/issue.net: 
  $issue                        = $system::params::issue,
  $file_issue                   = $system::params::file_issue,
  #files:    
  $file_ensure_message          = $system::params::file_ensure,
  $file_group_message           = $system::params::file_group,        
  $file_mode_message            = $system::params::file_mode,        
  $file_owner_message           = $system::params::file_owner,        
  $file_backup_message          = $system::params::file_backup, 

   
) inherits openstack::params  
{
  validate_bool                  ($package_manage)
  validate_array                 ($package_name)
  validate_string                ($package_ensure)

  validate_string                ($file_ensure)      
  validate_string                ($file_backup)  
  #validate_string                ($file_group)   
  #validate_string                ($file_mode) 
  #validate_string                ($file_owner)   
  
  validate_string                ($service_name)
  validate_string                ($service_ensure)
  validate_bool                  ($service_enable)

  validate_string                ($user)
  validate_string                ($user_ensure)
  validate_string                ($user_uid)
  validate_bool                  ($user_managehome)
  validate_string                ($user_shell)

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

