class openstack::params
{
  $my_ip = '192.168.122.80'  #IP de l’interface de gestion du Contrôller
  
  ####################################################################################################### 
  ##### PACKAGES #####
  ####################################################################################################### 
      	$package_manage                    = true
      	$package_name                      = [
                                             'bridge-utils',
                                             'wget',
                                             'chrony',
                                             'subscription-manager',
                                             'python-openstackclient',
                                             'openstack-selinux',
                                             'mariadb',
                                             'mariadb-server',
                                             'python2-PyMySQL',  
                                             'mongodb-server',
                                             'mongodb',
                                             'rabbitmq-server',
                                             'memcached',
                                             'python-memcached',
                                             'openstack-keystone',
                                             'httpd',
                                             'mod_wsgi',
                                             'openstack-glance',
                                             'openstack-nova-api',
                                             'openstack-nova-conductor',
                                             'openstack-nova-console',
                                             'openstack-nova-novncproxy',
                                             'openstack-nova-scheduler',
                                             'openstack-neutron',
                                             'openstack-neutron-ml2',
                                             'openstack-neutron-linuxbridge',
                                             'ebtables',
                                             'openstack-dashboard',
                                             ]
                                             
      	$package_ensure                    = 'present'

	##### CONFIG_FILES #####   
	$file_ensure          		           = 'present'    
	$file_backup          		           = '.puppet-bak'   
	$file_group           		           = '0'
	$file_mode            		           = '0644'
	$file_owner           		           = '0'
	

  ####################################################################################################### 
  ######### SERVICES ########
  #######################################################################################################       	
	$service_name                        = [
	                                     'chronyd',
	                                     'mariadb',
	                                     'mongod',
                                       'rabbitmq-server',
                                       'memcached',
                                       'httpd',
                                       'openstack-glance-api',
                                       'openstack-glance-registry',
					                             'openstack-nova-api',
					                                  'openstack-nova-consoleauth',
                                            'openstack-nova-scheduler',
                                       'openstack-nova-conductor',
                                       'openstack-nova-novncproxy',
                                             'neutron-server',
                                       'neutron-linuxbridge-agent',	
                                       'neutron-dhcp-agent',
                                       'neutron-metadata-agent',
                                       'neutron-l3-agent',
                                       ]
	$service_ensure                      = running            
	$service_enable                      = true
	$service_hasstatus                   = true
      	$service_hasrestart            = true
		
  ####################################################################################################### 
	####### USER ####### 
  ####################################################################################################### 
	$user                                = 'openstack'
	$user_ensure                         = 'present'
	$user_uid                            = '2000'
	$user_managehome                     = false
	$user_shell                          = '/sbin/nologin'
  ####################################################################################################### 
  ####### CHRONY ####### 
  #######################################################################################################   
      	$chromy_allow                  =  '192.168.122.0/24'
      	$chromy_servers                = [
																		   '0.centos.pool.ntp.org iburst',
																		   '1.centos.pool.ntp.org iburst',
																		   '2.centos.pool.ntp.org iburst',
																		   '3.centos.pool.ntp.org iburst',
																		   ]	
  ####################################################################################################### 																		     
  ####### NETWORK #######  
  #######################################################################################################																	          
  # /etc/sysconfig/network:
	$network_networking                  = 'yes'
	#$HOSTNAME                           = <%= scope.lookupvar('::hostname') %>
	$network_nm                          = 'no'
	$network_nozeroconf                  = 'yes'
	$network_gateway                     = 'eth0'

  #/etc/networks:
  $list_networks                 = ['']
		
	#/etc/resolv.conf:
      	$resolv_nameserver             = '192.168.122.1'
		  
      	# /etc/sysconfig/network-script/route-eth0:
      	$route_eth0                    = [
                                       '192.168.122.0/24  via   192.168.122.1', 
                                       ]  

	# /etc/sysconfig/network-script/ifcfg-eth0:  
	$ifcfg_device                        = 'eth0'
	$ifcfg_type                          = 'Ethernet'
	$ifcfg_name                          = 'eth0'
	$ifcfg_hotplug                       = 'yes'
	$ifcfg_onboot                        = 'yes'  
	$ifcfg_controlled                    = 'no'
	$ifcfg_ipv6init                      = 'no'
	$ifcfg_bootproto                     = 'static'
	$ifcfg_defroute                      = 'yes'
	$ifcfg_peerdns                       = 'no'
  $ifcfg_peerntp                       = 'yes'
  $ifcfg_peerroutes                    = 'yes'
  $ifcfg_ip_failure                    = 'no'
  $ifcfg_network                       = '192.168.122.0'
  $ifcfg_ipaddr                        = "$my_ip"
  $ifcfg_netmask                       = '255.255.255.0'
  $ifcfg_gateway                       = '192.168.122.1'
  $ifcfg_broadcast                     = '192.168.122.255'
  $ifcfg_nozeroconf                    = 'yes'    
  $ifcfg_ethtool_opts                  = 'autoneg off speed 100 duplex full'
      
