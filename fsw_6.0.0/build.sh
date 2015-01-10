#!/bin/sh

if [ ! -e installs/jboss-fsw-installer-6.0.0.GA-redhat-4.jar ]
then
   echo "You should get the required FSW install binary before trying to build this image."
   exit 255
fi

# Create containers
echo "Creating FSW 6.0 Container ..."
docker build -q --rm -t bsaunder/fsw_6.0 .

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi

