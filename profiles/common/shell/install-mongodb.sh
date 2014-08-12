if [ ! -f /etc/yum.repos.d/mongodb.repo ]; then
  cp $PRV_COMMON/files/mongodb/mongodb.repo /etc/yum.repos.d/mongodb.repo
fi

yum -y install mongodb-org > $PRV_LOG_OUT 2> $PRV_LOG_ERR
service mongod start > $PRV_LOG_OUT 2> $PRV_LOG_ERR

