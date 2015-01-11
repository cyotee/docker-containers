### Set the base image to Fedora
FROM jboss/base-jdk:7

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install Fuse 6.0.0
USER root
ADD installs/jboss-fuse-full-6.0.0.redhat-024.zip /tmp/jboss-fuse-full-6.0.0.redhat-024.zip
RUN unzip /tmp/jboss-fuse-full-6.0.0.redhat-024.zip
ADD org.apache.activemq.webconsole.cfg /opt/jboss/jboss-fuse-6.0.0.redhat-024/etc/org.apache.activemq.webconsole.cfg
ADD docker_init.sh /opt/jboss/jboss-fuse-6.0.0.redhat-024/docker_init.sh

### Set Environment
ENV KARAF_HOME /opt/jboss/jboss-fuse-6.0.0.redhat-024

### Set Permissions
RUN chown -R jboss:jboss $KARAF_HOME
RUN chmod 755 $KARAF_HOME/docker_init.sh
USER jboss

### Create Fuse User
RUN sed -i "s/#admin/admin/" $KARAF_HOME/etc/users.properties
RUN sed -i "s/#activemq.jmx.user/activemq.jmx.user/" $KARAF_HOME/etc/system.properties
RUN sed -i "s/#activemq.jmx.password/activemq.jmx.password/" $KARAF_HOME/etc/system.properties
RUN sed -i "s/featuresBoot=/featuresBoot=webconsole,activemq-web-console,/" $KARAF_HOME/etc/org.apache.karaf.features.cfg

### Open Ports
# SSH, Karaf-ssh, Web, rmiServerPort, rmiRegistry, ActiveMQ, http, alt-http
EXPOSE 22 8101 8181 44444 1099 61616 80 8080 

### Start Fuse
ENTRYPOINT $KARAF_HOME/docker_init.sh
