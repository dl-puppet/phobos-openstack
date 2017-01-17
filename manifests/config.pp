class openstack::config inherits openstack
{
	File {
      ensure          => $file_ensure,
      group           => $file_group,
      mode            => $file_mode,
      owner           => $file_owner,
      backup          => $file_backup,
	}

			file { 			  
				
				    "/etc/sysconfig/network-scripts/ifcfg-eth0":
            content         => template("openstack/ifcfg-eth0.erb");
            #replace => "no";
            
            #"/etc/sysconfig/network-scripts/ifcfg-eth1":
            #content         => template("openstack/ifcfg-eth1.erb");
            #replace => "no";
            
            "/etc/chrony.conf":
            content         => template("openstack/chrony.conf.erb");
			}
}