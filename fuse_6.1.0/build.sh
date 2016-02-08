if [ ! -e installs/jboss-fuse-full-6.1.1.redhat-457.zip ]
then
   echo "You should get the required Fuse binary before trying to build this image."
   exit 255
fi

# Create containers
echo "Creating Fuse 6.1.1 Container ..."
docker build -q --rm -t docker.io/cyotee/fuse_6.1.1 .

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi

