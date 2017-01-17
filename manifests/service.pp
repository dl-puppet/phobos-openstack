class openstack::service inherits openstack
{
        service { $service_name :
            ensure      => $service_ensure,
            enable      => $service_enable,
        }  
           
        service { "NetworkManager" :
            ensure       => stopped,
            enable       => false,
            
        }
}