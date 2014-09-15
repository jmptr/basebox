
if [ ! -d $PRV_HOST ]; then
  echo "Cannot find host directory: $PRV_HOST"
  exit
fi

for i in $PRV_HOST/files/mongodb/*.js
do
  echo "Executing mongodb configuration: $i"
  mongo $i
done

