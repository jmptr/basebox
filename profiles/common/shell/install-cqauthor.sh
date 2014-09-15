
host_dir=$PRV_COMMON/files/cq
guest_dir=/var/www/cq/Author

jar_url=https://s3-us-west-2.amazonaws.com/jmptr-public
jar_name=cq5-author-p4502.jar

if [ ! -f $host_dir/license.properties ]; then
  echo "*****************************************"
  echo "*****************************************"
  echo "*   ERROR: NO license.properties FILE   *"
  echo "*   GOES IN  profiles/common/files/cq   *"
  echo "*****************************************"
  exit
fi

if [ ! -f $host_dir/$jar_name ]; then
  echo "Caching provision file: $jar_name"
  wget -O $host_dir/$jar_name $jar_url/$jar_name --no-check-certificate
  echo "Cached provision file: $jar_name"
fi

mkdir -p $guest_dir

cp $host_dir/$jar_name $guest_dir/$jar_name
cp $host_dir/license.properties $guest_dir/license.properties

cd $guest_dir
java -jar $jar_name -unpack
