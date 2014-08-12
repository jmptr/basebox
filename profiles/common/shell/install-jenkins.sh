
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo > $PRV_LOG_OUT 2> $PRV_LOG_ERR
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key > $PRV_LOG_OUT 2> $PRV_LOG_ERR
yum -y install jenkins > $PRV_LOG_OUT 2> $PRV_LOG_ERR
service jenkins start > $PRV_LOG_OUT 2> $PRV_LOG_ERR
