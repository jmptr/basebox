if [ ! -f /etc/yum.repos.d/mongodb.repo ]; then
  cp $PRV_COMMON/files/mongodb/mongodb.repo /etc/yum.repos.d/mongodb.repo
fi

yum -y install mongodb-org
service mongod start

