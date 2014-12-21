#!/bin/sh

# Check if container is already started
if [ -f docker_eap601standalone.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker_eap601standalone.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker_eap601standalone.pid
fi

