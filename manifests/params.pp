class openstack::params
{
  
      ######################################## PACKAGES ############################################
      $package_manage                   = true
      $package_name                     = ['chrony']
      $package_ensure                   = 'present'
	  
	    ###################################### CONFIG_FILES ##########################################   
		  $file_ensure                      = 'present'       # Spécifier le type gérer:  fichiers, répertoires ou liens symboliques. Valeur possible: present, absent, file, directory, and link.    
		  $file_backup                      = '.puppet-bak'   # le contenu du fichier doit être sauvegardé avant d'être remplacé.   
		  $file_group                       = 'root'          # Quel groupe devrait posséder le fichier.
		  $file_mode                        = '0644'          # Le mode d'autorisations pour le fichier désiré dans la notation symbolique (r,w,x,t,s,X,u,g,o)  ou numérique.
		  $file_owner                       = 'root'          # L'utilisateur auquel le dossier devrait appartenir. peut être un nom d'utilisateur ou un ID utilisateur.

      ######### SERVICES ########
			$service_name                     = 'chronyd'
			$service_ensure                   = running            
			$service_enable                   = true
		
	    ####### USER ####### 
		  $user                              = 'openstack'
		  $user_ensure                       = present
		  $user_uid                          = '2000'
		  $user_managehome                   = 'false'
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
      $servers  = [
						'server 0.centos.pool.ntp.org iburst',
						'server 1.centos.pool.ntp.org iburst',
						'server 2.centos.pool.ntp.org iburst',
						'server 3.centos.pool.ntp.org iburst',
      ]
}
