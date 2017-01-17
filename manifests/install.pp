class openstack::install inherits openstack
{
	if $openstack::package_manage == true { 

    Package {       
    ensure               => $package_ensure,         
    #before => File['$openstack::file_name'] 
    }
        
	    package { $openstack::package_name : } 
  }  
}