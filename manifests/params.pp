class openstack::params
{
  
      	##### PACKAGES #####
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
                                             ]
                                             
      	$package_ensure                    = 'present'

	##### CONFIG_FILES #####   
	$file_ensure          		   = 'present'    
	$file_backup          		   = '.puppet-bak'   
	$file_group           		   = '0'
	$file_mode            		   = '0644'
	$file_owner           		   = '0'

      	######### SERVICES ########
	$service_name                      = [
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
                                             ]
	$service_ensure                    = running            
	$service_enable                    = true
	$service_hasstatus                 = true
      	$service_hasrestart                = true
		
	####### USER ####### 
	$user                              = 'openstack'
	$user_ensure                       = 'present'
	$user_uid                          = '2000'
	$user_managehome                   = false
	$user_shell                        = '/sbin/nologin'
 
      	####### CHRONY #######  
      	$chromy_allow                      =  '192.168.122.0/24'
      	$chromy_servers                    = [
					   '0.centos.pool.ntp.org iburst',
					   '1.centos.pool.ntp.org iburst',
					   '2.centos.pool.ntp.org iburst',
					   '3.centos.pool.ntp.org iburst',
					   ]	  
      	####### NETWORK #######  																	          
      	# /etc/sysconfig/network:
	$network_networking                = 'yes'
	#$HOSTNAME                          = <%= scope.lookupvar('::hostname') %>
	$network_nm                        = 'no'
	$network_nozeroconf                = 'yes'
	$network_gateway                   = 'eth0'
		  
      	# /etc/networks:
      	$list_networks                     = ['']
		
	# /etc/resolv.conf:
      	$resolv_nameserver                 = '192.168.122.1'
		  
      	# /etc/sysconfig/network-script/route-eth0:
      	$route_eth0                        = [
                                             '192.168.122.0/24  via   192.168.122.1', 
                                             ]  

	# /etc/sysconfig/network-script/ifcfg-eth0:  
	$ifcfg_device                      = 'eth0'
	$ifcfg_type                        = 'Ethernet'
	$ifcfg_name                        = 'eth0'
	$ifcfg_hotplug                     = 'yes'
	$ifcfg_onboot                      = 'yes'  
	$ifcfg_controlled                  = 'no'
	$ifcfg_ipv6init                    = 'no'
	$ifcfg_bootproto                   = 'static'
	$ifcfg_defroute                    = 'yes'
	$ifcfg_peerdns                     = 'no'
      	$ifcfg_peerntp                     = 'no'
      	$ifcfg_peerroutes                  = 'yes'
      	$ifcfg_ip_failure                  = 'no'
      	$ifcfg_network                     = '192.168.122.0'
      	$ifcfg_ipaddr                      = '192.168.122.200'
      	$ifcfg_netmask                     = '255.255.255.0'
      	$ifcfg_gateway                     = '192.168.122.1'
      	$ifcfg_broadcast                   = '192.168.122.255'
      	$ifcfg_nozeroconf                  = 'yes'    
      	$ifcfg_ethtool_opts                = 'autoneg off speed 100 duplex full'
      
      	# /etc/sysconfig/network-script/ifcfg-eth1:  
      	$ifcfg_device2                     = 'eth1'
      	$ifcfg_name2                       = 'eth1'
		
	# /etc/host.conf:	
	$host_conf                         =  "order hosts,bind"
		
	# /etc/hosts:
	$list_host                         = ['']
		  
		  
	#####   MONGODB  ######  
      	$mongo_smallfiles                  = true  
      
      	#####   MEMCAHED  ###### 
      	$memcached_interface               = 'controller1'
		 
	#####   KEYSTONE  ######
	$keystone_debug                    = false 
	$keystone_log_dir                  = '/var/log/keystone'
	$keystone_verbose                  = '#verbose = true'
  $keystone_token                    = 'keytoken'
  $keystone_connection               = 'mysql+pymysql://keystone:PWDGOP@controller1/keystonedb'
  $keystone_retry_interval           = '5'
  $keystone_max_retry                = '-1'
  $keystone_server_memcache          = 'controller1:11211'
  $keystone_token_provider           = 'fernet'
  $keystone_token_driver             = 'keystone.token.persistence.backends.memcache.Token'
  $keystone_revoke_driver            = 'keystone.contrib.revoke.backends.sql.Revoke'
  $keystone_token_auth               = '' # permet de retirer admin_token_auth du fichier /etc/keystone/keystone-paste.ini 

	#####   GLANCE  ######
	$glance_connection                 = 'mysql+pymysql://glance:PWDGOP@controller1/glancedb'
  $glance_max_retries                = '-1'
  $glance_retry_interval             = '5'
  $glance_backend                    = 'sqlalchemy'
  $glance_auth_uri                   = 'http://controller1:5000'
  $glance_auth_url                   = 'http://controller1:35357'
  $glance_memcached_servers          = 'controller1:11211'
  $glance_auth_type                  = 'password'
  $glance_project_domain_name        = 'Default'
  $glance_user_domain_name           = 'Default'
  $glance_project_name               = 'service'
  $glance_username                   = 'glance'
  $glance_password                   = 'PWDGOP'
  $glance_flavor                     = 'keystone'
  $glance_stores                     = 'file,http'
	$glance_default_store              = 'file'
	$glance_filesystem_store_datadir   = '/var/lib/glance/images/'
	$glance_rabbit_host                = 'controller1'
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
	$glance_registry_bind_host         = '0.0.0.0'
	$glance_registry_bind_port         = '9191'
	$glance_registry_workers           = '2'
	###[DATABASE]
	$glance_registry_connection        = 'mysql+pymysql://glance:PWDGOP@controller1/glancedb'
	$glance_registry_retry_interval    = '5'
	$glance_registry_max_retries       = '-1'
	$glance_registry_backend           = 'sqlalchemy'
	### [keystone_authtoken]
	$glance_registry_auth_uri          = 'http://controller1:5000'
	$glance_registry_auth_url          = 'http://controller1:35357'
	$glance_registry_memcached_servers = 'controller1:11211'
	$glance_registry_auth_type         = 'password'
	$glance_registry_project_domain_name = 'Default'
	$glance_registry_user_domain_name  = 'Default'
	$glance_registry_project_name      = 'service'
	$glance_registry_username          = 'glance'
	$glance_registry_password          = 'PWDGOP'
	###[paste_deploy]
	$glance_registry_flavor            = 'keystone'
		  

  #####  NOVA  ######
	###[DEFAULT] 
	$nova_enabled_apis                 = 'osapi_compute,metadata'  
	$nova_rpc_backend                  = 'rabbit'
	$nova_auth_strategy                = 'keystone'
	$nova_my_ip                        = '192.168.154.200'
	$nova_use_neutron                  = true
	$nova_firewall_driver              = 'nova.virt.firewall.NoopFirewallDriver'
	$nova_rabbit_transport_url	       = 'rabbit://openstack:RABBIT_PASS@controller1'
	###[api_database]
	$nova_api_connection               = 'mysql+pymysql://nova:PWDGOP@controller1/novadb'  
	$nova_api_retry_interval           = '5'
	$nova_api_max_retries              = '-1'
	###[api_database]
	$nova_database_connection          = 'mysql+pymysql://nova:PWDGOP@controller1/nova_api '
	$nova_database_max_retries         = '-1'
	$nova_database_retry_interval      = '5'
	$nova_database_backend             = 'sqlalchemy'
	###[oslo_messaging_rabbit]
	$nova_rabbit_host                  = 'controller1'
	$nova_rabbit_userid                = 'openstack'
	$nova_rabbit_password              = 'RABBIT_PASS'
	#backend 			   = sqlalchemy ???
	###[keystone_authtoken]
	$nova_keystone_auth_uri            = 'http://controller1:5000'
	$nova_keystone_auth_url            = 'http://controller1:35357'
	$nova_keystone_memcached_servers   = 'controller1:11211'
	$nova_keystone_auth_type           = 'password'
	$nova_keystone_project_domain_name = 'Default'
	$nova_keystone_user_domain_name    = 'Default'
	$nova_keystone_project_name        = 'service'
	$nova_keystone_username            = 'nova'
	$nova_keystone_password            = 'PWDGOP'
	###[vnc]
	$nova_vncserver_listen             = '$my_ip'
	$nova_vncserver_proxyclient_address= '$my_ip'
	###[spice]
	###[glance]
	$nova_glance_api_servers           = 'http://controller1:9292'
	###[oslo_concurrency]
	$nova_oslo_concurrency_lock_path   = '/var/lib/nova/tmp'
	
  #####  NEUTRON  ######
  ###/etc/neutron/neutron.conf
  ###DEFAULT
  $neutron_db_connection             = 'mysql+pymysql://neutron:PWDGOP@controller1/neutrondb'
  $neutron_core_plugin               = 'ml2'
  $neutron_service_plugins           = 'router'
  $neutron_allow_overlapping_ips     = true   #True avec Majuscule
  $neutron_rabbit_transport_url      = 'rabbit://openstack:RABBIT_PASS@controller1'
  $neutron_auth_strategy             = 'keystone'
  $neutron_notify_nova_on_port_status_changes= true  #True avec Majuscule
  $neutron_notify_nova_on_port_data_changes  = true  #True avec Majuscule
  ###[keystone_authtoken]
  $neutron_keystone_auth_uri         = 'http://controller1:5000'
  $neutron_keystone_auth_url         = 'http://controller1:35357'
  $neutron_keystone_memcached_servers= 'controller1:11211'
  $neutron_keystone_auth_type        = 'password'
  $neutron_keystone_project_domain_name= 'Default'
  $neutron_keystone_user_domain_name = 'Default'
  $neutron_keystone_project_name     = 'service'
  $neutron_keystone_username         = 'nova'
  $neutron_keystone_password         = 'PWDGOP'
  ###[nova]
  $neutron_nova_auth_url             = 'http://controller1:35357'
  $neutron_nova_auth_type            = 'password'
  $neutron_nova_project_domain_name  = 'Default'
  $neutron_nova_user_domain_name     = 'Default'
  $neutron_nova_region_name          = 'onepoint'
  $neutron_nova_project_name         = 'service'
  $neutron_nova_username             = 'nova'
  $neutron_nova_password             = 'PWDGOP'
  ### [Oslo_concurrency]
  $neutron_oslo_lock_path            = '/var/lib/neutron/tmp'      
  
  
  ###/etc/neutron/plugins/ml2/ml2_conf.ini :
  ### [Ml2]
  $neutron_ml2_type_drivers          = 'flat,vlan,vxlan'
  $neutron_ml2_tenant_network_types  = 'vxlan'
  $neutron_ml2_mechanism_drivers     = 'linuxbridge,l2population'
  $neutron_ml2_extension_drivers     = 'port_security'
  ### [Ml2_type_flat]
  $neutron_flat_flat_networks        = 'provider'
  ###[Ml2_type_vxlan]
  $neutron_flat_vxlan_vni_ranges     = '1:1000'
  ###[securitygroup]
  $neutron_securitygroup_enable_ipset= true #True avec Majuscule

	
}
