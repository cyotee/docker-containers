#!/bin/sh

# Create container
echo "Creating MongoDB container ..."
docker build --rm -q -t bsaunder/mongodb ./docker

if [ $? -eq 0 ]; then
    echo "Container Built"
else
    echo "Error Building Container"
fi


