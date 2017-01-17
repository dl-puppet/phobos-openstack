class openstack::params
{
  
      ##### PACKAGES #####
      $package_manage                   = true
      $package_name                     = ['chrony']
      $package_ensure                   = 'present'
	  
	    ##### CONFIG_FILES #####   
		  $file_ensure                      = 'present'    
		  $file_backup                      = '.puppet-bak'   
		  $file_group                       = 'root'
		  $file_mode                        = '0644'
		  $file_owner                       = 'root'

      ######### SERVICES ########
			$service_name                     = 'chronyd'
			$service_ensure                   = running            
			$service_enable                   = true
		
	    ####### USER ####### 
		  $user                              = 'openstack'
		  $user_ensure                       = present
		  $user_uid                          = '2000'
		  $user_managehome                   = false
		  $user_shell                        = '/sbin/nologin'
	
      ####### IFCFG-ETH0 ####### 	
			$resolv_device1                     = 'eth0'
		  $resolv_name1                       = 'eth0'
		  $resolv_network                    = '192.168.122.0'
		  $resolv_ipaddr                     = '192.168.122.200'
		  $resolv_netmask                    = '255.255.255.0'
		  $resolv_gateway                    = '192.168.122.1'
		  $resolv_broadcast                  = '192.168.122.255'
		  
      ####### IFCFG-ETH1 #######  
      $resolv_device2                     = 'eth1'
      $resolv_name2                       = 'eth1'
      

      ####### CHRONY #######  
      $servers                            = 'server 0.centos.pool.ntp.org iburst'
      $allow                              =  '192.168.122.0/24'
      #$servers  = [
				#		'server 0.centos.pool.ntp.org iburst',
					#	'server 1.centos.pool.ntp.org iburst',
					#	'server 2.centos.pool.ntp.org iburst',
					#	'server 3.centos.pool.ntp.org iburst',
      #]
}