  # /etc/sysconfig/network-script/ifcfg-eth1:  
  $ifcfg_device2                       = 'eth1'
  $ifcfg_name2                         = 'eth1'
		
	# /etc/host.conf:	
	$host_conf                         =  "order hosts,bind"
		
	# /etc/hosts:
	$list_host                         = [
	                                     "$my_ip controller.gop.link controller",
                                       '192.168.122.210 compute1.gop.link compute1',
                                       ]


  ####################################################################################################### 
  #####   "MONGODB"  ######  
  ####################################################################################################### 
  $mongo_smallfiles                  =    true
  
  ####################################################################################################### 	                                     ]
  #####  MARIADB ###### 
  ####################################################################################################### 
  ###/etc/my.cnf.d/openstack.cnf  
  $maria_bind_address                = 'controller'
      
  #######################################################################################################       
  #####  MEMCACHED ###### 
  ####################################################################################################### 
  ###/etc/sysconfig/memcached
  $memcached_interface               = "$my_ip"   #VOIR pour 127.0.0.1
  
  ####################################################################################################### 
  #####  KEYSTONE  ######
  ####################################################################################################### 
  ###/etc/keystone/keystone-paste.ini
  $keystone_token_auth               = '' # permet de retirer admin_token_auth du fichier /etc/keystone/keystone-paste.ini 
  ###/etc/keystone/keystone.conf
  ###[DEFAULT]
  $keystone_token                    = 'keytoken'
  ###[database]
  $keystone_connection               = "mysql+pymysql://keystone:PWDGOP@$my_ip/keystonedb"  #connexion à la DB maria
  $keystone_retry_interval           = '5'
  $keystone_max_retry                = '-1'
  ###[memcache]
  $keystone_server_memcache          = "$my_ip:11211"     #configuration du serveur apache/memcached
  ###[token]
  $keystone_token_provider           = 'fernet'
  $keystone_token_driver             = 'keystone.token.persistence.backends.memcache.Token'
  ###[revoke]
  $keystone_revoke_driver            = 'keystone.contrib.revoke.backends.sql.Revoke'
  
  #######################################################################################################  
	#####  GLANCE  ######
  ####################################################################################################### 
	### /etc/glance/glance-api.conf
	###[DEFAULT]
	#$glance_api_workers                = '2'
	###[database]
	$glance_connection                 = "mysql+pymysql://glance:PWDGOP@$my_ip/glancedb"
  $glance_max_retries                = '-1'
  $glance_retry_interval             = '5'
  $glance_backend                    = 'sqlalchemy'
  ###[keystone_authtoken]
  $glance_auth_uri                   = "http://$my_ip:5000"
  $glance_auth_url                   = "http://$my_ip:35357"
  $glance_memcached_servers          = "$my_ip:11211"
  $glance_auth_type                  = 'password'
  $glance_project_domain_name        = 'Default'
  $glance_user_domain_name           = 'Default'
  $glance_project_name               = 'service'
  $glance_username                   = 'glance'
  $glance_password                   = 'PWDGOP'
  ###[paste_deploy]
  $glance_flavor                     = 'keystone'
  ###[glance_store]
  $glance_stores                     = 'file,http'
	$glance_default_store              = 'file'
	$glance_filesystem_store_datadir   = '/var/lib/glance/images/'
	###[oslo_messaging_rabbit]
	$glance_rabbit_host                = "$my_ip"
	$glance_rabbit_port                = '5672'
	$glance_rabbit_userid              = 'openstack'
	$glance_rabbit_password            = 'RABBIT_PASS'
	$glance_rabbit_retry_interval      = '1'
	$glance_rabbit_retry_backoff       = '2'
	$glance_rabbit_max_retries         = '0'
	$glance_rabbit_durable_queues      = true
	$glance_rabbit_ha_queues           = true

