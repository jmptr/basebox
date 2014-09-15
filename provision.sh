export PRV_ROOT=/vagrant/profiles
export PRV_COMMON=$PRV_ROOT/common
export PRV_SHELL=$PRV_COMMON/shell
export PRV_HOST=$PRV_ROOT/$1

provisions_file=$PRV_HOST/provisions

if [ ! -d $PRV_HOST ]; then
  echo "No profile set up for $1, exiting"
  exit
fi

if [ ! -f $provisions_file ]; then
  echo "No provisions at $provisions_file, exiting"
  exit
fi

while read line into provisions
do
  provision_exec=$PRV_SHELL/$line.sh

  if [ ! -f $provision_exec ]; then
    echo "Cannot provision $line, $provision_exec does not exist"
  else
    echo "Common provisioner: $provision_exec"
    $provision_exec
  fi
done < $provisions_file

if [ -d $PRV_HOST/shell ]; then
  for i in $PRV_HOST/shell/*.sh
  do
    echo "Local provisioner: $i"
    $i
  done
fi

echo "Provisioning complete, logs are in /vagrant/logs"
