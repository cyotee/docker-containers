#!/bin/sh

if [ ! -e installs/jboss-eap-6.1.1.zip ]
then
   echo "You should get the required EAP binary before trying to build this image."
   exit 255
fi

# Create containers
echo "Creating EAP 6.1.1 Container ..."
docker build -q --rm -t bsaunder/eap_6.1.1-standalone .

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi

