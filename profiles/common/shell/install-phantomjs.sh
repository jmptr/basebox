host_root=$PRV_COMMON/files/phantomjs
host_bin=$PRV_COMMON/files/phantomjs-1.9.7-linux-x86_64/bin

guest_dir=/usr/bin

url_root=https://bitbucket.org/ariya/phantomjs/downloads
archive_file=phantomjs-1.9.7-linux-x86_64.tar.bz2

yum -y install yum install fontconfig freetype libfreetype.so.6 libfontconfig.so.1 libstdc++.so.6

if [ ! -f $host_root/$archive_file ]; then
  wget -O $host_root/$archive_file $url_root/$archive_file --no-check-certificate
  tar -xf $host_root/$archive_file -C $host_root
fi

cp $host_bin/phantomjs $guest_dir/phantomjs
