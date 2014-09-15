java_url=https://s3-us-west-2.amazonaws.com/jmptr-public
java_bin=jdk-6u45-linux-x64-rpm.bin

if [ ! -f $PRV_COMMON/files/java/$java_bin ]; then
  wget -O $PRV_COMMON/files/java/$java_bin $java_url/$java_bin --no-check-certificate
fi

chmod +x $PRV_COMMON/files/java/$java_bin
$PRV_COMMON/files/java/$java_bin

if [ ! -f /etc/profile.d/set-java-env.sh ]; then
  cp $PRV_COMMON/files/java/set-java-env.sh /etc/profile.d/set-java-env.sh
fi

