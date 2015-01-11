#!/bin/sh

# Check if container is already started
./stop.sh

# Start Fuse server container
echo "Starting Fuse server ..."
image=$(docker run -d -P bsaunder/fuse_6.0.0)
ip=$(docker inspect $image | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image > docker_fuse600.pid

# Get server Ports
port_map=$(docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $image)
web_port=$(echo $port_map | grep -Po '8181/tcp -> \K([0-9]+)')

# Wait until Fuse starts
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
  echo "Fuse server started at http://localhost:$web_port/system/console"
  echo "ActiveMQ Console start at http://localhost:$web_port/activemqweb"
else
  echo "Server Start Failed"
fi

exit $(( 1-success ))
