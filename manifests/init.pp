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
  $service_hasstatus            = $openstack::params::service_hasstatus,
  $service_hasrestart           = $openstack::params::service_hasrestart,   

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

  # /etc/sysconfig/networks:
  $list_networks                = $openstack::params::list_networks,                    
    
  # /etc/resolv.conf:
  $resolv_nameserver            = $openstack::params::resolv_nameserver,
  
  # /etc/sysconfig/network-script/route-eth0:
  $route_eth0                   = $openstack::params::route_eth0,

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $ifcfg_device                   = $openstack::params::ifcfg_device,  
  $ifcfg_type                   = $openstack::params::ifcfg_type,
  $ifcfg_name                   = $openstack::params::ifcfg_name,
  $ifcfg_hotplug                = $openstack::params::ifcfg_hotplug,
  $ifcfg_onboot                 = $openstack::params::ifcfg_onboot,
  $ifcfg_controlled             = $openstack::params::ifcfg_controlled,
  $ifcfg_ipv6init               = $openstack::params::ifcfg_ipv6init,
  #$HWADDR                      = <%= scope.lookupvar('::macaddress_eth0') %>,
  $ifcfg_bootproto              = $openstack::params::ifcfg_bootproto,
  $ifcfg_defroute               = $openstack::params::ifcfg_defroute,
  $resolv_peerdns               = $openstack::params::ifcfg_peerdns,
  $ifcfg_peerntp                = $openstack::params::ifcfg_peerntp,
  $ifcfg_peerroutes             = $openstack::params::ifcfg_peerroutes,
  $ifcfg_ip_failure             = $openstack::params::ifcfg_ip_failure,
  $ifcfg_network                = $openstack::params::ifcfg_network,
  $ifcfg_ipaddr                 = $openstack::params::ifcfg_ipaddr,
  $ifcfg_netmask                = $openstack::params::ifcfg_netmask,
  $ifcfg_gateway                = $openstack::params::ifcfg_gateway,
  $ifcfg_broadcast              = $openstack::params::ifcfg_broadcast,
  $ifcfg_nozeroconf             = $openstack::params::ifcfg_nozeroconf,   
  $ifcfg_ethtool_opts           = $openstack::params::ifcfg_ethtool_opts,
  
  # /etc/host.conf:
  $host_conf                    = $openstack::params::host_conf,
  # /etc/hosts:
  $list_host                    = $openstack::params::list_host,
   
     
  ##### subscription_manager #####
  $yum_ca_package_prefix        = $::subscription_manager::defaults::yum_ca_package_prefix,
   $yum_server_hostname          = $::subscription_manager::defaults::yum_server_hostname,
   $yum_username                 = $::subscription_manager::defaults::yum_username,
   $yum_password                 = $::subscription_manager::defaults::yum_password,
   $yum_activationkey            = $::subscription_manager::defaults::yum_activationkey,
   $yum_pool                     = $::subscription_manager::defaults::yum_pool,
   $yum_environment              = $::subscription_manager::defaults::yum_environment,
   $yum_autosubscribe            = $::subscription_manager::defaults::yum_autosubscribe,
   $yum_servicelevel             = $::subscription_manager::defaults::yum_servicelevel,
   $yum_force                    = $::subscription_manager::defaults::yum_force,
   $yum_org                      = $::subscription_manager::defaults::yum_org,
  $yum_repo                     = $::subscription_manager::defaults::yum_repo,
  $yum_config_hash              = $::subscription_manager::defaults::yum_config_hash,
   
) inherits openstack::params  
{
  ###### PACKAGE ######
  validate_bool                  ($package_manage)
  validate_array                 ($package_name)
  validate_string                ($package_ensure)

  ###### CONFIG ######
  validate_string                ($file_ensure)      
  validate_string                ($file_backup)  
  #validate_string               ($file_group)   
  #validate_string               ($file_mode) 
  #validate_string               ($file_owner)   
  
  ###### SERVICE ######
  validate_array                 ($service_name)
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

  # /etc/networks:
  # Config /etc/sysconfig/network :
  validate_array                 ($list_networks)                    
    
  # /etc/resolv.conf:
  # Config /etc/sysconfig/network :
  validate_string                ($resolv_nameserver)
  
  # /etc/sysconfig/network-script/route-eth0:
   # Config /etc/sysconfig/network :
  validate_array                 ($route_eth0)

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  validate_string                ($ifcfg_device)
  validate_string                ($ifcfg_type)
  validate_string                ($ifcfg_name)
  validate_string                ($ifcfg_hotplug)
  validate_string                ($ifcfg_onboot)
  validate_string                ($ifcfg_controlled)
  validate_string                ($ifcfg_ipv6init)
  validate_string                ($ifcfg_bootproto)
  validate_string                ($ifcfg_peerdns)
  validate_string                ($ifcfg_peerntp)
  validate_string                ($ifcfg_peerroutes)
  validate_string                ($ifcfg_ip_failure)
  validate_string                ($ifcfg_network)
  validate_string                ($ifcfg_ipaddr)
  validate_string                ($ifcfg_netmask)
  validate_string                ($ifcfg_gateway)
  validate_string                ($ifcfg_broadcast)
  validate_string                ($ifcfg_nozeroconf)    
  validate_string                ($ifcfg_ethtool_opts)

  # /etc/host.conf:
  validate_string                ($host_conf)

  # /etc/hosts:
  validate_array                 ($list_host)

  
  
  anchor { 'openstack::begin': } ->
    class { '::openstack::install': } ->
    class { '::openstack::config': } ~>
    class { '::openstack::service': } ->
    class { '::openstack::user': } ->
  anchor { 'openstack::end': }	  
}

