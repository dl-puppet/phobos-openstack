class openstack::params
{
  
      ##### PACKAGES #####
      $package_manage                   = true
      $package_name                     = ['chrony']
      $package_ensure                   = 'present'
	  
	    ##### CONFIG_FILES #####   
		  $file_ensure                      = 'present'    
		  $file_backup                      = '.puppet-bak'   
		  $file_group                       = '0'
		  $file_mode                        = '0644'
		  $file_owner                       = '0'

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
 
      ####### CHRONY #######  
      $allow                              =  '192.168.122.0/24'
      $servers  = [
        '0.centos.pool.ntp.org iburst',
        '1.centos.pool.ntp.org iburst',
        '2.centos.pool.ntp.org iburst',
        '3.centos.pool.ntp.org iburst',
      ]	
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
      
      # /etc/sysconfig/network:
		  $network_networking          = 'yes'
		  #$HOSTNAME                   = 'phobos'
		  $network_nm                  = 'no'
		  $network_nozeroconf          = 'yes'
		  $network_gateway             = 'wlp3s0'
		  #$GATEWAYDEV                 = '10.40.44.192'
		
		  # /etc/resolv.conf:
		  $resolv_device              =  'eth0'
		  $resolv_type                =  'Ethernet'
		  $resolv_hotplug             =  'yes'
		  $resolv_onboot              =  'yes'
		  $resolv_controlled          =  'no'
		  #$HWADDR                    =  <%= scope.lookupvar('::macaddress_eth0') %>,
		  $resolv_bootproto           =  'dhcp'
		  $resolv_peerdns             =  'no'
		  $resolv_ipv6init            =  'no'
		
		  # /etc/host.conf:
		  $host_conf                  =  "order hosts,bind"
		
		  # /etc/hosts:
		  $list_host                  = ''
		
		
		  ###### CONFIG_MOTD ######    
		  $dynamic                    = true
		  $file_dynamic               = '/etc/profile.d/motd.sh'
		  $file_no_dynamic            = '/etc/motd'
		  ###### CONFIG_ISSUE ######    
		  $issue                      = true
		  $file_issue                 = '/etc/issue.net'
}
