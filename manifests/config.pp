class openstack::config inherits openstack
{
            File {
              ensure          => $openstack::file_ensure,
              group           => $openstack::file_group,
              mode            => $openstack::file_mode,
              owner           => $openstack::file_owner,
              backup          => $openstack::file_backup,
            }
               
                file {

                    ###### CHRONY #####
				            "/etc/chrony.conf" :
				            content => template("openstack/ntp/chrony.conf.erb");   
				      			        
	                  ###### MESSAGES #####
                    "/etc/issue.net" :
                    content => template("openstack/messages/issue.net.erb");   
  
                    "/etc/motd" :
                    content => template("openstack/messages/motd.erb"); 
                                           			        
				            ###### NETWORK ALL#####                
                    # /etc/services: 
                    # http://www.iana.org/assignments/port-numbers
                    # port (entre 0 et 1023) sont réservés pour les applications « standards 
                    # port pour les applications développées par les utilisateurs (1024 à 65535).
                    "/etc/services" :
                    content => template("openstack/network/services.erb");

                    # /etc/sysctl.conf: 
                    #  Paramètres par défaut du système #vivent dans /usr/lib/sysctl.d/00-openstack.conf.
                    "/etc/sysctl.conf" :
                    content => template("openstack/network/sysctl.erb");
                    
                    # /etc/sysconfig/network (/etc/hostname):
                    "/etc/sysconfig/network" :
                    content => template("openstack/network/network.erb");
             
                    # /etc/networks :
                    # Permet d'affecter un nom logique à un réseau (definition des domains)
                    # permet par exemple d'adresser un réseau (route) sur son nom, plutôt que sur son adresse.
                    "/etc/networks" :
                    content => template("openstack/network/networks.erb");
                    
                    # /etc/host.conf:
                    # Donne l'ordre dans lequel le processus de résolution de noms est effectué.
                    "/etc/host.conf" :
                    content => template("openstack/network/host.conf.erb");
                    
                    # /etc/hosts: 
                    # Moyen d'assurer la résolution de noms, de donner un nom FQDN à un hôte
                    #"/etc/hosts" :
                    #content => template("openstack/network/hosts.erb");
                     
                    # /etc/resolv.conf:
                    # Permet d'affecter les serveurs de noms. 
                    # ATTENTION !!! Il peut etre configurer via DHCP
                    "/etc/resolv.conf" :
                    content => template("openstack/network/resolv.erb");

                    # Configuration des interfaces reseaux:
                    # Configuration /etc/sysconfig/network-scripts/ifcfg-eth0:
		                "/etc/sysconfig/network-scripts/ifcfg-eth0" :
		                content => template("openstack/network/ifcfg-eth0.erb"),
		                #replace => "no";
                    #notify  => Service['$openstack::service_name'];
                    
                    # Configuration de la route eth0:
                    "/etc/sysconfig/network-scripts/route-eth0" :
                    content => template("openstack/network/route-eth0.erb");
                         
                    # Configuration /etc/sysconfig/network-scripts/ifcfg-eth1:
                    "/etc/sysconfig/network-scripts/ifcfg-eth1" :
                    content => template("openstack/network/ifcfg-eth1.erb"),  
              }
}