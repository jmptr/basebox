host_dir=$PRV_COMMON/files/maven

maven_url=http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.0.5/binaries
maven_tar=apache-maven-3.0.5-bin.tar.gz

if [ ! -f $host_dir/$maven_tar ]; then
  wget -O $host_dir/$maven_tar $maven_url/$maven_tar > $PRV_LOG_OUT 2> $PRV_LOG_ERR
fi

tar xzf $host_dir/$maven_tar -C /usr/local > $PRV_LOG_OUT 2> $PRV_LOG_ERR
cd /usr/local && ln -s apache-maven-3.0.5 maven > $PRV_LOG_OUT 2> $PRV_LOG_ERR
cp $host_dir/set-maven-env.sh /etc/profile.d/set-maven-env.sh > $PRV_LOG_OUT 2> $PRV_LOG_ERR

