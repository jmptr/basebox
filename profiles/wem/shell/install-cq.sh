
host_files=/boxes/common/files

guest_dir=/var/www/cq/Author

jar_url=https://s3-us-west-2.amazonaws.com/jmptr-public
jar_name=cq5-author-p4502.jar

if [ ! -f $host_files/$jar_name ]; then
  echo "Caching provision file: $jar_name"
  wget -O $host_files/$jar_name $jar_url/$jar_name
  echo "Cached provision file: $jar_name"
fi

if [ ! -f $host_files/license.properties ]; then
  echo "*****************************************"
  echo "*****************************************"
  echo "*   ERROR: NO license.properties FILE   *"
  echo "*****************************************"
  echo "*****************************************"
fi

mkdir -p $guest_dir

cp $host_files/$jar_name $guest_dir/$jar_name
cp $host_files/license.properties $guest_dir/license.properties

cd $guest_dir
java -jar $jar_name -unpack
