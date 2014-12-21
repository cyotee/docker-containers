#!/bin/sh

# Check if container is already started
./stop.sh

# Start FSW server container
echo "Starting FSW server ..."
image=$(docker run -d -P bsaunder/fsw_6.0)
ip=$(docker inspect $image | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image > docker_fsw600.pid

# Get server Ports
port_map=$(docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $image)
admin_port=$(echo $port_map | grep -Po '9990/tcp -> \K([0-9]+)')
web_port=$(echo $port_map | grep -Po '8080/tcp -> \K([0-9]+)')

# Wait until EAP starts
let maxLoops=30 timeToSleep=5 success=0
for (( try=0; try < maxLoops; ++try )); do
  echo -n "."
  if curl -s -o /dev/null http://localhost:$web_port/; then
    success=1
    break
  fi
  sleep $timeToSleep
done
echo ""

# End
if (( success )); then
  echo "Server started."
  echo "Port Mapping: $port_map"
  echo "FSW server started in http://localhost:$web_port/"
  echo "Management console started at http://localhost:$admin_port/"
else
  echo "Server Start Failed"
fi

exit $(( 1-success ))
