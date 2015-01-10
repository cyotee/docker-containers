#!/bin/bash

# Start Fuse
echo "Starting fuse..."
/opt/jboss/jboss-a-mq-6.0.0.redhat-024/bin/start
sleep 30
echo "Fuse started"

tail -f /opt/jboss/jboss-a-mq-6.0.0.redhat-024/data/log/amq.log
