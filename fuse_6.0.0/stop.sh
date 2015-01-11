#!/bin/sh

# Check if container is already started
if [ -f docker_fuse600.pid ]; then
    echo "Container is already started"
    container_id=$(cat docker_fuse600.pid)
    echo "Stoping container $container_id..."
    docker stop $container_id
    rm -f docker_fuse600.pid
fi

