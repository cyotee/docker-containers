# JBoss & Related Docker Containers
A collection of Docker Containers for JBoss products as well as supporting containers such as databases.

## Requirements
Docker-IO 1.0 or greater is required. It can be installed on **Fedora 19 and later** with:

    $ sudo yum -y install docker-io

Additional Installation Instructions can be found [here](https://docs.docker.com/installation/#installation "here").

## Usage
All of the included containers come with a set of 3 shell scripts for controlling them. 

- install.sh Builds the container
- start.sh Starts the container
- stop.sh Stops the container

In addition to the scripts included with each container, the utility directory contains additional useful shell scripts for working with docker.

## Special Thanks
Original work was done by [Pedro Lopez](https://github.com/plopezse/docker-containers "Pedro Lopez")
