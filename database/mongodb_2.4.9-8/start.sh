#!/bin/sh

# Check if container is already started
if [ -f docker_mongodb2498.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker_mongodb2498.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker_mongodb2498.pid
fi

# Start MongoDB server container
echo "Starting MongoDB server ..."
image_mongodb=$(docker run -d -P bsaunder/mongodb)
ip_mongodb=$(docker inspect $image_mongodb | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_mongodb > docker_mongodb2498.pid

# Get server Ports
port_map=$(docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $image_mongodb)
cmd_port=$(echo $port_map | grep -Po '27017/tcp -> \K([0-9]+)')
web_port=$(echo $port_map | grep -Po '28017/tcp -> \K([0-9]+)')

# Wait until mongodb starts
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
  echo "MongoDB server started in localhost:$cmd_port"
  echo "Management console started at http://localhost:$web_port/"
else
  echo "Server start failed: connection timeout"
fi

exit $(( 1-success ))

