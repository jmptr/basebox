

host_dir=/var/www/cq/Author/crx-quickstart/bin

echo "Restarting CQ Author instance"
echo "Please be patient, waiting for 202 response from CQ Author"
$host_dir/stop
sleep 3

$host_dir/start
sleep 10

resp=$(curl -sL -u admin:admin -w %{http_code} http://localhost:4502 -o /dev/null)
while [ 1 ]; do
  [ $resp = "200" ] && break
  sleep 3
  resp=$(curl -sL -u admin:admin -w %{http_code} http://localhost:4502 -o /dev/null)
done

echo "Restarting CQ Author instance complete"
