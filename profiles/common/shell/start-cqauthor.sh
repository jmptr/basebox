
host_dir=/var/www/cq/Author/crx-quickstart/bin

echo "Restarting CQ Author instance"

echo "Please be patient, waiting for 200 response from CQ Author at :4502"
$host_dir/start > /dev/null 2> /dev/null
sleep 10

resp=$(curl -sL -u admin:admin -w %{http_code} http://localhost:4502 -o /dev/null)
while [ 1 ]; do
  [ $resp = "200" ] && break
  sleep 10
  resp=$(curl -sL -u admin:admin -w %{http_code} http://localhost:4502 -o /dev/null)
done

echo "Restarting CQ Author instance complete"
