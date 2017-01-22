# phobos-openstack
Installation Openstack


Activer les Repos RedHat:
Epate necessaire pour les distribution Red Hat:
Sur RHEL, enregistrer votre système auprès du Gestionnaire de Souscription Red Hat, en utilisant vos nom et mot de passe d’utilisateur du portail client.
# subscription-manager register --username="USERNAME" --password="PASSWORD"

Trouver les pools d’habilitation contenant les canaux pour votre système RHEL :
# subscription-manager list --available

Utiliser les identifiants de pool trouvés à l’étape précédente pour attacher vos habilitations RHEL :
# subscription-manager attach --pool="POOLID"

Activer les dépôts nécessaires :
# subscription-manager repos --enable=rhel-7-server-optional-rpms –enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms



Activer le dépôt OpenStack

Sur CentOS :
Sur CentOS, le dépôt extras contient le RPM qui active le dépôt OpenStack. CentOS inclut par défaut le dépôt extras, vous pouvez donc simplement installer le package pour activer le dépôt OpenStack.
# yum install centos-release-openstack-mitaka

Sur RHEL :
Sur RHEL, télécharger et installer le dépôt RDO RPM pour activer le dépôt OpenStack.
# yum install https://rdoproject.org/repos/rdo-release.rpm


Finaliser l’installation:
# yum upgrade
Si la mise à jour inclut un nouveau noyau, redémarrer votre hôte pour l’activer.





MariaDB:
Fixez le service de base de données, y compris le choix d'un mot de passe approprié pour le compte root. En cas d'erreur vérifier que le service soit bien démarré.
# sudo mysql_secure_installation
-Entree
-yes
-mariadb_pass
-yes
-yes
-yes
-yes


Alimenter la Base
Avant de configurer les services OpenStack, vous devez créer une base de données pour chacun des services Openstack. Connectez-vous au serveur SQL est créer les différentes bases de données.
$ sudo mysql -u root -p

Création de la base de données pour Keystone:
CREATE DATABASE keystonedb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON keystonedb.* TO 'keystone'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON keystonedb.* TO 'keystone'@'%' IDENTIFIED BY 'PWDGOP';

Création de la base de données pour Cinder:
CREATE DATABASE cinderdb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON cinderdb.* TO 'cinder'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON cinderdb.* TO 'cinder'@'%' IDENTIFIED BY 'PWDGOP';

Création de la base de données pour Glance:
CREATE DATABASE glancedb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON glancedb.* TO 'glance'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON glancedb.* TO 'glance'@'%' IDENTIFIED BY 'PWDGOP';

Création de la base de données pour Nova et nova_api:
CREATE DATABASE novadb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON novadb.* TO 'nova'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON novadb.* TO 'nova'@'%' IDENTIFIED BY 'PWDGOP';
CREATE DATABASE nova_api CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'%' IDENTIFIED BY 'PWDGOP';

Création de la base de données pour Neutron:
CREATE DATABASE neutrondb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON neutrondb.* TO 'neutron'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON neutrondb.* TO 'neutron'@'%' IDENTIFIED BY 'PWDGOP';

Création de la base de données pour Heat:
CREATE DATABASE heatdb CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON heatdb.* TO 'heat'@'localhost' IDENTIFIED BY 'PWDGOP';
GRANT ALL PRIVILEGES ON heatdb.* TO 'heat'@'%' IDENTIFIED BY 'PWDGOP';

# exit



File de messages RABBITMQ:
Ajouter l’utilisateur openstack: (Remplacer RABBIT_PASS par un mot de passe approprié.)
# rabbitmqctl add_user openstack RABBIT_PASS
Creating user "openstack" ...
...done.

Permet la configuration, les accès en lecture et en écriture pour l’utilisateur openstack.
# rabbitmqctl set_permissions openstack ".*" ".*" ".*"
Setting permissions for user "openstack" in vhost "/" ...
...done.



Keystone:
Peupler la base de données de service d'identité:
# su -s /bin/sh -c "keystone-manage db_sync" keystone

Initialisation clés Fernet:
# keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
# keystone-manage credential_setup --keystone-user keystone --keystone-group keystone

