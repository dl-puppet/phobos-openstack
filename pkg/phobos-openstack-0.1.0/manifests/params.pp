class openstack::params
{
  
      ##### PACKAGES #####
      $package_manage                   = true
      $package_name                     = [
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
                                          ]
      $package_ensure                   = 'present'
	  
	    ##### CONFIG_FILES #####   
		  $file_ensure                      = 'present'    
		  $file_backup                      = '.puppet-bak'   
		  $file_group                       = '0'
		  $file_mode                        = '0644'
		  $file_owner                       = '0'

      ######### SERVICES ########
			$service_name                     = [
			                                    'chronyd',
			                                    'mariadb',
			                                    'mongod',
                                          'rabbitmq-server',
                                          'memcached',
                                          'httpd',
                                          'openstack-glance-api',
                                          'openstack-glance-registry',
                                          ]
			$service_ensure                   = running            
			$service_enable                   = true
			$service_hasstatus                = true
      $service_hasrestart               = true
		
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
}