
host_dir=/vagrant/provisions/files/jenkins/config
guest_dir=/var/lib/jenkins

cp -r $host_dir $guest_dir

mkdir -p $guest_dir/.ssh
host_dir=/vagrant/provisions/files/jenkins/.ssh
guest_dir=/var/lib/jenkins/.ssh

cp -r $host_dir $guest_dir

chgrp -R jenkins $guest_dir
chown -R jenkins $guest_dir

service jenkins restart
