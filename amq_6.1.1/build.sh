#!/bin/sh

if [ ! -e installs/jboss-a-mq-6.1.1.redhat-412.zip ]
then
   echo "You should get the required A-MQ binary before trying to build this image."
   exit 255
fi

# Create containers
echo "Creating A-MQ 6.1.1 Container ..."
docker build -q --rm -t bsaunder/amq_6.1.1 .

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi

