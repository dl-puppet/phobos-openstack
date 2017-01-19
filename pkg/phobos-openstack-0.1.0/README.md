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





