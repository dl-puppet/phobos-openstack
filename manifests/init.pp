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

  #####  MARIADB ###### 
  $maria_bind_address             = $openstack::params::maria_bind_address,   

  #####   "MEMCAHED"  ###### 
  $memcached_interface          	= $openstack::params::memcached_interface,

  #####   "KEYSTONE"  ###### 
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
  #notification_driver 			  = noop
  #notification_driver 			  = messaging
  ##verbose 				          = True
  #debug 				              = False
  #log_file 				          = "/var/log/glance/api.log"
  #workers 				            = 2
  #known_stores 			        = glance.store.filesystem.Store
  #bind_host 				          = 0.0.0.0
  #bind_port 				          = 9292
  #registry_host 			        = 127.0.0.1
  #registry_port 			        = 9191
  #registry_client_protocol 	= http
  #delayed_delete 			      = False
  #scrub_time 				        = 43200
  #scrubber_datadir 			    = "/var/lib/glance/scrubber"
  #image_cache_dir 			      = "/var/lib/glance/image-cache/"
  #$glance_api_workers         = $openstack::params::glance_api_workers,
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
  $nova_my_ip                       = $openstack::params::nova_my_ip,
  $nova_enabled_apis         		    = $openstack::params::nova_enabled_apis,  
  #$nova_osapi_compute_workers       = $openstack::params::nova_osapi_compute_workers,
  #$nova_metadata_workers            = $openstack::params::nova_metadata_workers,
  $nova_rpc_backend         		    = $openstack::params::nova_rpc_backend,
  $nova_auth_strategy         		  = $openstack::params::nova_auth_strategy,
  $nova_use_neutron         		    = $openstack::params::nova_use_neutron,
  $nova_rabbit_transport_url        = $openstack::params::nova_rabbit_transport_url,
  #$nova_compute_driver              = $openstack::params::nova_compute_driver,
  #$nova_public_interface            = $openstack::params::nova_public_interface,
  $nova_linuxnet_interface_driver   = $openstack::params::nova_linuxnet_interface_driver,
  $nova_firewall_driver         	  = $openstack::params::nova_firewall_driver, 
  ###[LIBVIRT]
  $libvirt_virt_type                = $openstack::params::libvirt_virt_type, 
  ###[api_database]
  $nova_api_connection         		  = $openstack::params::nova_api_connection,  
  $nova_api_retry_interval         	= $openstack::params::nova_api_retry_interval,
  $nova_api_max_retries         	  = $openstack::params::nova_api_max_retries,
  ###[database]
  $nova_database_connection         = $openstack::params::nova_database_connection,
  $nova_database_max_retries        = $openstack::params::nova_database_max_retries,
  $nova_database_retry_interval     = $openstack::params::nova_database_retry_interval,
  $nova_database_backend         	  = $openstack::params::nova_database_backend,
  ###cinder
  #$cinder_catalog_info              = $openstack::params::cinder_catalog_info,
  #$cinder_endpoint_template         = $openstack::params::cinder_endpoint_template,
  #$cinder_os_region_name            = $openstack::params::cinder_os_region_name,
  #$cinder_http_retries              = $openstack::params::cinder_http_retries,
  #$cinder_cross_az_attach           = $openstack::params::cinder_cross_az_attach,
  ###[keystone_authtoken]
  $nova_keystone_auth_uri         	= $openstack::params::nova_keystone_auth_uri,
  $nova_keystone_auth_url         	= $openstack::params::nova_keystone_auth_url ,
  $nova_keystone_memcached_servers  = $openstack::params::nova_keystone_memcached_servers,
  $nova_keystone_auth_type         	= $openstack::params::nova_keystone_auth_type,
  $nova_keystone_project_domain_name= $openstack::params::nova_keystone_project_domain_name,
  $nova_keystone_user_domain_name   = $openstack::params::nova_keystone_user_domain_name,
  $nova_keystone_project_name       = $openstack::params::nova_keystone_project_name,
  $nova_keystone_username         	= $openstack::params::nova_keystone_username,
  $nova_keystone_password         	= $openstack::params::nova_keystone_password,
  ###[neutron]
  $nova_neutron_url                 = $openstack::params::nova_neutron_url,
  $nova_neutron_auth_url            = $openstack::params::nova_neutron_auth_url,
  $nova_neutron_auth_type           = $openstack::params::nova_neutron_auth_type,
  $nova_neutron_project_domain_name = $openstack::params::nova_neutron_project_domain_name,
  $nova_neutron_user_domain_name    = $openstack::params::nova_neutron_user_domain_name,
  $nova_neutron_region_name         = $openstack::params::nova_neutron_region_name,
  $nova_neutron_project_name        = $openstack::params::nova_neutron_project_name,
  $nova_neutron_username            = $openstack::params::nova_neutron_username,     
  $nova_neutron_password            = $openstack::params::nova_neutron_password,
  $nova_neutron_service_metadata_proxy= $openstack::params::nova_neutron_service_metadata_proxy,  
  $nova_neutron_metadata_proxy_shared_secret= $openstack::params::nova_neutron_metadata_proxy_shared_secret,
  ###[vnc]
  $vnc_vncserver_listen             = $openstack::params::vnc_vncserver_listen,
  $vnc_vncserver_proxyclient_address= $openstack::params::vnc_vncserver_proxyclient_address,
  $vnc_enabled                      = $openstack::params::vnc_enabled,
  $vnc_keymap                       = $openstack::params::vnc_keymap,
  #$vnc_novncproxy_host              = $openstack::params::vnc_novncproxy_host,
  #$vnc_novncproxy_port              = $openstack::params::vnc_novncproxy_port,
  #$vnc_novncproxy_base_url          = $openstack::params::vnc_novncproxy_base_url,
  ###VNC pour XEN
  #$vnc_xvpvncproxy_host             = $openstack::params::vnc_xvpvncproxy_host,
  #$vnc_xvpvncproxy_port             = $openstack::params::vnc_xvpvncproxy_port, 
  #$vnc_xvpvncproxy_base_url         = $openstack::params::vnc_xvpvncproxy_base_url,
  ###[wsgi]
  #$nova_api_paste_config            = $openstack::params::nova_api_paste_config, 
  ###[spice]
  #$spice_html5proxy_base_url        = $openstack::params::spice_html5proxy_base_url,
  #$spice_server_listen              = $openstack::params::spice_server_listen,
  #$spice_server_proxyclient_address = $openstack::params::spice_server_proxyclient_address,
  #$spice_enabled                    = $openstack::params::spice_enabled,
  #$spice_agent_enabled              = $openstack::params::spice_agent_enabled,
  #$spice_keymap                     = $openstack::params::spice_keymap,
  #$spice_html5proxy_host            = $openstack::params::spice_html5proxy_host,
  #$spice_html5proxy_port            = $openstack::params::spice_html5proxy_port,
  ###[rdp]
  #$rdp_enabled                      = $openstack::params::rdp_enabled,
  #$rdp_html5_proxy_base_url         = $openstack::params::dp_html5_proxy_base_url,
  ###[glance]
  $nova_glance_api_servers         	= $openstack::params::nova_glance_api_servers,
  ###[oslo_concurrency]
  $nova_oslo_concurrency_lock_path  = $openstack::params::nova_oslo_concurrency_lock_path ,
  ###[conductor]                      
  #$nova_conductor_workers           = $openstack::params::nova_conductor_workers,

  #####  NEUTRON  ######  
  ###/etc/neutron/neutron.conf
  ###DEFAULT
  $neutron_core_plugin               = $openstack::params::neutron_core_plugin,
  $neutron_service_plugins           = $openstack::params::neutron_service_plugins,
  $neutron_allow_overlapping_ips     = $openstack::params::neutron_allow_overlapping_ips,
  $neutron_rabbit_transport_url      = $openstack::params::neutron_rabbit_transport_url,
  $neutron_auth_strategy             = $openstack::params::neutron_auth_strategy,
  $neutron_notify_nova_on_port_status_changes= $openstack::params::neutron_notify_nova_on_port_status_changes,
  $neutron_notify_nova_on_port_data_changes  = $openstack::params::neutron_notify_nova_on_port_data_changes,
  #$neutron_dhcp_agents_per_network   = $openstack::params::neutron_dhcp_agents_per_network,
  #$neutron_rpc_backend               = $openstack::params::neutron_rpc_backend,
  #$neutron_api_workers               = $openstack::params::neutron_api_workers,
  #$neutron_rpc_workers               = $openstack::params::neutron_rpc_workers,
  ###[database]
  $neutron_db_connection             = $openstack::params::neutron_db_connection,
  $neutron_retry_interval            = $openstack::params::neutron_retry_interval,
  $neutron_max_retries               = $openstack::params::neutron_max_retries,
  ###[keystone_authtoken]
  $neutron_keystone_auth_uri         = $openstack::params::neutron_keystone_auth_uri,
  $neutron_keystone_auth_url         = $openstack::params::neutron_keystone_auth_url,
  $neutron_keystone_memcached_servers= $openstack::params::neutron_keystone_memcached_servers,
  $neutron_keystone_auth_type        = $openstack::params::neutron_keystone_auth_type,
  $neutron_keystone_project_domain_name= $openstack::params::neutron_keystone_project_domain_name,
  $neutron_keystone_user_domain_name = $openstack::params::neutron_keystone_user_domain_name,
  $neutron_keystone_project_name     = $openstack::params::neutron_keystone_project_name,
  $neutron_keystone_username         = $openstack::params::neutron_keystone_username,
  $neutron_keystone_password         = $openstack::params::neutron_keystone_password,
  ###[nova]
  $neutron_nova_auth_url             = $openstack::params::neutron_nova_auth_type,
  $neutron_nova_auth_type            = $openstack::params::neutron_nova_auth_type,
  $neutron_nova_project_domain_name  = $openstack::params::neutron_nova_project_domain_name,
  $neutron_nova_user_domain_name     = $openstack::params::neutron_nova_user_domain_name,
  $neutron_nova_region_name          = $openstack::params::neutron_nova_region_name,
  $neutron_nova_project_name         = $openstack::params::neutron_nova_project_name,
  $neutron_nova_username             = $openstack::params::neutron_nova_username,
  $neutron_nova_password             = $openstack::params::neutron_nova_password,
  
  
  ###/etc/neutron/plugins/ml2/ml2_conf.ini :
  ### [Ml2]
  $neutron_ml2_type_drivers          = $openstack::params::neutron_ml2_type_drivers ,
  $neutron_ml2_tenant_network_types  = $openstack::params::neutron_ml2_tenant_network_types,
  $neutron_ml2_mechanism_drivers     = $openstack::params::neutron_ml2_mechanism_drivers,
  $neutron_ml2_extension_drivers     = $openstack::params::neutron_ml2_extension_drivers,
  ### [Ml2_type_flat]
  $neutron_flat_flat_networks        = $openstack::params::neutron_flat_flat_networks,
  ### [Ml2_type_vlan]
  $neutron_network_vlan_ranges     = $openstack::params::neutron_network_vlan_ranges,
  ###[Ml2_type_vxlan]
  $neutron_flat_vxlan_vni_ranges     = $openstack::params::neutron_flat_vxlan_vni_ranges,
  ###[securitygroup]
  $neutron_securitygroup_enable_ipset= $openstack::params::neutron_securitygroup_enable_ipset,

  ### /etc/neutron/plugins/ml2/linuxbridge_agent.ini:
  ###[linux_bridge]
  $neutron_agent_physical_interface_mappings=$openstack::params::neutron_agent_physical_interface_mappings,
  ###[vxlan]
  $neutron_agent_enable_vxlan        = $openstack::params::neutron_agent_enable_vxlan,
  $neutron_agent_vxlan_local_ip      = $openstack::params::neutron_agent_vxlan_local_ip,
  $neutron_agent_vxlan_l2_population = $openstack::params::neutron_agent_vxlan_l2_population,
  ###[securitygroup]
  $neutron_agent_enable_security_group= $openstack::params::neutron_agent_enable_security_group,
  $neutron_agent_firewall_driver     = $openstack::params::neutron_agent_firewall_driver,
  
  ### /etc/neutron/l3_agent.ini:
  ###[DEFAULT]
  $neutron_l3agent_interface_driver  = $openstack::params::neutron_l3agent_interface_driver,
  
  ### /etc/neutron/dhcp_agent.ini:
  ###[DEFAULT]
  $neutron_dhcp_interface_driver     = $openstack::params::neutron_dhcp_interface_driver,
  $neutron_dhcp_driver               = $openstack::params::neutron_dhcp_driver,
  $neutron_dhcp_enable_isolated_metadata= $openstack::params::neutron_dhcp_enable_isolated_metadata,
  
  ###/etc/neutron/metadata_agent.ini
  ###[DEFAULT]
  $metadata_nova_metadata_ip         = $openstack::params::metadata_nova_metadata_ip,
  $metadata_proxy_shared_secret      = $openstack::params::metadata_proxy_shared_secret,
  
  #####  DASHBOARD  ######
  ###/etc/openstack-dashboard/local_settings: 
  $dashboard_OPENSTACK_HOST          = $openstack::params::dashboard_OPENSTACK_HOST,
  $dashboard_ALLOWED_HOSTS           = $openstack::params::dashboard_ALLOWED_HOSTS, 
  $dashboard_SESSION_ENGINE          = $openstack::params::dashboard_SESSION_ENGINE,
  $dashboard_BACKEND                 = $openstack::params::dashboard_BACKEND,
  $dashboard_LOCATION                = $openstack::params::dashboard_LOCATION,
  $dashboard_OPENSTACK_KEYSTONE_URL  = $openstack::params::dashboard_OPENSTACK_KEYSTONE_URL,
  $dashboard_OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT= $openstack::params::dashboard_OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT,
  $dashboard_OPENSTACK_KEYSTONE_DEFAULT_DOMAIN= $openstack::params::dashboard_OPENSTACK_KEYSTONE_DEFAULT_DOMAIN,
  $dashboard_OPENSTACK_KEYSTONE_DEFAULT_ROLE= $openstack::params::dashboard_OPENSTACK_KEYSTONE_DEFAULT_ROLE,
  $dashboard_enable_router           = $openstack::params::dashboard_enable_router,
  $dashboard_enable_quotas           = $openstack::params::dashboard_enable_quotas, 
  $dashboard_enable_ipv6             = $openstack::params::dashboard_enable_ipv6, 
  $dashboard_enable_distributed_router= $openstack::params::dashboard_enable_distributed_router,
  $dashboard_enable_ha_router        = $openstack::params::dashboard_enable_ha_router,
  $dashboard_enable_lb               = $openstack::params::dashboard_enable_lb,
  $dashboard_enable_firewall         = $openstack::params::dashboard_enable_firewall,
  $dashboard_enable_vpn              = $openstack::params::dashboard_enable_vpn,
  $dashboard_enable_fip_topology_check= $openstack::params::dashboard_enable_fip_topology_check,
  $dashboard_TIME_ZONE               = $openstack::params::dashboard_TIME_ZONE,
   
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

  #####  MARIADB ###### 
  validate_string                 ($maria_bind_address)    
  
  ##### "MEMCAHED" ###### 
  validate_string                	($memcached_interface)
  
  ##### "KEYSTONE" ###### 
  validate_string                 ($keystone_token_auth)
  validate_string                	($keystone_token) 
  validate_string                	($keystone_connection) 
  validate_string                	($keystone_retry_interval)  
  validate_string                	($keystone_max_retry)
  validate_string                	($keystone_server_memcache)
  validate_string                	($keystone_token_provider)  
  validate_string                	($keystone_token_driver)
  validate_string                	($keystone_revoke_driver)


  ##### "GLANCE" ######
  validate_string                 ($glance_api_workers)
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
  validate_string                 ($nova_my_ip)
  validate_string                	($nova_enabled_apis) 
  validate_string                 (nova_osapi_compute_workers)  
  validate_string                 ($nova_metadata_workers)
  validate_string                	($nova_rpc_backend)
  validate_string                	($nova_auth_strategy)
  validate_bool	                	($nova_use_neutron)
  validate_string                 ($nova_rabbit_transport_url)
  validate_string                 ($nova_compute_driver)
  validate_string                 ($nova_public_interface)
  validate_string                 ($nova_linuxnet_interface_driver)
  validate_string                	($nova_firewall_driver)
  ###[LIBVIRT]
  validate_string                 ($libvirt_virt_type)
  ###[api_database]
  validate_string                	($nova_api_connection)  
  validate_string                	($nova_api_retry_interval)
  validate_string                	($nova_api_max_retries)
  ###[api_database]
  validate_string                	($nova_database_connection)
  validate_string                	($nova_database_max_retries)
  validate_string                	($nova_database_retry_interval)
  validate_string                	($nova_database_backend)
  ###cinder
  #validate_string                 ($cinder_catalog_info)
  #validate_string                 ($cinder_endpoint_template)
  #validate_string                 ($cinder_os_region_name)
  #validate_string                 ($cinder_http_retries)
  #validate_bool                   ($cinder_cross_az_attach)
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
  ###[neutron]
  validate_string                 ($nova_neutron_url)
  validate_string                 ($nova_neutron_auth_url)
  validate_string                 ($nova_neutron_auth_type)
  validate_string                 ($nova_neutron_project_domain_name)
  validate_string                 ($nova_neutron_user_domain_name)
  validate_string                 ($nova_neutron_region_name)
  validate_string                 ($nova_neutron_project_name)
  validate_string                 ($nova_neutron_username)        
  validate_string                 ($nova_neutron_password)
  validate_bool                   ($nova_neutron_service_metadata_proxy)  
  validate_string                 ($nova_neutron_metadata_proxy_shared_secret)
  ###[vnc]
  validate_string                 ($vnc_vncserver_listen)
  validate_string                 ($vnc_vncserver_proxyclient_address)
  validate_bool                   ($vnc_enabled)
  validate_string                 ($vnc_keymap)
  validate_string                 ($vnc_novncproxy_host)
  validate_string                 ($vnc_novncproxy_port)
  validate_string                 ($vnc_novncproxy_base_url)
  #VNC pour XEN
  validate_string                 ($vnc_xvpvncproxy_host)
  validate_string                 ($vnc_xvpvncproxy_port)
  validate_string                 ($vnc_xvpvncproxy_base_url)  
  ###[wsgi]
  #validate_string                 ($nova_api_paste_config)
  ###[spice]
  #validate_string                 ($spice_html5proxy_base_url)
  #validate_string                 ($spice_server_listen)
  #validate_string                 ($spice_server_proxyclient_address)
  #validate_bool                   ($spice_enabled)
  #validate_bool                   ($spice_agent_enabled)
  #validate_string                 ($spice_keymap)
  #validate_string                 ($spice_html5proxy_host)
  #validate_string                 ($spice_html5proxy_port)
  ###[rdp]
  #validate_bool                   ($rdp_enabled)
  #validate_string                 ($rdp_html5_proxy_base_url)
  ###[glance]
  validate_string                 ($nova_glance_api_servers)
  ###[oslo_concurrency]            
  validate_string                 ($nova_oslo_concurrency_lock_path)
  ###[conductor]                      
  #validate_string                 ($nova_conductor_workers)
    

  #####  NEUTRON  ######
  ###/etc/neutron/neutron.conf
  ###DEFAULT
  validate_string                 ($neutron_core_plugin)
  validate_string                 ($neutron_service_plugins)
  validate_bool                   ($neutron_allow_overlapping_ips)
  validate_string                 ($neutron_rabbit_transport_url)
  validate_string                 ($neutron_auth_strategy)
  validate_bool                   ($neutron_notify_nova_on_port_status_changes)
  validate_bool                   ($neutron_notify_nova_on_port_data_changes)
  validate_string                 ($neutron_dhcp_agents_per_network)
  validate_string                 ($neutron_rpc_backend)
  validate_string                 ($neutron_api_workers)
  validate_string                 ($neutron_rpc_workers)
  ###[database]
  validate_string                 ($neutron_db_connection)
  validate_string                 ($neutron_retry_interval)
  validate_string                 ($neutron_max_retries)
  ###[keystone_authtoken]
  validate_string                 ($neutron_keystone_auth_uri)
  validate_string                 ($neutron_keystone_auth_url)
  validate_string                 ($neutron_keystone_memcached_servers)
  validate_string                 ($neutron_keystone_auth_type)
  validate_string                 ($neutron_keystone_project_domain_name)
  validate_string                 ($neutron_keystone_user_domain_name)
  validate_string                 ($neutron_keystone_project_name)
  validate_string                 ($neutron_keystone_username)
  validate_string                 ($neutron_keystone_password)
  ###[nova]
  validate_string                 ($neutron_nova_auth_url)
  validate_string                 ($neutron_nova_auth_type)
  validate_string                 ($neutron_nova_project_domain_name)
  validate_string                 ($neutron_nova_user_domain_name)
  validate_string                 ($neutron_nova_region_name)
  validate_string                 ($neutron_nova_project_name)
  validate_string                 ($neutron_nova_username)
  validate_string                 ($neutron_nova_password)    
  
  
  ###/etc/neutron/plugins/ml2/ml2_conf.ini :
  ### [Ml2]
  validate_string                       ($neutron_ml2_type_drivers) 
  validate_string                       ($neutron_ml2_tenant_network_types) 
  validate_string                       ($neutron_ml2_mechanism_drivers) 
  validate_string                       ($neutron_ml2_extension_drivers) 
  ### [Ml2_type_flat]
  validate_string                       ($neutron_flat_flat_networks)
  ### [Ml2_type_vlan]
  validate_string                       ($neutron_network_vlan_ranges) 
  ###[Ml2_type_vxlan]
  validate_string                       ($neutron_flat_vxlan_vni_ranges) 
  ###[securitygroup]
  validate_bool                         ($neutron_securitygroup_enable_ipset)

  ### /etc/neutron/plugins/ml2/linuxbridge_agent.ini:
  ###[linux_bridge]
  validate_string                       ($neutron_agent_physical_interface_mappings)
  ###[vxlan]
  validate_bool                         ($neutron_agent_enable_vxlan) 
  validate_string                       ($neutron_agent_vxlan_local_ip) 
  validate_bool                         ($neutron_agent_vxlan_l2_population)
  ###[securitygroup]
  validate_bool                         ($neutron_agent_enable_security_group) 
  validate_string                       ($neutron_agent_firewall_driver) 
  
  ### /etc/neutron/l3_agent.ini:
  ###[DEFAULT]
  validate_string                       ($neutron_l3agent_interface_driver) 
  
  ### /etc/neutron/dhcp_agent.ini:
  ###[DEFAULT]
  validate_string                       ($neutron_dhcp_interface_driver) 
  validate_string                       ($neutron_dhcp_driver)
  validate_bool                         ($neutron_dhcp_enable_isolated_metadata) 
  
  ###/etc/neutron/metadata_agent.ini
  ###[DEFAULT]
  validate_string                       ($metadata_nova_metadata_ip) 
  validate_string                       ($metadata_proxy_shared_secret) 
    
  #####  DASHBOARD  ######
  ###/etc/openstack-dashboard/local_settings: 
  validate_string                       ($dashboard_OPENSTACK_HOST)
  validate_string                       ($dashboard_ALLOWED_HOSTS)
  validate_string                       ($dashboard_SESSION_ENGINE)
  validate_string                       ($dashboard_BACKEND)
  validate_string                       ($dashboard_LOCATION)
  validate_string                       ($dashboard_OPENSTACK_KEYSTONE_URL)
  validate_bool                         ($dashboard_OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT)
  validate_string                       ($dashboard_OPENSTACK_KEYSTONE_DEFAULT_DOMAIN)
  validate_string                       ($dashboard_OPENSTACK_KEYSTONE_DEFAULT_ROLE)
  validate_string                       ($dashboard_enable_router)
  validate_string                       ($dashboard_enable_quotas)
  validate_string                       ($dashboard_enable_ipv6)
  validate_string                       ($dashboard_enable_distributed_router)
  validate_string                       ($dashboard_enable_ha_router)
  validate_string                       ($dashboard_enable_lb)
  validate_string                       ($dashboard_enable_firewall)
  validate_string                       ($dashboard_enable_vpn)
  validate_string                       ($dashboard_enable_fip_topology_check)
  validate_string                       ($dashboard_TIME_ZONE)   
    
  anchor { 'openstack::begin': } ->
    class { '::openstack::install': } ->
    class { '::openstack::config': } ~>
    class { '::openstack::service': } ->
    class { '::openstack::user': } ->
  anchor { 'openstack::end': }	  
}