	###Configuration /etc/glance/glance-registry.conf:
	###[default]
	$glance_registry_debug             = false
	$glance_registry_verbose           = '#verbose = true'
	$glance_registry_log_file          = '/var/log/glance/registry.log'
	$glance_registry_bind_host         = "$my_ip"
	$glance_registry_bind_port         = '9191'
	$glance_registry_workers           = '2'
	###[DATABASE]
	$glance_registry_connection        = "mysql+pymysql://glance:PWDGOP@$my_ip/glancedb"
	$glance_registry_retry_interval    = '5'
	$glance_registry_max_retries       = '-1'
	$glance_registry_backend           = 'sqlalchemy'
	### [keystone_authtoken]
	$glance_registry_auth_uri          = "http://$my_ip:5000"
	$glance_registry_auth_url          = "http://$my_ip:35357"
	$glance_registry_memcached_servers = "$my_ip:11211"
	$glance_registry_auth_type         = 'password'
	$glance_registry_project_domain_name = 'Default'
	$glance_registry_user_domain_name  = 'Default'
	$glance_registry_project_name      = 'service'
	$glance_registry_username          = 'glance'
	$glance_registry_password          = 'PWDGOP'
	###[paste_deploy]
	$glance_registry_flavor            = 'keystone'
		  

  ####################################################################################################### 
  #####  NOVA  ######
  ####################################################################################################### 

                                     ###/etc/nova/nova.conf###
                                  
	###[DEFAULT] 
	$nova_my_ip                        = "$my_ip"       #IP de l’interface de gestion du Contrôller
	$nova_enabled_apis                 = 'osapi_compute,metadata'  
	#$nova_osapi_compute_workers        = '2'
	#$nova_metadata_workers             = '2'
	$nova_rpc_backend                  = 'rabbit'
	$nova_auth_strategy                = 'keystone'
	$nova_use_neutron                  = true
	$nova_rabbit_transport_url	       = "rabbit://openstack:RABBIT_PASS@$my_ip"
  #$nova_compute_driver               = 'libvirt.LibvirtDriver'                  #Driver de controle:libvirt.LibvirtDriver/xenapi.XenAPIDriver/fake.FakeDriver/ironic.IronicDriver/vmwareapi.VMwareVCDriver/hyperv.HyperVDriver
  #$nova_public_interface             = 'eth1'           #Désigne l’interface sur vos hôtes exécutant Nova que vos clients utiliseront pour accéder à vos instances.
  #Activer le support pour le service réseau. Par défaut, le Compute utilise un 
  #service de pare-feu interne. Vous devez donc désactiver le service de pare-feu 
  #Compute en utilisant le pilote de pare-feu nova.virt.firewall.NoopFirewallDriver.
	#linuxnet_interface_driver         = nova.network.linux_net.LinuxBridgeInterfaceDriver
	#linuxnet_interface_driver         = nova.network.linux_net.LinuxOVSInterfaceDriver
	$nova_linuxnet_interface_driver    = 'nova.network.linux_net.NeutronLinuxBridgeInterfaceDriver'
  $nova_firewall_driver              = 'nova.virt.firewall.NoopFirewallDriver'
	###[LIBVIRT]
	$libvirt_virt_type                 = 'qemu'      #définit le mode de virtualisation
	###[api_database]
	$nova_api_connection               = "mysql+pymysql://nova:PWDGOP@$my_ip/nova_api" 
	$nova_api_retry_interval           = '5'
	$nova_api_max_retries              = '-1'
	###[database]
	$nova_database_connection          = "mysql+pymysql://nova:PWDGOP@$my_ip/novadb"
	$nova_database_max_retries         = '-1'
	$nova_database_retry_interval      = '5'
	$nova_database_backend             = 'sqlalchemy'
  ###cinder
	#$cinder_catalog_info               =  'volumev2:cinderv2:publicURL'
  #$cinder_endpoint_template          =  ''
  #$cinder_os_region_name             =  ''
  #$cinder_http_retries               =  '3'
  #$cinder_cross_az_attach            =  true
	###[keystone_authtoken]
	$nova_keystone_auth_uri            = "http://$my_ip:5000"
	$nova_keystone_auth_url            = "http://$my_ip:35357"
	$nova_keystone_memcached_servers   = "$my_ip:11211"
	$nova_keystone_auth_type           = 'password'                #auth_plugin = password
	$nova_keystone_project_domain_name = 'Default'
	$nova_keystone_user_domain_name    = 'Default'
	$nova_keystone_project_name        = 'service'
	$nova_keystone_username            = 'nova'
	$nova_keystone_password            = 'PWDGOP'
	###[neutron]
  $nova_neutron_url                  = "http://$my_ip:9696"
  $nova_neutron_auth_url             = "http://$my_ip:35357"     #http://controller:35357/v2.0
  $nova_neutron_auth_type            = 'password'                #auth_strategy = keystone
  $nova_neutron_project_domain_name  = 'Default'
  $nova_neutron_user_domain_name     = 'Default'
  $nova_neutron_region_name          = 'RegionOne'
  $nova_neutron_project_name         = 'service'
  $nova_neutron_username             = 'neutron'        
  $nova_neutron_password             = 'PWDGOP'
  $nova_neutron_service_metadata_proxy= true   
  $nova_neutron_metadata_proxy_shared_secret= 'METADATA_SECRET'
	###[vnc]
	$vnc_vncserver_listen             = "$my_ip"
	$vnc_vncserver_proxyclient_address= "$my_ip"
	$vnc_enabled                       = true
	$vnc_keymap                        = 'fr'
	#$vnc_novncproxy_host               = '0.0.0.0'
	#$vnc_novncproxy_port               = '6080'
	#$vnc_novncproxy_base_url           = "http://$my_ip:6080/vnc_auto.html"
	#VNC pour XEN
	#$vnc_xvpvncproxy_host              = '0.0.0.0'
	#$vnc_xvpvncproxy_port              = '6081'
	#$vnc_xvpvncproxy_base_url          = "http://$my_ip:6081/console"	
	###[wsgi]
	#$nova_api_paste_config             = '/etc/nova/api-paste.ini'      #emplacement du fichier paste contenant la paste.deploy pour le service nova-api
	###[spice]
	#$spice_html5proxy_base_url         = "http://$my_ip:6082/spice_auto.html"
	#$spice_server_listen               = "$my_ip"
	#$spice_server_proxyclient_address  = "$my_ip"
	#$spice_enabled                     =  true
	#$spice_agent_enabled               =  true
	#$spice_keymap                      = 'fr'
	#$spice_html5proxy_host             = "$my_ip"
	#$spice_html5proxy_port             = '6082'
  ###[rdp]
  #$rdp_enabled                       =  false
  #$rdp_html5_proxy_base_url          =  "http://$my_ip:6083/"
	###[glance]
	$nova_glance_api_servers           = "http://$my_ip:9292"   #spécifie le serveur qui exécute le service Glance
	###[oslo_concurrency]              #Permet à Nova d'écrire ses fichiers de verrouillage.
	$nova_oslo_concurrency_lock_path   = '/var/lib/nova/tmp'
	###[conductor]                      
	#$nova_conductor_workers            = '2'


