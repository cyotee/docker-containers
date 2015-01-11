#!/bin/bash

# Start Fuse
echo "Starting fuse..."
/opt/jboss/jboss-fuse-6.0.0.redhat-024/bin/start
sleep 10
echo "Fuse started"

tail -f /opt/jboss/jboss-fuse-6.0.0.redhat-024/data/log/fuse.log
