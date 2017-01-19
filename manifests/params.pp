class openstack::params
{
  
      ##### PACKAGES #####
      $package_manage                   = true
      $package_name                     = ['chrony,subscription-manager']
      $package_ensure                   = 'present'
	  
	    ##### CONFIG_FILES #####   
		  $file_ensure                      = 'present'    
		  $file_backup                      = '.puppet-bak'   
		  $file_group                       = '0'
		  $file_mode                        = '0644'
		  $file_owner                       = '0'

      ######### SERVICES ########
			$service_name                     = 'chronyd,goferd'
			$service_ensure                   = running            
			$service_enable                   = true
			$service_hasstatus                = true
      $service_hasrestart               = true
		
	    ####### USER ####### 
		  $user                              = 'openstack'
		  $user_ensure                       = present
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
		  
		   
      ##### YUM_SUBSCRIPTION_MANAGER #####		  
		  $yum_server_hostname                   = 'subscription.rhn.redhat.com'
	    $yum_config_hash                   = {
																		      'server_insecure'               => false,
																		      'server_prefix'                 => '/subscription',
																		      'server_port'                   => 443,
																		      'server_ssl_verify_depth'       => 3,
																		      'server_proxy_hostname'         => '',
																		      'server_proxy_port'             => '',
																		      'server_proxy_user'             => '',
																		      'server_proxy_password'         => '',
																		      'rhsm_baseurl'                  => 'https://cdn.redhat.com',
																		      'rhsm_ca_cert_dir'              => '/etc/rhsm/ca',
																		      'rhsm_repo_ca_cert'             => '%(ca_cert_dir)s/redhat-uep.pem',
																		      'rhsm_productcertdir'           => '/etc/pki/product',
																		      'rhsm_entitlementcertdir'       => '/etc/pki/entitlement',
																		      'rhsm_consumercertdir'          => '/etc/pki/consumer',
																		      'rhsm_manage_repos'             => true,
																		      'rhsmcertd_certcheckinterval'   => 240,
																		      'rhsmcertd_autoattachinterval'  => 1440,
	                                       }
	    $yum_username                      = 'd.levray@groupeonepoint.com'
	    $yum_password                      = ''
	    $yum_activationkey                 = undef
	    $yum_pool                          = undef
	    $yum_servicelevel                  = undef
	    $yum_environment                   = undef # cannot use with an activation key!
	    $yum_autosubscribe                 = false
	    $yum_force                         = false
	    $yum_org                           = 'Default_Organization'
	    $yum_repo                          = undef
	    $yum_ca_package_prefix             = 'katello-ca-consumer-'	
}
