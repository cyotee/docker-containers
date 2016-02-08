# Start Fuse
echo "Starting fuse..."
/opt/jboss/jboss-fuse-6.1.1.redhat-457/bin/start
#sleep 30
sleep 10
echo "Fuse Starting"
sleep 20
echo "Fuse started"

tail -f /opt/jboss/jboss-fuse-6.1.1.redhat-457/data/log/fuse.log
