guest_root_dir=/var/lib/jenkins
guest_jobs_dir=$guest_root_dir/jobs

host_root_dir=/vagrant/provisions/files/jenkins
host_jobs_dir=$host_root_dir/jobs

echo "Install Jenkins jobs"

mkdir -p $guest_jobs_dir

for i in $host_jobs_dir/*.xml
do
  filename="${i##*/}"
  filename=${filename%.*}
  echo $filename
  if [ ! -d $guest_jobs_dir/$filename ]; then
    mkdir -p $guest_jobs_dir/$filename
    cp $i $guest_jobs_dir/$filename/config.xml
  fi
done

chgrp -R jenkins $guest_root_dir
chown -R jenkins $guest_root_dir

service jenkins restart
