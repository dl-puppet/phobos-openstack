class openstack::params
{
  
      ##### PACKAGES #####
      $package_manage                   = true
      $package_name                     = [
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
		 
}
