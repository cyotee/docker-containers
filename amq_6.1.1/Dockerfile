### Set the base image to Fedora
FROM jboss/base-jdk:7

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install AMQ 6.1.1
USER root
ADD installs/jboss-a-mq-6.1.1.redhat-412.zip /tmp/jboss-a-mq-6.1.1.redhat-412.zip
RUN unzip /tmp/jboss-a-mq-6.1.1.redhat-412.zip
ADD docker_init.sh /opt/jboss/jboss-a-mq-6.1.1.redhat-412/docker_init.sh

### Set Environment
ENV KARAF_HOME /opt/jboss/jboss-a-mq-6.1.1.redhat-412

### Set Permissions
RUN chown -R jboss:jboss $KARAF_HOME
RUN chmod 755 $KARAF_HOME/docker_init.sh
USER jboss

### Create A-MQ User
RUN sed -i "s/#admin/admin/" $KARAF_HOME/etc/users.properties
RUN sed -i "s/#activemq.jmx.user/activemq.jmx.user/" $KARAF_HOME/etc/system.properties
RUN sed -i "s/#activemq.jmx.password/activemq.jmx.password/" $KARAF_HOME/etc/system.properties

### Open Ports
# SSH, Karaf-ssh, Web, rmiServerPort, rmiRegistry, ActiveMQ
EXPOSE 22 8101 8181 44444 1099 61616 

### Start A-MQ
ENTRYPOINT $KARAF_HOME/docker_init.sh

