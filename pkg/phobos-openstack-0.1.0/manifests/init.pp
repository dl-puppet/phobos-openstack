class openstack 
(  
  ######### "PACKAGES" ########
  $package_manage               	= $openstack::params::package_manage,
  $package_name                 	= $openstack::params::package_name,
  $package_ensure               	= $openstack::params::package_ensure,    

  ###### "CONFIG_FILES" ###### 
  $file_ensure                  	= $openstack::params::file_ensure,      
  $file_backup                  	= $openstack::params::file_backup,           
  $file_group                   	= $openstack::params::file_group,        
  $file_mode                    	= $openstack::params::file_mode,        
  $file_owner                   	= $openstack::params::file_owner,       

  ######### "SERVICES" ########
  $service_name                 	= $openstack::params::service_name, 
  $service_ensure               	= $openstack::params::service_ensure,            
  $service_enable               	= $openstack::params::service_enable,
  $service_hasstatus            	= $openstack::params::service_hasstatus,
  $service_hasrestart           	= $openstack::params::service_hasrestart,   

  ####### "USER" #######  
  $user                         	= $openstack::params::user,
	$user_ensure                  	= $openstack::params::user_ensure,
	$user_uid                     	= $openstack::params::user_uid,
	$user_managehome              	= $openstack::params::user_managehome,
	$user_shell                   	= $openstack::params::user_shell,

  #####   "CHRONY"  ######
  $chromy_allow                 	= $openstack::params::chromy_allow,
  $chromy_servers               	= $openstack::params::chromy_servers,

  
  #####   "NETWORK"  ######
  # Config /etc/sysconfig/network :
  $network_networking           	= $openstack::params::network_networking,
  #$HOSTNAME                    	= $openstack::params::HOSTNAME,
  $network_nm                   	= $openstack::params::network_nm,
  $network_nozeroconf           	= $openstack::params::network_nozeroconf,
  $network_gateway              	= $openstack::params::network_gateway,

  # /etc/sysconfig/networks:
  $list_networks                	= $openstack::params::list_networks,                    
    
  # /etc/resolv.conf:
  $resolv_nameserver            	= $openstack::params::resolv_nameserver,
  
  # /etc/sysconfig/network-script/route-eth0:
  $route_eth0                   	= $openstack::params::route_eth0,

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $ifcfg_device                   	= $openstack::params::ifcfg_device,  
  $ifcfg_type                   	= $openstack::params::ifcfg_type,
  $ifcfg_name                   	= $openstack::params::ifcfg_name,
  $ifcfg_hotplug                	= $openstack::params::ifcfg_hotplug,
  $ifcfg_onboot                 	= $openstack::params::ifcfg_onboot,
  $ifcfg_controlled             	= $openstack::params::ifcfg_controlled,
  $ifcfg_ipv6init               	= $openstack::params::ifcfg_ipv6init,
  #$HWADDR                      	= "<%= scope.lookupvar('::macaddress_eth0') %>",
  $ifcfg_bootproto              	= $openstack::params::ifcfg_bootproto,
  $ifcfg_defroute               	= $openstack::params::ifcfg_defroute,
  $resolv_peerdns               	= $openstack::params::ifcfg_peerdns,
  $ifcfg_peerntp                	= $openstack::params::ifcfg_peerntp,
  $ifcfg_peerroutes             	= $openstack::params::ifcfg_peerroutes,
  $ifcfg_ip_failure             	= $openstack::params::ifcfg_ip_failure,
  $ifcfg_network                	= $openstack::params::ifcfg_network,
  $ifcfg_ipaddr                 	= $openstack::params::ifcfg_ipaddr,
  $ifcfg_netmask                	= $openstack::params::ifcfg_netmask,
  $ifcfg_gateway                	= $openstack::params::ifcfg_gateway,
  $ifcfg_broadcast              	= $openstack::params::ifcfg_broadcast,
  $ifcfg_nozeroconf             	= $openstack::params::ifcfg_nozeroconf,   
  $ifcfg_ethtool_opts           	= $openstack::params::ifcfg_ethtool_opts,
  
  # "/etc/host.conf":
  $host_conf                    	= $openstack::params::host_conf,
  # "/etc/hosts":
  $list_host                    	= $openstack::params::list_host,
   
  #####   "MONGODB"  ######  
  $mongo_smallfiles             	= $openstack::params::mongo_smallfiles,    

  #####   "MEMCAHED"  ###### 
  $memcached_interface          	= $openstack::params::memcached_interface,

  #####   "KEYSTONE"  ###### 
  $keystone_debug          		= $openstack::params::keystone_debug,
  $keystone_log_dir        		= $openstack::params::keystone_log_dir,
  $keystone_verbose        		= $openstack::params::keystone_verbose,
  $keystone_token          		= $openstack::params::keystone_token,
  $keystone_connection     		= $openstack::params::keystone_connection,
  $keystone_retry_interval 		= $openstack::params::keystone_retry_interval,
  $keystone_max_retry      		= $openstack::params::keystone_max_retry,
  $keystone_server_memcache		= $openstack::params::keystone_server_memcache,
  $keystone_token_provider 		= $openstack::params::keystone_token_provider,
  $keystone_token_driver   		= $openstack::params::keystone_token_driver,
  $keystone_revoke_driver  		= $openstack::params::keystone_revoke_driver,
  $keystone_token_auth     		= $openstack::params::keystone_token_auth,
  
  
  #####   "GLANCE"  ######
  ### configuration "/etc/glance/glance-api.conf":
  ###[DEFAULT]
  #notification_driver 			= noop
  #notification_driver 			= messaging
  ##verbose 				= True
  #debug 				= False
  #log_file 				= "/var/log/glance/api.log"
  #workers 				= 2
  #known_stores 			= glance.store.filesystem.Store
  #bind_host 				= 0.0.0.0
  #bind_port 				= 9292
  #registry_host 			= 127.0.0.1
  #registry_port 			= 9191
  #registry_client_protocol 		= http
  #delayed_delete 			= False
  #scrub_time 				= 43200
  #scrubber_datadir 			= "/var/lib/glance/scrubber"
  #image_cache_dir 			= "/var/lib/glance/image-cache/"
  ###[database]
  $glance_connection       		= $openstack::params::glance_connection,
  $glance_max_retries      		= $openstack::params::glance_max_retries,
  $glance_retry_interval   		= $openstack::params::glance_retry_interval,
  $glance_backend          		= $openstack::params::glance_backend,
  ###[keystone_authtoken]
  $glance_auth_uri         		= $openstack::params::glance_auth_uri, 
  $glance_auth_url         		= $openstack::params::glance_auth_url, 
  $glance_memcached_servers 		= $openstack::params::glance_memcached_servers,
  $glance_auth_type        		= $openstack::params::glance_auth_type,
  $glance_project_domain_name 		= $openstack::params::glance_project_domain_name,
  $glance_user_domain_name 		= $openstack::params::glance_user_domain_name,
  $glance_project_name     		= $openstack::params::glance_project_name,
  $glance_username         		= $openstack::params::glance_username,
  $glance_password         		= $openstack::params::glance_password,
  ###[paste_deploy]
  $glance_flavor           		= $openstack::params::glance_flavor,
  ###[glance_store]
  $glance_stores           		= $openstack::params::glance_stores,
  $glance_default_store    		= $openstack::params::glance_default_store,
  $glance_filesystem_store_datadir 	= $openstack::params::glance_filesystem_store_datadir,
  ###[oslo_messaging_rabbit]
  $glance_rabbit_host      		= $openstack::params::glance_rabbit_host,
  $glance_rabbit_port      		= $openstack::params::glance_rabbit_port,
  $glance_rabbit_userid    		= $openstack::params::glance_rabbit_userid,
  $glance_rabbit_password  		= $openstack::params::glance_rabbit_password,
  $glance_rabbit_retry_interval 	= $openstack::params::glance_rabbit_retry_interval, 
  $glance_rabbit_retry_backoff  	= $openstack::params::glance_rabbit_retry_backoff, 
  $glance_rabbit_max_retries    	= $openstack::params::glance_rabbit_max_retries,
  $glance_rabbit_durable_queues 	= $openstack::params::glance_rabbit_durable_queues,
  $glance_rabbit_ha_queues      	= $openstack::params::glance_rabbit_ha_queues,
  
  ###Configuration "/etc/glance/glance-registry.conf":
  ###[default]
  $glance_registry_debug          	= $openstack::params::glance_registry_debug,
  $glance_registry_verbose        	= $openstack::params::glance_registry_verbose,
  $glance_registry_log_file       	= $openstack::params::glance_registry_log_file,
  $glance_registry_bind_host      	= $openstack::params::glance_registry_bind_host,
  $glance_registry_bind_port      	= $openstack::params::glance_registry_bind_port,
  $glance_registry_workers        	= $openstack::params::glance_registry_workers,
  ###[DATABASE]
  $glance_registry_connection     	= $openstack::params::glance_registry_connection,
  $glance_registry_retry_interval 	= $openstack::params::glance_registry_retry_interval,
  $glance_registry_max_retries    	= $openstack::params::glance_registry_max_retries,
  $glance_registry_backend        	= $openstack::params::glance_registry_backend,
  ### [keystone_authtoken]
  $glance_registry_auth_uri       	= $openstack::params::glance_registry_auth_uri,
  $glance_registry_auth_url       	= $openstack::params::glance_registry_auth_url,
  $glance_registry_memcached_servers   	= $openstack::params::glance_registry_memcached_servers,
  $glance_registry_auth_type           	= $openstack::params::glance_registry_auth_type,
  $glance_registry_project_domain_name 	= $openstack::params::glance_registry_project_domain_name,
  $glance_registry_user_domain_name    	= $openstack::params::glance_registry_user_domain_name,
  $glance_registry_project_name   	= $openstack::params::glance_registry_project_name,
  $glance_registry_username       	= $openstack::params::glance_registry_password,
  $glance_registry_password       	= $openstack::params::glance_registry_password,
  ###[paste_deploy]
  $glance_registry_flavor         	= $openstack::params::glance_registry_flavor,
 
  
  #####  NOVA  ######
  ###[DEFAULT] 
  $nova_enabled_apis         		= $openstack::params::nova_enabled_apis,  
  $nova_rpc_backend         		= $openstack::params::nova_rpc_backend,
  $nova_auth_strategy         		= $openstack::params::nova_auth_strategy,
  $nova_my_ip         			= $openstack::params::nova_my_ip,
  $nova_use_neutron         		= $openstack::params::nova_use_neutron,
  $nova_firewall_driver         	= $openstack::params::nova_firewall_driver,
  $nova_rabbit_transport_url		= $openstack::params::nova_rabbit_transport_url, 
  ###[api_database]
  $nova_api_connection         		= $openstack::params::nova_api_connection,  
  $nova_api_retry_interval         	= $openstack::params::nova_api_retry_interval,
  $nova_api_max_retries         	= $openstack::params::nova_api_max_retries,
  ###[api_database]
  $nova_database_connection         	= $openstack::params::nova_database_connection,
  $nova_database_max_retries         	= $openstack::params::nova_database_max_retries,
  $nova_database_retry_interval         = $openstack::params::nova_database_retry_interval,
  $nova_database_backend         	= $openstack::params::nova_database_backend,
  ###[oslo_messaging_rabbit]
  $nova_rabbit_host         		= $openstack::params::nova_rabbit_host,
  $nova_rabbit_userid         		= $openstack::params::nova_rabbit_userid,
  $nova_rabbit_password         	= $openstack::params::nova_rabbit_password,
  ###[keystone_authtoken]
  $nova_keystone_auth_uri         	= $openstack::params::nova_keystone_auth_uri,
  $nova_keystone_auth_url         	= $openstack::params::nova_keystone_auth_url ,
  $nova_keystone_memcached_servers      = $openstack::params::nova_keystone_memcached_servers,
  $nova_keystone_auth_type         	= $openstack::params::nova_keystone_auth_type,
  $nova_keystone_project_domain_name    = $openstack::params::nova_keystone_project_domain_name,
  $nova_keystone_user_domain_name       = $openstack::params::nova_keystone_user_domain_name,
  $nova_keystone_project_name         	= $openstack::params::nova_keystone_project_name,
  $nova_keystone_username         	= $openstack::params::nova_keystone_username,
  $nova_keystone_password         	= $openstack::params::nova_keystone_password,
  ###[vnc]
  $nova_vncserver_listen         	= $openstack::params::nova_vncserver_listen,
  $nova_vncserver_proxyclient_address   = $openstack::params::nova_vncserver_proxyclient_address,
  ###[spice]
  ###[glance]
  $nova_glance_api_servers         	= $openstack::params::nova_glance_api_servers,
  ###[oslo_concurrency]
  $nova_oslo_concurrency_lock         	= $openstack::params::nova_oslo_concurrency_lock,
  
  
    
) inherits openstack::params  
{
  ###### "PACKAGE" ######
  validate_bool                  	($package_manage)
  validate_array                 	($package_name)
  validate_string                	($package_ensure)

  ###### "CONFIG" ######
  validate_string                	($file_ensure)      
  validate_string                	($file_backup)  
  #validate_string               	($file_group)   
  #validate_string               	($file_mode) 
  #validate_string               	($file_owner)   
  
  ###### "SERVICE" ######
  validate_array                 	($service_name)
  validate_string                	($service_ensure)
  validate_bool                  	($service_enable)

  ###### "USER" ######
  validate_string                	($user)
  validate_string                	($user_ensure)
  validate_string                	($user_uid)
  validate_bool                  	($user_managehome)
  validate_string                	($user_shell)

  ###### "CHROMY" ######
  validate_string                	($chromy_allow)
  validate_array                 	($chromy_servers) 
  
  ##### "NETWORK" ######
  # Config /etc/sysconfig/network :
  validate_string                	($network_networking)
  validate_string                	($network_nm)
  validate_string                	($network_nozeroconf)
  validate_string                	($network_gateway)

  # /etc/networks:
  # Config /etc/sysconfig/network :
  validate_array                 	($list_networks)                    
    
  # /etc/resolv.conf:
  # Config /etc/sysconfig/network :
  validate_string                	($resolv_nameserver)
  
  # /etc/sysconfig/network-script/route-eth0:
   # Config /etc/sysconfig/network :
  validate_array                 	($route_eth0)

  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  validate_string                	($ifcfg_device)
  validate_string                	($ifcfg_type)
  validate_string                	($ifcfg_name)
  validate_string                	($ifcfg_hotplug)
  validate_string                	($ifcfg_onboot)
  validate_string                	($ifcfg_controlled)
  validate_string                	($ifcfg_ipv6init)
  validate_string                	($ifcfg_bootproto)
  validate_string                	($ifcfg_peerdns)
  validate_string                	($ifcfg_peerntp)
  validate_string                	($ifcfg_peerroutes)
  validate_string                	($ifcfg_ip_failure)
  validate_string                	($ifcfg_network)
  validate_string                	($ifcfg_ipaddr)
  validate_string                	($ifcfg_netmask)
  validate_string                	($ifcfg_gateway)
  validate_string                	($ifcfg_broadcast)
  validate_string                	($ifcfg_nozeroconf)    
  validate_string                	($ifcfg_ethtool_opts)

  # /etc/host.conf:
  validate_string                	($host_conf)

  # /etc/hosts:
  validate_array                 	($list_host)

  ##### "MONGODB"  ######  
  validate_bool                  	($mongo_smallfiles)
  
  ##### "MEMCAHED" ###### 
  validate_string                	($memcached_interface)
  
  ##### "KEYSTONE" ###### 
  validate_bool                  	($keystone_debug) 
  validate_string                	($keystone_log_dir) 
  validate_string                	($keystone_verbose) 
  validate_string                	($keystone_token) 
  validate_string                	($keystone_connection) 
  validate_string                	($keystone_retry_interval)  
  validate_string                	($keystone_max_retry)
  validate_string                	($keystone_server_memcache)
  validate_string                	($keystone_token_provider)  
  validate_string                	($keystone_token_driver)
  validate_string                	($keystone_revoke_driver)
  validate_string                	($keystone_token_auth)

  ##### "GLANCE" ######
  validate_string                	($glance_connection)
  validate_string                	($glance_max_retries)
  validate_string                	($glance_retry_interval)
  validate_string                	($glance_backend)
  validate_string                	($glance_auth_uri)
  validate_string                	($glance_auth_url)
  validate_string                	($glance_memcached_servers)
  validate_string                	($glance_auth_type)
  validate_string                	($glance_project_domain_name)
  validate_string                	($glance_user_domain_name)
  validate_string                	($glance_project_name)
  validate_string                	($glance_username)
  validate_string                	($glance_password)
  validate_string                	($glance_flavor)
  validate_string                	($glance_stores)
  validate_string                	($glance_default_store)
  validate_string                	($glance_filesystem_store_datadir)
  validate_string                	($glance_rabbit_host)
  validate_string                	($glance_rabbit_port)
  validate_string                	($glance_rabbit_userid)
  validate_string                	($glance_rabbit_password)
  validate_string                	($glance_rabbit_retry_interval)
  validate_string                	($glance_rabbit_retry_backoff)
  validate_string                	($glance_rabbit_max_retries)
  validate_bool                  	($glance_rabbit_durable_queues)
  validate_bool                  	($glance_rabbit_ha_queues) 
  ###Configuration /etc/glance/glance-registry.conf:
  ###[default]
  validate_bool                  	($glance_registry_debug)
  validate_string                	($glance_registry_verbose)
  validate_string                	($glance_registry_log_file)
  validate_string                	($glance_registry_bind_host)
  validate_string                	($glance_registry_bind_port)
  validate_string                	($glance_registry_workers)
  ###[DATABASE]
  validate_string                	($glance_registry_connection)
  validate_string                	($glance_registry_retry_interval)
  validate_string                	($glance_registry_max_retries)
  validate_string                	($glance_registry_backend)
  ### [keystone_authtoken]
  validate_string                	($glance_registry_auth_uri)
  validate_string                	($glance_registry_auth_url)
  validate_string                	($glance_registry_memcached_servers)
  validate_string                	($glance_registry_auth_type)
  validate_string                	($glance_registry_project_domain_name)
  validate_string                	($glance_registry_user_domain_name)
  validate_string                	($glance_registry_project_name)
  validate_string                	($glance_registry_username)
  validate_string                	($glance_registry_password)
  ###[paste_deploy]
  validate_string                	($glance_registry_flavor)  
    
    
  ##### "NOVA" ######
  ###[DEFAULT] 
  validate_string                	($nova_enabled_apis)  
  validate_string                	($nova_rpc_backend)
  validate_string                	($nova_auth_strategy)
  validate_string                	($nova_my_ip)
  validate_bool	                	($nova_use_neutron)
  validate_string                	($nova_firewall_driver)
  validate_string                       ($nova_rabbit_transport_url)
  ###[api_database]
  validate_string                	($nova_api_connection)  
  validate_string                	($nova_api_retry_interval)
  validate_string                	($nova_api_max_retries)
  ###[api_database]
  validate_string                	($nova_database_connection)
  validate_string                	($nova_database_max_retries)
  validate_string                	($nova_database_retry_interval)
  validate_string                	($nova_database_backend)
  ###[oslo_messaging_rabbit]
  validate_string                	($nova_rabbit_host)
  validate_string                	($nova_rabbit_userid)
  validate_string                	($nova_rabbit_password)
  #backend                           	= sqlalchemy ???
  ###[keystone_authtoken]
  validate_string                	($nova_keystone_auth_uri)
  validate_string                	($nova_keystone_auth_url)
  validate_string                	($nova_keystone_memcached_servers)
  validate_string                	($nova_keystone_auth_type)
  validate_string                	($nova_keystone_project_domain_name)
  validate_string                	($nova_keystone_user_domain_name)
  validate_string                	($nova_keystone_project_name)
  validate_string                	($nova_keystone_username)
  validate_string                	($nova_keystone_password)
  ###[vnc]
  validate_string                	($nova_vncserver_listen)
  validate_string                	($nova_vncserver_proxyclient_address)
  ###[spice]
  ###[glance]
  validate_string                	($nova_glance_api_servers)
  ###[oslo_concurrency]
  validate_string                	($nova_oslo_concurrency_lock_path)  
    
  anchor { 'openstack::begin': } ->
    class { '::openstack::install': } ->
    class { '::openstack::config': } ~>
    class { '::openstack::service': } ->
    class { '::openstack::user': } ->
  anchor { 'openstack::end': }	  
}

