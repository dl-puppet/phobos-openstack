class openstack::config inherits openstack
{
  # /etc/sysconfig/network-scripts/ifcfg-eth0:
  $resolv_device1               = $openstack::resolv_device1
  $resolv_name1                 = $openstack::resolv_name1
	$resolv_network               = $openstack::resolv_network
	$resolv_ipaddr                = $openstack::resolv_ipaddr
	$resolv_netmask               = $openstack::resolv_netmask
  $resolv_gateway               = $openstack::resolv_gateway
	$resolv_broadcast             = $openstack::resolv_broadcast

  # /etc/sysconfig/network-scripts/ifcfg-eth1:
  $resolv_device2               = $openstack::resolv_device2
  $resolv_name2                 = $openstack::resolv_name2  
  
	File {
      ensure          => $file_ensure,
      group           => $file_group,
      mode            => $file_mode,
      owner           => $file_owner,
      backup          => $file_backup,
      #require         => Class['$package_name'],
      notify          => Service['$service_name'], #Si le fichier change, notifier le service pour redemarrage
	}

			file { 			  
				
				    #"/etc/sysconfig/network-scripts/ifcfg-eth0":
            #content         => template("openstack/ifcfg-eth0.erb");
            #replace => "no";
            
            #"/etc/sysconfig/network-scripts/ifcfg-eth1":
            #content         => template("openstack/ifcfg-eth1.erb");
            #replace => "no";
            
            "/etc/chrony.conf":
            content         => template("openstack/chrony.conf.erb");
            #replace => "no";
			}
}