  ####################################################################################################### 
  #####  NEUTRON  ######
  ####################################################################################################### 
  
                                     ###/etc/neutron/neutron.conf###
  ###DEFAULT
  $neutron_core_plugin               = 'ml2'         #neutron.plugins.ml2.plugin.Ml2Plugin
  $neutron_service_plugins           = 'router'      #router,lbaas,neutron.services.firewall.fwaas_plugin.FirewallPlugin
  $neutron_allow_overlapping_ips     = true          #True avec Majuscule
  $neutron_rabbit_transport_url      = "rabbit://openstack:RABBIT_PASS@$my_ip"
  $neutron_auth_strategy             = 'keystone'
  $neutron_notify_nova_on_port_status_changes= true  #True avec Majuscule
  $neutron_notify_nova_on_port_data_changes  = true  #True avec Majuscule
  #$neutron_dhcp_agents_per_network   = '2'
  #$neutron_rpc_backend               = 'rabbit'
  #$neutron_api_workers               = '2'
  #$neutron_rpc_workers               = '2'
  ###[database]
  $neutron_db_connection             = "mysql+pymysql://neutron:PWDGOP@$my_ip/neutrondb"
  $neutron_retry_interval            = '5'
  $neutron_max_retries               = '-1'
  ###[keystone_authtoken]
  $neutron_keystone_auth_uri         = "http://$my_ip:5000"
  $neutron_keystone_auth_url         = "http://$my_ip:35357"
  $neutron_keystone_memcached_servers= "$my_ip:11211"
  $neutron_keystone_auth_type        = 'password'
  $neutron_keystone_project_domain_name= 'Default'
  $neutron_keystone_user_domain_name = 'Default'
  $neutron_keystone_project_name     = 'service'
  $neutron_keystone_username         = 'nova'      #nova ?? neutron ??
  $neutron_keystone_password         = 'PWDGOP'
  ###[nova]
  $neutron_nova_auth_url             = "http://$my_ip:35357"
  $neutron_nova_auth_type            = 'password'
  $neutron_nova_project_domain_name  = 'Default'
  $neutron_nova_user_domain_name     = 'Default'
  $neutron_nova_region_name          = 'RegionOne'   #Attention RegionOne
  $neutron_nova_project_name         = 'service'
  $neutron_nova_username             = 'nova'
  $neutron_nova_password             = 'PWDGOP'   
  