Bootstrap the Identity service: (Remplacez ADMIN_PASS par un mot de passe approprié pour un utilisateur administratif.)
# keystone-manage bootstrap --bootstrap-password ADMIN_PASS \
  --bootstrap-admin-url http://controller:35357/v3/ \
  --bootstrap-internal-url http://controller:35357/v3/ \
  --bootstrap-public-url http://controller:5000/v3/ \
  --bootstrap-region-id RegionOne


Configurer le jeton d'authentification:
$ export OS_TOKEN=keytoken
Configurez le paramètre URL:
$ export OS_URL=http://controller:35357/v3
Configurez la version de l'API d'identité:
$ export OS_IDENTITY_API_VERSION=3

Créer l'entité de identity pour le service d'identité: 
$ openstack service create --name keystone --description "OpenStack Identity" identity
Créer les paramètres de l'API de service Keystone:
$ openstack endpoint create --region RegionOne identity public http://controller:5000/v3
$ openstack endpoint create --region RegionOne identity internal http://controller:35257/v3
$ openstack endpoint create --region RegionOne identity admin http://controller:35357/v3

Créer le projet de service qui contiendra tous les service openstack :*
Nous créons un projet de service qui contient un utilisateur unique pour chaque service que vous ajoutez à votre environnement. 
$ openstack project create --domain default --description "Service Project" service
 Les types de services peuvent être : compute, object-store, image-service ou identity-service.

Créer le user et service Glance
Créer l'utilisateur de Glance.
$ openstack user create --domain default --password-prompt glance
Ajouter le rôle admin pour l’utilisateur Glance.
$ openstack role add --project service --user glance admin
Créer l'entité de service Glance: 
$ openstack service create --name glance   --description "OpenStack Image service" image
Créer les paramètres de l'API Glance:
$ openstack endpoint create --region RegionOne   image public http://controller:9292
$ openstack endpoint create --region RegionOne   image internal http://controller:9292
$ openstack endpoint create --region RegionOne   image admin http://controller:9292

Créer le user et service Nova
$ openstack user create --domain default --password-prompt nova
$ openstack role add --project service --user nova admin
$ openstack service create --name nova   --description "OpenStack Compute" compute
$ openstack endpoint create --region RegionOne   compute public http://controller:8774/v2.1/%\(tenant_id\)s
$ openstack endpoint create --region RegionOne   compute internal http://controller:8774/v2.1/%\(tenant_id\)s
$ openstack endpoint create --region RegionOne  compute admin http://controller:8774/v2.1/%\(tenant_id\)s

Créer le user et service Cinder
$ openstack user create --domain default --password-prompt cinder
$ openstack role add --project service --user cinder admin
$ openstack service create --name cinder   --description "cinder volumes" volume
$ openstack endpoint create --region RegionOne   cinder public http://controller:8776/v2/%\(tenant_id\)s
$ openstack endpoint create --region RegionOne   cinder internal http://controller:8776/v2/%\(tenant_id\)s
$ openstack endpoint create --region RegionOne  cinder admin http://controller:8776/v2/%\(tenant_id\)s

Créer le user et service Neutron
$ openstack user create --domain default --password-prompt neutron
$ openstack role add --project service --user neutron admin
$ openstack service create --name neutron --description "OpenStack Networking" network
$ openstack endpoint create --region RegionOne network public http://controller:9696
$ openstack endpoint create --region RegionOne network internal http://controller:9696
$ openstack endpoint create --region RegionOne network admin http://controller:9696


Vérifier Keystone ¶
Pour des raisons de sécurité, désactiver le mécanisme jeton d'authentification temporaire. 
Modifiez le fichier /etc/keystone/keystone-paste.ini et retirer admin_token_auth du [pipeline: public_api], [pipeline: admin_api] et [pipeline: api_v3] sections. 

export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_TENANT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=PWD
export OS_AUTH_URL=http://controller:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2


Puis, Unset les variables d’environnements temporaires OS_TOKEN et OS_URL
$ unset OS_TOKEN OS_URL

En tant qu'utilisateur admin, demander un jeton d'authentification: Cette commande utilise le mot de passe pour l'utilisateur admin.
$ openstack --os-auth-url http://controller:35357/v3 --os-project-domain-name default --os-user-domain-name default --os-project-name admin --os-username admin token issue




GLANCE:
Peupler la base de données de service de l'image:
# su -s /bin/sh -c "glance-manage db_sync" glance













