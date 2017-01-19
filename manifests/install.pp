class openstack::install inherits openstack
{
	if $package_manage == true { 

    Package {       
    ensure               => $package_ensure,         
    }
        
	    package { $package_name : } 
  }  


}