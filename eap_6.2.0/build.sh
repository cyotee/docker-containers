#!/bin/sh

if [ ! -e installs/jboss-eap-6.2.0.zip ]
then
   echo "You should get the required EAP binary before trying to build this image."
   exit 255
fi

# Create containers
echo "Creating EAP 6.2 Container ..."
docker build -q --rm -t bsaunder/eap_6.2-standalone .

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi

