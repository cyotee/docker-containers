### Set the base image to Fedora
FROM fedora:21

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install MongoDB
RUN yum -y install mongodb-server-2.4.9-8.fc21 net-tools; yum clean all

### Configure MongoDB 
RUN mkdir -p /data/db

### Open Ports 
EXPOSE 22
EXPOSE 27017
EXPOSE 28017

### Start MongoDB
ENTRYPOINT ["/usr/bin/mongod"]

