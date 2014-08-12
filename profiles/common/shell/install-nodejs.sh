yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm > $PRV_LOG_OUT 2> $PRV_LOG_ERR
yum -y install nodejs npm --enablerepo=epel > $PRV_LOG_OUT 2> $PRV_LOG_ERR
