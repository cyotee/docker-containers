#!/bin/sh

# Check if container is already started
if [ -f docker_derby101011.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker_derby101011.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker_derby101011.pid
fi

# Start PostgreSQL server container
echo "Starting DerbyDB 10.10.1.1 server ..."
image_derby=$(docker run -d -P bsaunder/derby_10.10.1.1)
ip_derby=$(docker inspect $image_derby | grep IPAddress | awk '{print $2}' | tr -d '",')
echo $image_derby > docker_derby101011.pid

# End
echo "Installation finished"
echo ""
echo "DerbyDB server started in $ip_derby:1527"
echo "Try to connect: "
echo "    java -jar $DERBY_HOME/lib/derbyrun.jar ij"
echo "    CONNECT 'jdbc:derby://$ip_derby:1527/testdb;create=true';"
