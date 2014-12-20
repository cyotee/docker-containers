### Set the base image to Fedora
FROM fedora:21

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install Base Software
RUN yum install -y net-tools; yum clean all
RUN yum install -y java-1.8.0-openjdk; yum clean all
RUN yum install -y unzip; yum clean all
RUN yum install -y wget; yum clean all

### Set Environment
ENV JAVA_HOME /usr/lib/jvm/jre
ENV PATH $PATH:$JAVA_HOME/bin

### Install DerbyDB
RUN wget http://archive.apache.org/dist/db/derby/db-derby-10.10.1.1/db-derby-10.10.1.1-bin.zip
RUN mkdir /opt/apache
RUN mv db-derby-10.10.1.1-bin.zip /opt/apache
RUN cd /opt/apache; unzip db-derby-10.10.1.1-bin.zip

### Configure DerbyDB
ENV DERBY_HOME /opt/apache/db-derby-10.10.1.1-bin
ENV CLASSPATH ${DERBY_HOME}/lib/derbynet.jar:${DERBY_HOME}/lib/derbytools.jar:${DERBY_HOME}/lib/derbyclient.jar
RUN sed -i -e 's/};/permission java.net.SocketPermission "localhost:1527", "listen";\n};/g' /usr/lib/jvm/jre/lib/security/java.policy

### Open Ports
EXPOSE 1527

### Start Services
CMD java -cp ${CLASSPATH} org.apache.derby.drda.NetworkServerControl start