                                     ###/etc/neutron/plugins/ml2/ml2_conf.ini###
  ### [Ml2]
  $neutron_ml2_type_drivers          = 'flat,vlan,vxlan'      #flat,gre,geneve,vlan,vxlan
  $neutron_ml2_tenant_network_types  = 'vxlan'
  $neutron_ml2_mechanism_drivers     = 'linuxbridge,l2population'
  $neutron_ml2_extension_drivers     = 'port_security'
  ### [Ml2_type_flat]
  $neutron_flat_flat_networks        = 'provider'
  ### [Ml2_type_vlan]
  $neutron_network_vlan_ranges        = '*'   #provider
  ###[Ml2_type_vxlan]
  $neutron_flat_vxlan_vni_ranges     = '1:1000'
  ###[securitygroup]
  $neutron_securitygroup_enable_ipset= true #True avec Majuscule

                                     ### /etc/neutron/plugins/ml2/linuxbridge_agent.ini###
  ###[linux_bridge]
  $neutron_agent_physical_interface_mappings= 'provider:eth1'  #PROVIDER_INTERFACE_NAME
  ###[vxlan]
  $neutron_agent_enable_vxlan        = true
  $neutron_agent_vxlan_local_ip      = "$my_ip"                #OVERLAY_INTERFACE_IP_ADDRESS
  $neutron_agent_vxlan_l2_population = true
  ###[securitygroup]
  $neutron_agent_enable_security_group= true
  $neutron_agent_firewall_driver     = 'neutron.agent.linux.iptables_firewall.IptablesFirewallDriver'
  
                                     ### /etc/neutron/l3_agent.ini###
  ###[DEFAULT]
  $neutron_l3agent_interface_driver  = 'neutron.agent.linux.interface.BridgeInterfaceDriver'   #neutron.agent.linux.interface.OVSInterfaceDriver
  
                                     ### /etc/neutron/dhcp_agent.ini###
  ###[DEFAULT]
  $neutron_dhcp_interface_driver     = 'neutron.agent.linux.interface.BridgeInterfaceDriver'
  $neutron_dhcp_driver               = 'neutron.agent.linux.dhcp.Dnsmasq'
  $neutron_dhcp_enable_isolated_metadata= true  #True avec Majuscule
  
                                     ###/etc/neutron/metadata_agent.ini###
  ###[DEFAULT]
  $metadata_nova_metadata_ip         = "$my_ip"
  $metadata_proxy_shared_secret      = 'METADATA_SECRET'
  

  ####################################################################################################### 
  #####  DASHBOARD  ######
  ####################################################################################################### 
                                     ###/etc/openstack-dashboard/local_settings###
  $dashboard_OPENSTACK_HOST          = "$my_ip"
  $dashboard_ALLOWED_HOSTS           = "['*', ]"
  $dashboard_SESSION_ENGINE          = 'django.contrib.sessions.backends.cache'
  $dashboard_BACKEND                 = 'django.core.cache.backends.memcached.MemcachedCache'
  $dashboard_LOCATION                = "$my_ip:11211"
  $dashboard_OPENSTACK_KEYSTONE_URL  = 'http://%s:5000/v3" % OPENSTACK_HOST'
  $dashboard_OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT= true
  $dashboard_OPENSTACK_KEYSTONE_DEFAULT_DOMAIN= 'Default'
  $dashboard_OPENSTACK_KEYSTONE_DEFAULT_ROLE= 'user'
  $dashboard_enable_router           = 'True'
  $dashboard_enable_quotas           = 'True'
  $dashboard_enable_ipv6             = 'False'
  $dashboard_enable_distributed_router= 'True'
  $dashboard_enable_ha_router        = 'True'
  $dashboard_enable_lb               = 'True'
  $dashboard_enable_firewall         = 'True'
  $dashboard_enable_vpn              = 'True'
  $dashboard_enable_fip_topology_check= 'True'
  $dashboard_TIME_ZONE               = 'UTC'

}
